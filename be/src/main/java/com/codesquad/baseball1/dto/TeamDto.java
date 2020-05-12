package com.codesquad.baseball1.dto;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class TeamDto {

    @JsonProperty("team_id")
    private final int teamId;

    @JsonProperty("team_name")
    private final String teamName;

    @JsonProperty("logo_image")
    private final String logoImage;

    @JsonProperty("user")
    private final boolean player;

    public TeamDto(Builder builder) {
        teamId = builder.teamId;
        teamName = builder.teamName;
        logoImage = builder.logoImage;
        player = builder.player;
    }

    public static class Builder {

        private final int teamId;
        private String teamName;
        private String logoImage;
        private boolean player;

        public Builder (int teamId) {
            this.teamId = teamId;
        }

        public Builder teamName(String teamName) {
            this.teamName = teamName;
            return this;
        }

        public Builder logoImage(String logoImage) {
            this.logoImage = logoImage;
            return this;
        }

        public Builder player(boolean player) {
            this.player = player;
            return this;
        }

        public TeamDto build() {
            return new TeamDto(this);
        }
    }
}
