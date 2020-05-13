package com.codesquad.baseball1.controller;

import com.codesquad.baseball1.dao.LogDao;
import com.codesquad.baseball1.dao.RecordDao;
import com.codesquad.baseball1.domain.Hitter;
import com.codesquad.baseball1.dto.InitDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@RestController
public class TestController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private LogDao logDao;

    @Autowired
    private RecordDao recordDao;

    public TestController(DataSource dataSource) { jdbcTemplate = new JdbcTemplate(dataSource);}

    @GetMapping("/test")
    public InitDto test() {


        List<Object> homeInfo = new ArrayList<>();
        List<Hitter> homeHitters = recordDao.findThreePlayersByTeamId(1);

        String teamName = "기아";
        int teamScore = 1;
        String halfInning = "1회 초";
        String pitcherName = "조현지";
        int numberOfPitches = 0;
        homeInfo.add(homeHitters);

        Etc etc = new Etc(teamName, teamScore,  halfInning, pitcherName, numberOfPitches);

        homeInfo.add(etc);
        InitDto initDto = new InitDto(halfInning, homeInfo, homeInfo);
        return initDto;
    }

}
