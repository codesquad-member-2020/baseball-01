package com.codesquad.baseball1.dao;

import com.codesquad.baseball1.domain.HalfInning;
import com.codesquad.baseball1.domain.Hitter;
import com.codesquad.baseball1.domain.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;

import javax.sql.DataSource;
import java.util.List;

@Repository
public class InningDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private LogDao logDao;
    @Autowired
    private MatchDao matchDao;

    private NamedParameterJdbcTemplate namedJdbcTemplate;

    public InningDao(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public NamedParameterJdbcTemplate getNamedJdbcTemplate() {
        return namedJdbcTemplate;
    }

    public void updateHalfInning(int inningId, String pitcherName) {
        String sql = "UPDATE halfInning SET pitcher_name = ? where inning_id = ?";
        jdbcTemplate.update(sql, pitcherName, inningId);
    }

    public HalfInning findEmptyInning(int inningId) {
        String sql = "SELECT * FROM halfInning where inning_id=" + inningId;
        return jdbcTemplate.queryForObject(sql, new Object[]{}, BeanPropertyRowMapper.newInstance(HalfInning.class));
    }

    public List<Log> findLog(int inningId) {
        String sql = "SELECT * FROM log where inning_id=" + inningId;
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Log.class));
    }

    public List<Hitter> findPlayersByTeamId(int teamId) {
        String sql = "SELECT * FROM hitter where team_id =" + teamId;
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Hitter.class));
    }

    public HalfInning findInningById(int inningId) {
        HalfInning halfInning = findEmptyInning(inningId);
        List<Log> logs = findLog(inningId);
        halfInning.setLogs(logs);
        return halfInning;
    }

    @GetMapping("/innings")
    public List<HalfInning> getHalfInnings(int matchId) {
        String sql = "SELECT * FROM halfInning where match_id = " +matchId;
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(HalfInning.class));
    }

    public HalfInning findHalfInningToPlay(int matchId) {
        List<HalfInning> halfInnings = getHalfInnings(matchId);
        for (HalfInning h : halfInnings) {
            if (h.getOutSum() < 3) {
                return h;
            }
        }
        HalfInning nullHalfInning = new HalfInning();
        nullHalfInning.setHitScore(100);
        System.out.println("----------------------------------------------------------" + nullHalfInning.getHitScore());
        return nullHalfInning;
    }

    public void resetInningsAndRecordsWithMatchId(int matchId) {
        resetInningWithMatchID(matchId);
        resetRecordsWithMatchId(matchId);
    }

    public void resetInningWithMatchID(int matchId) {

        String sql = "UPDATE record SET strike_count = 0, ball_count = 0, out_count = 0, hit_count = 0, average = 0, plate_appearance = 0, " +
                "available = 1, total_out_count = 0, total_hit_count = 0 where match_id = :match_id";
        SqlParameterSource namedParameter = new MapSqlParameterSource().addValue("match_id", matchId);
        namedJdbcTemplate.update(sql, namedParameter);
    }

    public void resetRecordsWithMatchId(int matchId) {
        int homeId = matchDao.findTeamIdByMatchId(matchId, "'home'");
        int awayId = matchDao.findTeamIdByMatchId(matchId, "'away'");

        String sql = "UPDATE record SET strike_count = 0, ball_count = 0, out_count = 0, hit_count = 0, average = 0, plate_appearance = 0, " +
                "available = 1, total_out_count = 0, total_hit_count = 0 where team_id = :team_id";
        SqlParameterSource namedParameters1 = new MapSqlParameterSource().addValue("team_id", homeId);
        SqlParameterSource namedParameters2 = new MapSqlParameterSource().addValue("team_id", awayId);
        namedJdbcTemplate.update(sql, namedParameters1);
        namedJdbcTemplate.update(sql, namedParameters2);
    }




    public boolean isThreeOut(HalfInning halfInning) {
        if (halfInning.getOutSum() == 3) {
            return true;
        }
        return false;
    }
}
