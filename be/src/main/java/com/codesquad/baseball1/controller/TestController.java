package com.codesquad.baseball1.controller;

import com.codesquad.baseball1.dao.MatchDao;
import com.codesquad.baseball1.dao.PlayerInfoDao;
import com.codesquad.baseball1.dto.BoardDto;
import com.codesquad.baseball1.dto.PlayerInfoDto;
import com.codesquad.baseball1.dto.ResponseDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @Autowired
    private PlayerInfoDao playerInfoDao;
    @Autowired
    private MatchDao matchDao;


    @GetMapping("/test/{matchId}")
    public ResponseDto findPlayerInfo(@PathVariable int matchId) {

        int homeId = matchDao.findTeamIdByMatchId(matchId, "'home'");
        int awayId = matchDao.findTeamIdByMatchId(matchId, "'away'");

        String home = matchDao.findTeamNameByMatchId(matchId, "'home'");
        String away = matchDao.findTeamNameByMatchId(matchId, "'away'");


        Object playerInfoDto1 = playerInfoDao.findPlayersInfo(homeId);
        Object playerInfoDto2 = playerInfoDao.findPlayersInfo(awayId);

        BoardDto boardDto1 = new BoardDto(home, playerInfoDto1);
        BoardDto boardDto2 = new BoardDto(away, playerInfoDto2);


        return new ResponseDto(200,  "good",boardDto1,boardDto2);

    }


    @GetMapping("/test2")
    public String name() {
        return matchDao.findTeamNameByMatchId(1, "'away'");
    }
}
