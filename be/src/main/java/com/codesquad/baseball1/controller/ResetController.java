package com.codesquad.baseball1.controller;

import com.codesquad.baseball1.service.ResetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ResetController {

    @Autowired
    ResetService resetService;

    @GetMapping("/reset/matches/{matchId}")
    public void test(@PathVariable int matchId) {
        resetService.resetInningsAndRecordsAndLogsWithMatchId(matchId);
    }
}
