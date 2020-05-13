package com.codesquad.baseball1.dto;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@JsonAutoDetect
@Getter @Setter
public class InitDto {

    @JsonProperty("half_inning")
    private String halfInning;

    @JsonProperty("home")
    private List<Object> home;

    @JsonProperty("away")
    private List<Object> away;

    public InitDto(String halfInning, List<Object> home, List<Object> away) {
        this.halfInning = halfInning;
        this.home = home;
        this.away = away;
    }
}
