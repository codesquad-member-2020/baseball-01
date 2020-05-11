package com.codesquad.baseball1.controller;

import com.codesquad.baseball1.dto.ResponseDto;
import com.codesquad.baseball1.service.MatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MatchController {

    @Autowired
    private MatchService matchService;

    @GetMapping("/matches")
    public ResponseEntity<ResponseDto> showMatchList() {
        ResponseDto responseDto = matchService.getMatchList();
        return ResponseEntity.ok().body(responseDto);
    }

}
