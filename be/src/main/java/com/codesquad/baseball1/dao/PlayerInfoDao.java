package com.codesquad.baseball1.dao;

import com.codesquad.baseball1.dto.BoardDto;
import com.codesquad.baseball1.dto.MatchDto;
import com.codesquad.baseball1.dto.PlayerInfoDto;
import com.codesquad.baseball1.dto.TeamDto;
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

    public Object findPlayersInfo(int teamId) {
        String sql = "SELECT hitter_name, average FROM hitter JOIN team ON hitter.team_id = team.team_id WHERE team.team_id =" +teamId;
//        String sql = "SELECT hitter_name, average, out_score, hit_score, plate_appearance FROM hitter JOIN team ON hitter.team_id = team.team_id WHERE team.team_id =" + teamId;


        RowMapper<Object> PlayersRowMapper = (rs, rowNum) -> {
            PlayerInfoDto playerInfoDto = new PlayerInfoDto
                    .Builder(rs.getString("hitter_name"))
                    .average(rs.getInt("average"))
//                    .outScore(rs.getInt("out_score"))
//                    .hitScore(rs.getInt("hit_score"))
//                    .plateAppearance(rs.getInt("plate_appearance"))
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


//    public Object makePlayerInfoBoard(int matchId) {
//        String sql = "SELECT matches.match_id " +
//                "FROM matches ";
//
//        RowMapper<Object> teamRowMapper = (rs, rowNum) -> {
//            BoardDto boardDto = new BoardDto();
//            boardDto.setMatchId(matchId);
//            boardDto.setHome(findPlayersInfo(rs.getInt("team_id")));
//            boardDto.setAway(findPlayersInfo(rs.getInt("team_id")));
//            return boardDto;
//        };
//        return jdbcTemplate.query(sql, teamRowMapper);
//    }
}
