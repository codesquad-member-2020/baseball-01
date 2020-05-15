package com.codesquad.baseball1.service;

import com.codesquad.baseball1.dao.MatchDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Service
public class ResetService {

    @Autowired
    private NamedParameterJdbcTemplate namedJdbcTemplate;
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private MatchDao matchDao;

    public ResetService(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public void setNamedJdbcTemplate(NamedParameterJdbcTemplate namedJdbcTemplate) {
        this.namedJdbcTemplate = namedJdbcTemplate;
    }

    public void resetInningsAndRecordsAndLogsWithMatchId(int matchId) {
        resetInningWithMatchID(matchId);
        deleteLogsWithMatchId(matchId);
        resetRecordsWithMatchId(matchId);
    }

    public void resetInningWithMatchID(int matchId) {
        String sql = "UPDATE halfInning SET hit_score = 0, number_of_pitches = 0, outSum = 0 where halfInning.match_id =" + matchId;
        jdbcTemplate.update(sql);
    }

    public void deleteLogsWithMatchId(int matchId) {
        if (matchId == 1)   for (int i = 1; i < 18; i++) {
            String sql = "DELETE FROM log where log.inning_id = ?";
            jdbcTemplate.update(sql, i);
        } else if (matchId == 2 ) for (int i = 19; i < 36; i++) {
            String sql = "DELETE FROM log where log.inning_id = ?";
            jdbcTemplate.update(sql, i);
        } else if (matchId == 3 ) for (int i = 37; i < 54; i++) {
            String sql = "DELETE FROM log where log.inning_id = ?";
            jdbcTemplate.update(sql, i);
        } else if (matchId == 4 ) for (int i = 55; i < 73; i++) {
            String sql = "DELETE FROM log where log.inning_id = ?";
            jdbcTemplate.update(sql, i);
        } else if (matchId == 5 ) for (int i = 75; i < 90; i++) {
            String sql = "DELETE FROM log where log.inning_id = ?";
            jdbcTemplate.update(sql, i);
        }
    }

    public void resetRecordsWithMatchId(int matchId) {
        int homeId = matchDao.findTeamIdByMatchId(matchId, "'home'");
        int awayId = matchDao.findTeamIdByMatchId(matchId, "'away'");

        String sql = "UPDATE record SET strike_count = 0, ball_count = 0, out_count = 0, hit_count = 0, average = 0, plate_appearance = 0, available = 1, total_out_count = 0, total_hit_count = 0 where record.team_id = ?";
        jdbcTemplate.update(sql, homeId);
        jdbcTemplate.update(sql, awayId);

    }
}
