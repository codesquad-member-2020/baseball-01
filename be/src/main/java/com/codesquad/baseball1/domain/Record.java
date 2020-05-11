package com.codesquad.baseball1.domain;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;

@Getter
@Setter
@JsonAutoDetect
public class Record {
    @Id
    @JsonProperty("hitter_id")
    private int hitterId;
    @JsonProperty("hitter_name")
    private String hitterName;
    @JsonProperty("hitter_number")
    private int hitterNumber;
    @JsonProperty("plate_appearance")
    private int plateAppearance;
    @JsonProperty("strike_count")
    private int strikeCount;
    @JsonProperty("ball_count")
    private int ballCount;
    @JsonProperty("out_count")
    private int outCount;
    @JsonProperty("hit_count")
    private int hitCount;
    @JsonProperty("average")
    private int average;
    @JsonProperty("available")
    private boolean available;

    public Record() {
    }

    public Record resetOutCounts(Record record) {
        record.setOutCount(0);
        return record;
    }
}
