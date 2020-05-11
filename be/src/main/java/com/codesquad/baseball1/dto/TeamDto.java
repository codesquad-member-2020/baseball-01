package com.codesquad.baseball1.dto;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class TeamDto {

    @JsonProperty("team_name")
    private final String teamName;

    @JsonProperty("logo_image")
    private final String logoImage;

    @JsonProperty("player")
    private final String player;

    public TeamDto(Builder builder) {
        teamName = builder.teamName;
        logoImage = builder.logoImage;
        player = builder.player;
    }

    public static class Builder {

        private final String teamName;
        private String logoImage;
        private String player;

        public Builder (String teamName) {
            this.teamName = teamName;
        }

        public Builder logoImage(String logoImage) {
            this.logoImage = logoImage;
            return this;
        }

        public Builder player(String player) {
            this.player = player;
            return this;
        }

        public TeamDto build() {
            return new TeamDto(this);
        }
    }
}
