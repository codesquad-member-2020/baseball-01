package com.codesquad.baseball1.dao;

import com.codesquad.baseball1.domain.Log;
import com.codesquad.baseball1.domain.Record;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.List;

@Repository
public class LogDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public LogDao(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public void addRecord(Record record, String actionResult, int inningId) {
        String sql = "insert into log (hitter_name, hitter_number, plate_appearance, action_result, strike_count, ball_count, out_count, hit_count, available, inning_id)";
        jdbcTemplate.update(sql, record.getHitterName(), record.getHitterNumber(), record.getPlateAppearance(), actionResult, 0, 0, 0, 0, "False", inningId);
    }

    public List<Log> findAllLogs() {
        String sql = "SELECT * FROM log";
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Log.class));
    }

    public Log findLatestLog() {
        String sql = "select * from log order by log_id desc limit 1";
        return jdbcTemplate.queryForObject(sql, new Object[]{}, BeanPropertyRowMapper.newInstance(Log.class));
    }

    public int findBallCountOfLogById(int logId) {
        String sql = "SELECT ball_count from log where log_id =" + logId;
        return jdbcTemplate.queryForObject(sql, new Object[]{}, Integer.class);
    }
}
