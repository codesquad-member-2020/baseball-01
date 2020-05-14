package com.codesquad.baseball1.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class SetupDto {


    @JsonProperty("team_name")
    private String teamName;

    @JsonProperty("logo_url")
    private String url;

    @JsonProperty("pitcher_name")
    private String pitcherName;

    @JsonProperty("hitter_name")
    private String hitterName;

    @JsonProperty("plate_appearance")
    private int plateAppearance;

    @JsonProperty("total_hit_count")
    private int totalHitCount;

    @JsonProperty("is_turn_to_pitch")
    private boolean isTurnToPitch;


    public SetupDto() {
    }

    public SetupDto(String teamName, String url, String pitcherName, String hitterName, int totalHitCount, boolean isTurnToPitch, int plateAppearance) {
        this.teamName = teamName;
        this.url = url;
        this.pitcherName = pitcherName;
        this.hitterName = hitterName;
        this.totalHitCount = totalHitCount;
        this.isTurnToPitch = isTurnToPitch;
        this.plateAppearance = plateAppearance;
    }
}
