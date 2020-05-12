package com.codesquad.baseball1.service;

import com.codesquad.baseball1.dao.InningDao;
import com.codesquad.baseball1.dao.LogDao;
import com.codesquad.baseball1.dao.RecordDao;
import com.codesquad.baseball1.domain.Record;
import com.codesquad.baseball1.dto.ResponseDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class LogService {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private LogDao logDao;
    @Autowired
    private RecordDao recordDao;
    @Autowired
    private InningDao inningDao;


    public void updateDbBasedOnActionType(String actionType, int logId, int hitterId, int inningId) {

        if (actionType.equals("스트라이크")) {
            updateLogWhenStrike(logId);
            updateRecordWhenStrike(hitterId);

        } else if (actionType.equals("볼")) {
            updateLogWhenBall(logId);
            updateRecordWhenBall(hitterId);
            updateHitCountWhenFourBalls(logId, inningId);

        } else if (actionType.equals("아웃")) {
            updateLogWhenOut(logId);
            updateRecordWhenOut(hitterId);
            updateHalfInningWhenOut(inningId);

        } else if (actionType.equals("안타")) {
            updateLogWhenHit(logId);
            updateRecordWhenHit(hitterId);
            updateHalfInningWhenHit(hitterId);
        }
        updatePlateAppearance(hitterId, logId);
    }

    public void updateLogWhenStrike(int logId) {
        String sql = "UPDATE log SET strike_count = strike_count +1 where log_id =" + logId;
        jdbcTemplate.update(sql);
    }

    public void updateLogWhenBall(int logId) {
        String sql = "UPDATE log SET ball_count = ball_count +1 where log_id =" + logId;
        jdbcTemplate.update(sql);
    }

    public void updateHitCountWhenFourBalls(int logId, int inningId) {
        if (logDao.findBallCountOfLogById(logId) == 4) {
            String sql3 = "UPDATE halfInning SET hit_score = hit_score +1 where inning_id =" + inningId;
            jdbcTemplate.update(sql3);
        }
    }

    public void updateLogWhenOut(int logId) {
        String sql = "UPDATE log SET out_count = out_count +1, available = 0 where log_id =" + logId;
        jdbcTemplate.update(sql);

    }

    public void updateRecordWhenStrike(int hitterId) {
        String sql = "UPDATE record SET strike_count = strike_count +1 where hitter_id =" + hitterId;
        String sql3 = "UPDATE record SET available = 0, total_out_count = total_out_count + 1 where strike_count = 3";
        jdbcTemplate.update(sql);
        jdbcTemplate.update(sql3);
    }

    public void updateRecordWhenBall(int hitterId) {
        String sql = "UPDATE record SET ball_count = ball_count +1 where hitter_id =" + hitterId;
        String sql2 = "UPDATE record SET available = 0, total_hit_count = total_hit_count + 1 where ball_count = 4";
        jdbcTemplate.update(sql);
        jdbcTemplate.update(sql2);
    }

    public void updateRecordWhenOut(int hitterId) {
        String sql = "UPDATE record SET out_count = out_count +1, available = 0, total_out_count = total_out_count + 1 where hitter_id =" + hitterId;
        jdbcTemplate.update(sql);

    }

    public void updateHalfInningWhenOut(int inningId) {
        String sql = "UPDATE halfInning SET outsum = outsum + 1 where inning_id=" + inningId;
        jdbcTemplate.update(sql);
    }

    public void updateLogWhenHit(int logId) {
        String sql = "UPDATE log SET hit_count = hit_count +1, available = 0 where log_id =" + logId;
        jdbcTemplate.update(sql);
    };
    public void updateRecordWhenHit(int hitterId) {
        String sql = "UPDATE record SET hit_count = hit_count +1, available = 0, total_hit_count = total_hit_count + 1 where hitter_id =" + hitterId;
        jdbcTemplate.update(sql);
    };
    public void updateHalfInningWhenHit(int inningId) {
        String sql = "UPDATE halfInning SET hit_score = hit_score +1 where inning_id =" + inningId;
        jdbcTemplate.update(sql);
    };


    public Integer getPlateAppearance(int hitterId) {
        String sql = "SELECT hitter_name from hitter where hitter_id =" + hitterId;
        String hitterName = jdbcTemplate.queryForObject(sql, String.class);
        String sql2 = "SELECT DISTINCT inning_id from log where log.hitter_name = '" + hitterName +"'";
        List<Integer> appearedHalfInnings = jdbcTemplate.queryForList(sql2, Integer.class);
        int plateAppearance = appearedHalfInnings.size();
        return plateAppearance;
    }

    public void updatePlateAppearance(int hitterId, int logId) {
        String sql = "UPDATE record SET plate_appearance = ? where record_id =" + hitterId;
        jdbcTemplate.update(sql, getPlateAppearance(hitterId));

        String sql2 = "UPDATE log SET plate_appearance = ? where log_id =" + logId;
        jdbcTemplate.update(sql, getPlateAppearance(hitterId));
        jdbcTemplate.update(sql2, getPlateAppearance(hitterId));
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

    public void createLog(Record record, String action, int inningId) {
        String sql = "insert into log (log_id, hitter_name, hitter_number, plate_appearance, action_result, strike_count, ball_count, out_count, hit_count, available, inning_id) VALUES (?, ?, ?, ?, ?, ?, ?, ? , ?, ?, ?)";
        jdbcTemplate.update(sql,
                null, record.getHitterName(), record.getHitterNumber(), record.getPlateAppearance(), action, record.getStrikeCount(), record.getBallCount(), record.getOutCount(), record.getHitCount(), 1, inningId);
    }

    public String getRandomAction() {
        List<String> sboh = Arrays.asList("스트라이크", "아웃", "볼", "안타");
        Random random = new Random();
        String actionType = sboh.get(random.nextInt(sboh.size()));
        return actionType;
    }

    public String findPitcher(int teamId) {
        String sql = "SELECT pitcher_name from pitcher where pitcher_id =" + teamId;
        String pitcherName = jdbcTemplate.queryForObject(sql, new Object[]{}, String.class);
        return pitcherName;
    }

    public void updatePitchCountToInning(int inningId) {
        String inningSql = "UPDATE halfInning SET number_of_pitches = number_of_pitches + 1 where inning_id =" + inningId;
        jdbcTemplate.update(inningSql);
    }

    public ResponseDto makePitch(int inningId, int homeOrAwayId) {
        updatePitchCountToInning(inningId);
        //find available player to throw pitch
        Record record = recordDao.findPlayerToPlay(homeOrAwayId);
        int hitterId = record.getHitterId();
        //get random result (s,b,o,h)
        String actionType = getRandomAction();
        //find a pitcher
        String pitcherName = findPitcher(homeOrAwayId);
        //update halfInning table's pitcher_name column searched by inningId
        inningDao.updateHalfInning(inningId, pitcherName);
        //create an empty Log first
        createLog(record, actionType, inningId);
        //find a newest Log added to the data base
        int logId = logDao.findLatestLog().getLogId();
        //then update value for *_count columns
        updateDbBasedOnActionType(actionType, logId, hitterId, inningId);
        return new ResponseDto(200, inningDao.findInningById(inningId));
    }
}
