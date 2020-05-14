package com.codesquad.baseball1.dao;

import com.codesquad.baseball1.dto.PlayerInfoDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;

@Repository
public class PlayerInfoDao {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public PlayerInfoDao(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public Object findPlayersInfoByTeamId(int teamId) {
        String sql = "SELECT hitter_name, average, plate_appearance, total_hit_count, total_out_count FROM record JOIN team ON record.team_id = team.team_id WHERE team.team_id =" +teamId;

        RowMapper<Object> PlayersRowMapper = (rs, rowNum) -> {
            PlayerInfoDto playerInfoDto = new PlayerInfoDto
                    .Builder(rs.getString("hitter_name"))
                    .average(rs.getInt("average"))
                    .outScore(rs.getInt("total_out_count"))
                    .hitScore(rs.getInt("total_hit_count"))
                    .plateAppearance(rs.getInt("plate_appearance"))
                    .build();
            return playerInfoDto;
        };
        return jdbcTemplate.query(sql, PlayersRowMapper);
    }

    public String findTeamName(int teamId) {
        String sql = "SELECT team_name FROM team WHERE team_id =" +teamId;
        String teamName = (String) jdbcTemplate.queryForObject(sql, String.class);
        return teamName;
    }


}
