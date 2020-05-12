package com.codesquad.baseball1.service;

import com.codesquad.baseball1.dao.LogDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class LogService {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private LogDao logDao;


    public void updateDbBasedOnActionType(String actionType, int logId, int hitterId, int inningId) {
        if (actionType.equals("스트라이크")) {
            String sql = "UPDATE log SET strike_count = strike_count +1 where log_id =" + logId;
            String sql2 = "UPDATE record SET strike_count = strike_count +1 where hitter_id =" + hitterId;
            String sql3 = "UPDATE record SET available = 0 where strike_count = 3";
            jdbcTemplate.update(sql);
            jdbcTemplate.update(sql2);
            jdbcTemplate.update(sql3);
        } else if (actionType.equals("볼")) {
            String sql = "UPDATE log SET ball_count = ball_count +1 where log_id =" + logId;
            String sql2 = "UPDATE record SET ball_count = ball_count +1 where hitter_id =" + hitterId;
            if (logDao.findBallCountOfLogById(logId) == 4) {
                String sql3 = "UPDATE halfInning SET hit_score = hit_score +1 where inning_id =" + inningId;
                jdbcTemplate.update(sql3);
            }
            jdbcTemplate.update(sql);
            jdbcTemplate.update(sql2);
        } else if (actionType.equals("아웃")) {
            String sql = "UPDATE log SET out_count = out_count +1, available = 0 where log_id =" + logId;
            String sql2 = "UPDATE record SET out_count = out_count +1, available = 0 where hitter_id =" + hitterId;
            String sql3 = "UPDATE halfInning SET outsum = outsum + 1 where inning_id=" + inningId;
            String sql4 = "UPDATE record SET plate_appearance = plate_appearance + 1 where record_id =" + hitterId;
            String sql5 = "UPDATE log SET plate_appearance = plate_appearance + 1 where log_id =" + logId;
            jdbcTemplate.update(sql);
            jdbcTemplate.update(sql2);
            jdbcTemplate.update(sql3);
            jdbcTemplate.update(sql4);
            jdbcTemplate.update(sql5);
        } else if (actionType.equals("안타")) {
            String sql = "UPDATE log SET hit_count = hit_count +1 where log_id =" + logId;
            String sql2 = "UPDATE record SET hit_count = hit_count +1, available = 0 where hitter_id =" + hitterId;
            String sql3 = "UPDATE halfInning SET hit_score = hit_score +1 where inning_id =" + inningId;
            jdbcTemplate.update(sql);
            jdbcTemplate.update(sql2);
            jdbcTemplate.update(sql3);
        }
    }

    public Map<String, Integer> figureHomeOrAway(int matchId) {
        Map<String, Integer> matches = new HashMap<>();
        if (matchId == 1) {
            matches.put("home", 1);
            matches.put("away", 2);
        } else if (matchId == 2) {
            matches.put("home", 3);
            matches.put("away", 4);
        } else if (matchId == 3) {
            matches.put("home", 5);
            matches.put("away", 6);
        } else if (matchId == 4) {
            matches.put("home", 7);
            matches.put("away", 8);
        } else if (matchId == 5) {
            matches.put("home", 9);
            matches.put("away", 10);
        } return matches;
    }
}
