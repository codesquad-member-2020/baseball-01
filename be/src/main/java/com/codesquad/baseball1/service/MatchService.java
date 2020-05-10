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
        Object matchDto = matchDao.findTeam();
        return new ResponseDto(200, matchDto);
    }
}
