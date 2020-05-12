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
        String sql = "SELECT team_id, team_name, user_name, logo.url " +
                "FROM team " +
                "JOIN logo " +
                "ON logo.logo_id = team.logo_id " +
                "WHERE team.match_id = ? " +
                "AND team.team_type = ?";

        RowMapper<Object> teamsRowMapper = (rs, rowNum) -> {
            TeamDto teamDto = new TeamDto.Builder(rs.getInt("team_id"))
                    .teamName(rs.getString("team_name"))
                    .player(rs.getBoolean("user_name"))
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
}
