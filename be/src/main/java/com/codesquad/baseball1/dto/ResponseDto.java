package com.codesquad.baseball1.dto;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class ResponseDto {

    @JsonProperty("status_code")
    private int statusCode;

    @JsonProperty("message")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String message;

    @JsonProperty("data")
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private Object data;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Object homeTeam;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Object awayTeam;

    public ResponseDto() {
    }

    public ResponseDto(int statusCode, String message, Object data) {
        this.statusCode = statusCode;
        this.message = message;
        this.data = data;
    }

    public ResponseDto(int statusCode, Object data) {
        this.statusCode = statusCode;
        this.data = data;
    }

    public ResponseDto(int statusCode, String message, Object homeTeam, Object awayTeam) {
        this.statusCode = statusCode;
        this.message = message;
        this.homeTeam = homeTeam;
        this.awayTeam = awayTeam;
    }
}
