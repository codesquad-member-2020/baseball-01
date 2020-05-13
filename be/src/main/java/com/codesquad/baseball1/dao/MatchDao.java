package com.codesquad.baseball1.dao;

import com.codesquad.baseball1.dto.MatchDto;
import com.codesquad.baseball1.dto.TeamDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;

@Repository
public class MatchDao {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public MatchDao(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    private Object findTeam(int matchId, String teamType) {
        String sql = "SELECT team_id, team_name, user_status, logo.url " +
                "FROM team " +
                "JOIN logo " +
                "ON logo.logo_id = team.logo_id " +
                "WHERE team.match_id = ? " +
                "AND team.team_type = ?";

        RowMapper<Object> teamsRowMapper = (rs, rowNum) -> {
            TeamDto teamDto = new TeamDto.Builder(rs.getInt("team_id"))
                    .teamName(rs.getString("team_name"))
                    .userStatus(rs.getBoolean("user_status"))
                    .logoImage(rs.getString("url"))
                    .build();
            return teamDto;
        };

        return jdbcTemplate.queryForObject(sql, new Object[]{matchId, teamType}, teamsRowMapper);
    }

    private Object findReadyTeam(int matchId, String teamType) {
        String sql = "SELECT team_id, team_name, user_status " +
                "FROM team " +
                "WHERE team.match_id = ? " +
                "AND team.team_type = ?";

        RowMapper<Object> readyTeamRowMapper = (rs, rowNum) -> {
            TeamDto readyTeamDto = new TeamDto.Builder(rs.getInt("team_id"))
                    .teamName(rs.getString("team_name"))
                    .userStatus(rs.getBoolean("user_status"))
                    .build();
            return readyTeamDto;
        };

        return jdbcTemplate.queryForObject(sql, new Object[]{matchId, teamType}, readyTeamRowMapper);
    }

    public Object findMatches() {
        String sql = "SELECT matches.match_id " +
                "FROM matches ";

        RowMapper<Object> matchesRowMapper = (rs, rowNum) -> {
            MatchDto matchDto = new MatchDto();
            matchDto.setMatchId(rs.getInt("match_id"));
            matchDto.setHome(findTeam(rs.getInt("match_Id"), "home"));
            matchDto.setAway(findTeam(rs.getInt("match_Id"), "away"));
            return matchDto;
        };
        return jdbcTemplate.query(sql, matchesRowMapper);
    }

    public Object findReadyMatch(int matchId) {
        String sql = "SELECT matches.match_id " +
                "FROM matches " +
                "WHERE match_id = ?";

        RowMapper<Object> readyMatchRowMapper = (rs, rowNum) -> {
            MatchDto matchDto = new MatchDto();
            matchDto.setMatchId(rs.getInt("match_id"));
            matchDto.setHome(findReadyTeam(rs.getInt("match_Id"), "home"));
            matchDto.setAway(findReadyTeam(rs.getInt("match_Id"), "away"));
            return matchDto;
        };
        return jdbcTemplate.queryForObject(sql, new Object[]{matchId}, readyMatchRowMapper);
    }

    public boolean findUserStatusById(int teamId) {
        String sql = "SELECT team.user_status " +
                "FROM team " +
                "WHERE team_id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{teamId}, Boolean.class);
    }

    public void updateTrue(int teamId) {
        String sql = "UPDATE team " +
                "SET user_status = ? " +
                "WHERE team_id = ? ";
        jdbcTemplate.update(sql, true, teamId);
    }

}
