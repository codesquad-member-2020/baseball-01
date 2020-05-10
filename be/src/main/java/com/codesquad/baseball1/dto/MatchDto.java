package com.codesquad.baseball1.dto;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonAutoDetect
public class MatchDto {

    @JsonProperty("match_id")
    private int matchId;

    @JsonProperty("home")
    private Object home;

    @JsonProperty("away")
    private Object away;

    public void setMatchId(int matchId) {
        this.matchId = matchId;
    }

    public void setHome(Object home) {
        this.home = home;
    }

    public void setAway(Object away) {
        this.away = away;
    }
}
