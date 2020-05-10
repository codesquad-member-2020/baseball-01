package com.codesquad.baseball1.dao;

import com.codesquad.baseball1.dto.TeamDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.List;

@Repository
public class MatchDao {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public MatchDao(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public List<Object> findTeam() {
        String sql = "SELECT team_name, user_name, logo.url " +
                "FROM team " +
                "JOIN logo " +
                "ON logo.logo_id = team.logo_id ";

        RowMapper<Object> teamsRowMapper = (rs, rowNum) -> {
            TeamDto teamDto = new TeamDto.Builder(rs.getString("team_name"))
                    .player(rs.getString("user_name"))
                    .logoIamge(rs.getString("url"))
                    .build();
            return teamDto;
        };

        return jdbcTemplate.query(sql, teamsRowMapper);
    }
}
