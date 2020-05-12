package com.codesquad.baseball1.controller;

import com.codesquad.baseball1.dao.InningDao;
import com.codesquad.baseball1.dao.LogDao;
import com.codesquad.baseball1.dao.RecordDao;
import com.codesquad.baseball1.domain.HalfInning;
import com.codesquad.baseball1.domain.Record;
import com.codesquad.baseball1.dto.ResponseDto;
import com.codesquad.baseball1.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

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
    @Autowired
    private LogService logService;

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


//    method = POST will work if you 'post' a form to the url /test.
//    if you type a url in address bar of a browser and hit enter, it's always a GET request, so you had to specify POST request.
//    Google for HTTP GET and HTTP POST (there are several others like PUT DELETE). They all have their own meaning.

    @GetMapping("/matches/{matchId}/pitch")
    public ResponseDto pitch(@PathVariable int matchId) {
        Map matches = logService.figureHomeOrAway(matchId);
        int homeId = (int) matches.get("home");
        int awayId = (int) matches.get("away");
        HalfInning thisInning = inningDao.findHalfInningToPlay();
        int inningId = thisInning.getInningId();
        if (inningId%2 != 0 && !inningDao.isThreeOut(thisInning)) {
            return makePitch(inningId, homeId);
        } else if (inningId%2 == 0 && !inningDao.isThreeOut(thisInning)) {
            return makePitch(inningId, awayId);
        }
        return null;
    }

    @GetMapping("/matches/{matchId}/getPitch")
    public ResponseDto getPitch(@PathVariable int matchId) {
        HalfInning thisInning = inningDao.findHalfInningToPlay();
        int inningId = thisInning.getInningId();
        return new ResponseDto(200, inningDao.findInningById(inningId));
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
        logService.updateDbBasedOnActionType(actionType, logId, hitterId, inningId);
                return new ResponseDto(200, inningDao.findInningById(inningId));
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
        List<String> sboh = Arrays.asList("스트라이크", "아웃", "볼", "안타");
        Random random = new Random();
        String actionType = sboh.get(random.nextInt(sboh.size()));
        return actionType;
    }

    public void updatePitchCountToInning(int inningId) {
        String inningSql = "UPDATE halfInning SET number_of_pitches = number_of_pitches + 1 where inning_id =" + inningId;
        jdbcTemplate.update(inningSql);
    }
}
