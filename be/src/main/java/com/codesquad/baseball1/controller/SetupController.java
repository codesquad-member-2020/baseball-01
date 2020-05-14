package com.codesquad.baseball1.controller;

import com.codesquad.baseball1.dao.LogDao;
import com.codesquad.baseball1.dao.MatchDao;
import com.codesquad.baseball1.dao.RecordDao;
import com.codesquad.baseball1.dao.SetupDao;
import com.codesquad.baseball1.dto.ResponseDto;
import com.codesquad.baseball1.dto.SetupDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.sql.DataSource;

@RestController
public class SetupController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private LogDao logDao;

    @Autowired
    private RecordDao recordDao;
    @Autowired
    private SetupDao setupDao;

    @Autowired
    private MatchDao matchDao;

    public SetupController(DataSource dataSource) { jdbcTemplate = new JdbcTemplate(dataSource);}


    @GetMapping("/matches/{matchId}/teams/{teamId}/setup")
    public ResponseDto test(@PathVariable int matchId, @PathVariable int teamId) {

        int homeId = matchDao.findTeamIdByMatchId(matchId, "'home'");
        int awayId = matchDao.findTeamIdByMatchId(matchId, "'away'");


        SetupDto homeDto = setupDao.getSetupData(homeId);
        SetupDto awayDto = setupDao.getSetupData(awayId);

        if (teamId%2 != 0) {
            homeDto.setTurnToPitch(true);
        } else {
            awayDto.setTurnToPitch(true);
        }

        return new ResponseDto(200, homeDto, awayDto);
    }

}
