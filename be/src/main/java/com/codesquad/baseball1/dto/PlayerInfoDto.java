package com.codesquad.baseball1.dto;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class PlayerInfoDto {

    @JsonProperty("name")
    private String name;

    @JsonProperty("plate_appearance")
    private int plateAppearance;

    @JsonProperty("total_hit_count")
    private int totalHitCount;

    @JsonProperty("total_out_score")
    private int totalOutScore;

    @JsonProperty("average")
    private int average;

    public PlayerInfoDto(Builder builder) {
        name = builder.name;
        plateAppearance = builder.plateAppearance;
        totalHitCount = builder.totalHitCount;
        totalOutScore = builder.totalOutScore;
        average = builder.average;
    }

    public static class Builder {
        private String name;
        private int plateAppearance;
        private int totalHitCount;
        private int totalOutScore;
        private int average;

        public Builder (String name) {
            this.name = name;
        }

        public Builder plateAppearance(int plateAppearance) {
            this.plateAppearance = plateAppearance;
            return this;
        }
        public Builder hitScore(int totalHitCount) {
            this.totalHitCount = totalHitCount;
            return this;
        }
        public Builder outScore(int totalOutScore) {
            this.totalOutScore = totalOutScore;
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
