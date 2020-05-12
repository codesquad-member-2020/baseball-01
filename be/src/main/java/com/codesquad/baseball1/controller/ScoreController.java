package com.codesquad.baseball1.controller;

import com.codesquad.baseball1.dto.ResponseDto;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@RestController @Getter @Setter
public class ScoreController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public ScoreController(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    private ArrayList<List> scores = new ArrayList<>();

    @GetMapping("/matches/{matchId}/scores")
    public ResponseDto showScores(@PathVariable int matchId){
        List<Integer> homeScores = getScores("'home'", matchId);
        List<Integer> awayScores = getScores("'away'", matchId);

        ArrayList<List> scores = new ArrayList<>();
        scores.add(homeScores);
        scores.add(awayScores);

        return new ResponseDto(200, "scores", homeScores, awayScores);
    }

//    @GetMapping("/score/home")
//    public List<Integer> scorePractice1(String homeOrAway) {
//        return getScores("'home'");
//    }
//
//    @GetMapping("/score/away/{matchId}")
//    public List<Integer> scorePractice2(String homeOrAway) {
//        return getScores("'away'", matchId);
//    }

    public List<Integer> getScores(String homeOrAway, int matchId) {
        String sql = "SELECT hit_score from halfInning where outSum = 3 and match_id = ? and status =" + homeOrAway;
        return jdbcTemplate.queryForList(sql, new Object[]{matchId}, Integer.class);
    }
}
