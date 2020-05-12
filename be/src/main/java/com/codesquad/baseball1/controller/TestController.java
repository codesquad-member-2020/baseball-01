package com.codesquad.baseball1.controller;

import com.codesquad.baseball1.dao.LogDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.sql.DataSource;
import java.util.List;

@RestController
public class TestController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private LogDao logDao;

    public TestController(DataSource dataSource) { jdbcTemplate = new JdbcTemplate(dataSource);}

    @GetMapping("/test")
    public List<Integer> test() {

        String sql = "SELECT DISTINCT inning_id from log where log.hitter_name = '박건우'";
        List<Integer> pa = jdbcTemplate.queryForList(sql, Integer.class);
        return pa;
    }


}
