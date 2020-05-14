package com.codesquad.baseball1.dto;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

@JsonAutoDetect
@Setter @Getter
public class BoardDto {

    @JsonProperty("team_name")
    private String teamName;

    @JsonProperty("players_info")
    private Object playersInfo;

    public BoardDto(String teamName, Object playersInfo) {
        this.teamName = teamName;
        this.playersInfo = playersInfo;
    }
}