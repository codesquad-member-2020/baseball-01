package com.codesquad.baseball1.controller;

import com.codesquad.baseball1.domain.HalfInning;
import com.codesquad.baseball1.dto.ResponseDto;
import com.codesquad.baseball1.service.HalfInningService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.sql.DataSource;

@RestController
public class TestController {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private HalfInningService halfInningService;

    public TestController(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @GetMapping("/test/{matchId}/{homeOrAway}")
    public Integer getPA(@PathVariable int matchId, @PathVariable String homeOrAway) {

        return halfInningService.geAcuumulatedPlateAppearanceWithMatchId(matchId, homeOrAway);
    }

}
