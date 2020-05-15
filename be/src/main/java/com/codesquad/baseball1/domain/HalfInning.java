package com.codesquad.baseball1.domain;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;

import java.util.List;

@Getter
@Setter
@JsonAutoDetect
public class HalfInning {
    @Id
    @JsonProperty("inning_id")
    private int inningId;

    @JsonProperty("team_id")
    private int teamId;

    @JsonProperty("round")
    private String round;

    @JsonProperty("hit_score")
    private int hitScore;

    @JsonProperty("pitcher_name")
    private String pitcherName;

    @JsonProperty("number_of_pitches")
    private int numberOfPitches;

    @JsonProperty("out_sum")
    private int outSum;

    @JsonProperty("change_status")
    private boolean changeStatus;

    @JsonProperty("top_status")
    private boolean topStatus;

    @JsonProperty("game_over")
    private boolean gameOver;

    @JsonProperty("logs")
    private List<Log> logs;

    public HalfInning() {
    }

}
