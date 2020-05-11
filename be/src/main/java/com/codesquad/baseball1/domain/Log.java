package com.codesquad.baseball1.domain;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;

@Getter
@Setter
@JsonAutoDetect
public class Log {
    @Id
    @JsonProperty("log_id")
    private int logId;
    @JsonProperty("hitter_name")
    private String hitterName;
    @JsonProperty("hitter_number")
    private String hitterNumber;
    @JsonProperty("plate_appearance")
    private int plateAppearance;
    @JsonProperty("action_result")
    private String actionResult;
    @JsonProperty("strike_count")
    private int strikeCount;
    @JsonProperty("ball_count")
    private int ballCount;
    @JsonProperty("out_count")
    private int outCount;
    @JsonProperty("hit_count")
    private int hitCount;
    @JsonProperty("available")
    private boolean available;

    public Log() {
    }

    public Log(String hitterName, String hitterNumber, int plateAppearance, String actionResult, int strikeCount, int ballCount, int outCount, int hitCount, boolean available) {
        this.hitterName = hitterName;
        this.hitterNumber = hitterNumber;
        this.plateAppearance = plateAppearance;
        this.actionResult = actionResult;
        this.strikeCount = strikeCount;
        this.ballCount = ballCount;
        this.outCount = outCount;
        this.hitCount = hitCount;
        this.available = available;
    }
}
