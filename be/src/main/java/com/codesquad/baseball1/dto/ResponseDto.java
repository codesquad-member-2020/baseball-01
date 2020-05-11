package com.codesquad.baseball1.dto;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonInclude;

@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class ResponseDto {

    private int statusCode;

    private String message;

    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private Object data;

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
}
