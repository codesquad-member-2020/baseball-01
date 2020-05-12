package com.codesquad.baseball1.dto;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class PlayerInfoDto {

    private String name;

    private int plateAppearance;
    private int hitScore;
    private int outScore;
    private int average;

    public PlayerInfoDto(Builder builder) {
        name = builder.name;
        plateAppearance = builder.plateAppearance;
        hitScore = builder.hitScore;
        outScore = builder.outScore;
        average = builder.average;
    }

    public static class Builder {
        private String name;
        private int plateAppearance;
        private int hitScore;
        private int outScore;
        private int average;

        public Builder (String name) {
            this.name = name;
        }

        public Builder plateAppearance(int plateAppearance) {
            this.plateAppearance = plateAppearance;
            return this;
        }
        public Builder hitScore(int hitScore) {
            this.hitScore = hitScore;
            return this;
        }
        public Builder outScore(int outScore) {
            this.outScore = outScore;
            return this;
        }
        public Builder average(int average) {
            this.average = average;
            return this;
        }

        public PlayerInfoDto build() {
            return new PlayerInfoDto(this);
        }
    }
}
