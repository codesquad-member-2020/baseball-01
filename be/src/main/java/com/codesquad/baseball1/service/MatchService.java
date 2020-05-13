package com.codesquad.baseball1.service;

import com.codesquad.baseball1.dao.MatchDao;
import com.codesquad.baseball1.dto.ResponseDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MatchService {

    @Autowired
    private MatchDao matchDao;

    public ResponseDto getMatchList() {
        Object matchDto = matchDao.findMatches();
        return new ResponseDto(200, matchDto);
    }

    public ResponseDto updatePlayerStatus(int teamId) {

        if (!matchDao.findUserStatusById(teamId)) {
            matchDao.updateTrue(teamId);

            if (!matchDao.findUserStatusById(matchDao.findAgainstTeamId(teamId))) {
                Object teamStatusDto = matchDao.findStatus(teamId);
                return new ResponseDto(200, "매치 상대를 찾고 있습니다.", teamStatusDto);

            } else {
                Object teamStatusDto = matchDao.findStatus(teamId);
                return new ResponseDto(200, "매치가 완료 되었습니다.", teamStatusDto);
            }
        }
        return new ResponseDto(200, "다른 유저가 대기 중입니다. 다른 팀을 골라주세요.");
    }

}
