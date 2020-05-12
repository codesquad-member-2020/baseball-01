package com.codesquad.baseball1.dto;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

@JsonAutoDetect
@Setter @Getter
public class BoardDto {

    private String team_name;
    private Object playersInfo;

    public BoardDto(String team_name, Object playersInfo) {
        this.team_name = team_name;
        this.playersInfo = playersInfo;
    }
}