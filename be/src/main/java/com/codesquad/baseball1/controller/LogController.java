package com.codesquad.baseball1.controller;

import com.codesquad.baseball1.dao.InningDao;
import com.codesquad.baseball1.dao.LogDao;
import com.codesquad.baseball1.dao.RecordDao;
import com.codesquad.baseball1.domain.HalfInning;
import com.codesquad.baseball1.domain.Record;
import com.codesquad.baseball1.dto.ResponseDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.sql.DataSource;
import java.util.*;

@RestController
public class LogController {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private LogDao logDao;
    @Autowired
    private RecordDao recordDao;
    @Autowired
    private InningDao inningDao;
    public LogController(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
    @GetMapping("/innings/{halfInningId}")
    public ResponseDto getHalfInning (@PathVariable int halfInningId) {
        return new ResponseDto(200, "good", inningDao.findInningById(halfInningId));
    }
    @GetMapping("/records/{teamId}")
    public ResponseDto aaa(@PathVariable int teamId) {
        return new ResponseDto(200, "good", recordDao.findRecordByTeamId(teamId));
    }
    //        //API to return when a player chooses 'home' team (defense)
//        @GetMapping("/matches/{matchId}/pitch")
//        public ResponseDto defense(@PathVariable int matchId) {
//            Map matches = figureHomeOrAway(matchId);
//            int teamId = (int) matches.get("home");
//            //find half-inning in order
//            HalfInning thisInning = inningDao.findHalfInningToPlay("'home'");
//            int inningId = thisInning.getInning_id();
//            if (!inningDao.isThreeOut(thisInning)) {
//                //update number of pitches every time player throws a pitch
//                updatePitchCountToInning(inningId);
//                //find available player to throw pitch
//                Record record = recordDao.findPlayerToPlay(teamId);
//                int hitterId = record.getHitterId();
//                //get random result (s,b,o,h)
//                String actionType = getRandomAction();
//                //find a pitcher
//                String pitcherName = findPitcher(teamId);
//                //update halfInning table's pitcher_name column searched by inningId
//                inningDao.updateHalfInning(inningId, pitcherName);
//                //create an empty Log first
//                createLog(record, actionType, inningId);
//                //find a newest Log added to the data base
//                int logId = logDao.findLatestLog().getLogId();
//                //then update value for *_count columns
//                updateDbBasedOnActionType(actionType, logId, hitterId, inningId);
//                return new ResponseDto(200, "SUCCESS", inningDao.findInningById(inningId));
//            }
//            return new ResponseDto(200, "세 번 아웃되어 공수가 전환됩니다");
//        }
    @GetMapping("/matches/{matchId}/pitch")
    public ResponseDto pitch(@PathVariable int matchId) {
        Map matches = figureHomeOrAway(matchId);
        int homeId = (int) matches.get("home");
        int awayId = (int) matches.get("away");
        //find half-inning in order
        HalfInning thisInning = inningDao.findHalfInningToPlay();
        int inningId = thisInning.getInningId();
        //if inningId%2 == 0, that inning is home's turn to pitch
        if (inningId%2 != 0 && !inningDao.isThreeOut(thisInning)) {
            //update number of pitches every time player throws a pitch
            updatePitchCountToInning(inningId);
            //find available player to throw pitch
            Record record = recordDao.findPlayerToPlay(homeId);
            int hitterId = record.getHitterId();
            //get random result (s,b,o,h)
            String actionType = getRandomAction();
            //find a pitcher
            String pitcherName = findPitcher(homeId);
            //update halfInning table's pitcher_name column searched by inningId
            inningDao.updateHalfInning(inningId, pitcherName);
            //create an empty Log first
            createLog(record, actionType, inningId);
            //find a newest Log added to the data base
            int logId = logDao.findLatestLog().getLogId();
            //then update value for *_count columns
            updateDbBasedOnActionType(actionType, logId, hitterId, inningId);
            return new ResponseDto(200, inningDao.findInningById(inningId));
        } else if (inningId%2 == 0 && !inningDao.isThreeOut(thisInning)) {
            //update number of pitches every time player throws a pitch
            updatePitchCountToInning(inningId);
            //find available player to throw pitch
            Record record = recordDao.findPlayerToPlay(awayId);
            int hitterId = record.getHitterId();
            //get random result (s,b,o,h)
            String actionType = getRandomAction();
            //find a pitcher
            String pitcherName = findPitcher(awayId);
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
        return null;
    }
    //        //API to return when a player chooses 'away' team (attack)
//        @GetMapping("/away/{matchId}")
//        public ResponseDto attack(@PathVariable int matchId) {
//            Map matches = figureHomeOrAway(matchId);
//            int teamId = (int) matches.get("away");
//
//            HalfInning thisInning = inningDao.findHalfInningToPlay("'away'");
//            int inningId = thisInning.getInning_id();
//            updatePitchCountToInning(inningId);
//            Record record = recordDao.findPlayerToPlay(teamId);
//            int hitterId = record.getHitterId();
//            String actionType = getRandomAction();
//            String pitcherName = findPitcher(teamId);
//            inningDao.updateHalfInning(inningId, pitcherName);
//            createLog(record, actionType, inningId);
//            int logId = logDao.findLatestLog().getLogId();
//            updateDbBasedOnActionType(actionType, logId, hitterId, inningId);
//            return new ResponseDto(200, "SUCCESS", inningDao.findInningById(inningId));
//        }
    public Map<String, Integer>figureHomeOrAway(int matchId) {
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
    public String findPitcher(int teamId) {
        String sql = "SELECT pitcher_name from pitcher where pitcher_id =" + teamId;
        String pitcherName = jdbcTemplate.queryForObject(sql, new Object[]{}, String.class);
        return pitcherName;
    }
    public String getRandomAction() {
        List<String> sboh = Arrays.asList("아웃", "아웃", "아웃", "아웃");
        Random random = new Random();
        String actionType = sboh.get(random.nextInt(sboh.size()));
        return actionType;
    }
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
    public void updatePitchCountToInning(int inningId) {
        String inningSql = "UPDATE halfInning SET number_of_pitches = number_of_pitches + 1 where inning_id =" + inningId;
        jdbcTemplate.update(inningSql);
    }
}
