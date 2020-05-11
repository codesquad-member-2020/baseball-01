package com.codesquad.baseball1.controller;

import com.codesquad.baseball1.dto.ResponseDto;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
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

    @GetMapping("/scores")
    public ResponseDto showScores(){
        List<Integer> homeScores = getScores("'home'");
        List<Integer> awayScores = getScores("'away'");

        ArrayList<List> scores = new ArrayList<>();
        scores.add(homeScores);
        scores.add(awayScores);

        return new ResponseDto(200, "scores", scores);
    }

    public List<Integer> getScores(String homeOrAway) {
        String sql = "SELECT hit_score from halfInning where outSum = 3 and status =" + homeOrAway;
        return jdbcTemplate.queryForList(sql, Integer.class);
    }
}
