package com.codesquad.baseball1.controller;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Etc {

    private String teamName;
    private int teamScore;
    private String halfInning;
    private String pitcherName;
    private int numberOfPitches;

    public Etc(String teamName, int teamScore, String halfInning, String pitcherName, int numberOfPitches) {
        this.teamName = teamName;
        this.teamScore = teamScore;
        this.halfInning = halfInning;
        this.pitcherName = pitcherName;
        this.numberOfPitches = numberOfPitches;
    }
}
