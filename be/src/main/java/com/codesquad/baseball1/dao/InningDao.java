package com.codesquad.baseball1.dao;

import com.codesquad.baseball1.domain.HalfInning;
import com.codesquad.baseball1.domain.Hitter;
import com.codesquad.baseball1.domain.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
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

    public InningDao(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
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
        return null;
    }

    public boolean isThreeOut(HalfInning halfInning) {
        if (halfInning.getOutSum() == 3) {
            return true;
        }
        return false;
    }
}
