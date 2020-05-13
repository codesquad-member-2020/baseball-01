package com.codesquad.baseball1.dto;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

@JsonAutoDetect
public class InitDto {

    @JsonProperty("half_inning")
    private String halfInning;

    @JsonProperty("home")
    private List<Object> home;

    @JsonProperty("away")
    private List<Object> away;


}
