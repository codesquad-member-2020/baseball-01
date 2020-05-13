package com.codesquad.baseball1.controller;

import com.codesquad.baseball1.dto.ResponseDto;
import com.codesquad.baseball1.service.MatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

    @PatchMapping("matches/{matchId}/teams/{teamId}")
    public ResponseEntity<ResponseDto> updateTrue(@PathVariable("teamId") int teamId) {
        ResponseDto responseDto = matchService.updatePlayerStatus(teamId);
        return ResponseEntity.ok().body(responseDto);
    }

    @GetMapping("matches/{matchId}/teams/{teamId}")
    public ResponseEntity<ResponseDto> showStatus(@PathVariable("teamId") int teamId) {
        ResponseDto responseDto = matchService.getTeamStatus(teamId);
        return ResponseEntity.ok().body(responseDto);
    }

    @GetMapping("matches/{matchId}")
    public ResponseEntity<ResponseDto> showReadyMatch(@PathVariable("matchId") int matchId) {
        ResponseDto responseDto = matchService.getReadyMatch(matchId);
        return ResponseEntity.ok().body(responseDto);
    }
}
