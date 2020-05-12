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
        String sql = "SELECT team_name, user_name, logo.url " +
                "FROM team " +
                "JOIN logo " +
                "ON logo.logo_id = team.logo_id " +
                "WHERE team.match_id = ? " +
                "AND team.team_type = ?";

        RowMapper<Object> teamsRowMapper = (rs, rowNum) -> {
            TeamDto teamDto = new TeamDto.Builder(rs.getString("team_name"))
                    .player(rs.getString("user_name"))
                    .logoImage(rs.getString("url"))
                    .build();
            return teamDto;
        };

        return jdbcTemplate.queryForObject(sql, new Object[]{matchId, teamType}, teamsRowMapper);
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


    public String findTeamNameByMatchId(int matchId, String homeOrAway) {
        String sql = "SELECT team_name from team where team.match_id = ? and team.team_type = " + homeOrAway;
        String teamName = (String) jdbcTemplate.queryForObject(sql, new Object[]{matchId},String.class);
        return teamName;
    }

    public Integer findTeamIdByMatchId(int matchId, String homeOrAway) {
        String sql = "SELECT team_id from team where team.match_id = ? and team.team_type = " + homeOrAway;
        int teamId = jdbcTemplate.queryForObject(sql, new Object[]{matchId},Integer.class);
        return teamId;
    }
}
