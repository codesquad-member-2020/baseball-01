package com.codesquad.baseball1.dto;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class TeamStatusDto {

    @JsonProperty("user_status")
    private final boolean userStatus;
    @JsonProperty("team_name")
    private final String teamName;
    @JsonProperty("team_type")
    private final String teamType;

    public TeamStatusDto(Builder builder) {
        userStatus = builder.userStatus;
        teamName = builder.teamName;
        teamType = builder.teamType;
    }

    public static class Builder {

        private boolean userStatus;
        private String teamName;
        private String teamType;

        public Builder userStatus(boolean user_status) {
            this.userStatus = user_status;
            return this;
        }

        public Builder teamName(String teamName) {
            this.teamName = teamName;
            return this;
        }

        public Builder teamType(String teamType) {
            this.teamType = teamType;
            return this;
        }

        public TeamStatusDto build() {
            return new TeamStatusDto(this);
        }
    }

}
