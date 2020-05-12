package com.codesquad.baseball1.dao;

import com.codesquad.baseball1.domain.Hitter;
import com.codesquad.baseball1.domain.Record;
import com.codesquad.baseball1.domain.Team;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.List;

@Repository
public class RecordDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private LogDao logDao;

    public RecordDao(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public List<Record> findRecordByTeamId(int teamId) {
        String sql = "SELECT * FROM record WHERE team_id =" + teamId;
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Record.class));
    }

    public Record findPlayerToPlay(int teamId) {
        List<Record> records = findRecordByTeamId(teamId);
        for (int i = 0; i < records.size(); i++) {
            Record r = records.get(i);
            if (r.isAvailable()) {
                return r;
            }
            System.out.println("this player is out : " + r.getHitterName());
        }
        System.out.println("every player is out, reset score");
        resetScore(teamId);
        return records.get(0);
    }

    public void resetScore(int teamId) {
        String sql = "UPDATE record set out_count = 0, strike_count = 0, ball_count = 0, hit_count = 0 where team_id =" + teamId;
        jdbcTemplate.update(sql);
    }

    public Team findTeamById(int teamId) {
        String sql = "SELECT * FROM team where team_id =" + teamId;
        return jdbcTemplate.queryForObject(sql, new Object[]{}, BeanPropertyRowMapper.newInstance(Team.class));
    }

    public List<Hitter> findPlayersByTeamId(int teamId) {
        String sql = "SELECT * FROM hitter where team_id =" + teamId;
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Hitter.class));
    }

    public Team findTeamWithPlayersByTeamId(int teamId) {
        Team myTeam = findTeamById(teamId);
        List<Hitter> hitters = findPlayersByTeamId(teamId);
        myTeam.setHitters(hitters);
        return myTeam;
    }
}
