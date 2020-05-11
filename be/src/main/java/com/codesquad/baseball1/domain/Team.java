package com.codesquad.baseball1.domain;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
@Getter
@Setter
public class Team {
    @Id
    private int Id;
    private String name;
    private List<Hitter> hitters = new ArrayList<>();

    public Team(String name, Set<Hitter> hitters) {
        this.name = name;
    }

    public Team() {
    }
}
