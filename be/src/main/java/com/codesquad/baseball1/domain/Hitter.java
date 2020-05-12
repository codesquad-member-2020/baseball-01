package com.codesquad.baseball1.domain;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;

@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
@Getter
@Setter
public class Hitter {
    @Id
    private int id;
    private String name;
    private float average;

    private int accumulatedPA;
    private int accumulatedHit;
    private int accumulatedOut;
    private int accumulatedAverage;



//    타석 안타 아웃 평균          -모든 이닝 누적
}
