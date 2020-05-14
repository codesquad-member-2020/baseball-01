package com.codesquad.baseball1.dao;

import com.codesquad.baseball1.dto.SetupDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;

@Repository
public class SetupDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public SetupDao(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public SetupDto getSetupData(int teamId) {
        String sql = "select team_name, logo.url, pitcher_name, total_hit_count, hitter_name " +
        "from team " +
        "INNER JOIN logo " +
        "ON logo.logo_id = team.logo_id " +
        "INNER JOIN pitcher " +
        "ON pitcher.pitcher_id = team.pitcher_id " +
        "INNER JOIN record " +
        "ON record.hitter_number = 1 and record.team_id = ? " +
        "where team.team_id = ?";

        return  jdbcTemplate.queryForObject(sql, new Object[]{teamId, teamId}, BeanPropertyRowMapper.newInstance(SetupDto.class));
    }
}
