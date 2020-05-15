import React from 'react';
import styled from 'styled-components';

const PlayerWrapDiv = styled.div`
  display: flex;
  justify-content: space-between;
  margin-top: 15px;
`;

const PlayerDiv = styled.div`
  position: relative;
  width: 25%;
  padding: 10px;
  color: #fff;
  border: 2px solid #000;
  border-radius: 5px;
  background: rgb(13, 25, 37);
  background: linear-gradient(180deg, rgba(13, 25, 37, 1) 50%, rgba(0, 0, 1, 1) 100%);
`;

const PlayerNameP = styled.p`
  font-size: 20px;
  img {
    width: 30px;
    margin-right: 5px;
    vertical-align: middle;
  }
  strong {
    font-weight: bold;
  }
`;

const TodayDiv = styled.div`
  position: relative;
  padding-top: 10px;
  margin-top: 10px;
  color: #a6a8b2;
  &::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0%;
    width: 100%;
    height: 2px;
    background: #a6a8b2;
  }
  span {
    &::after {
      content: '‣';
      margin: 0 5px;
    }
  }
`;

const Player = ({ data }) => {
  const { top_status, home_team, away_team, number_of_pitches } = data;
  return (
    <PlayerWrapDiv>
      <PlayerDiv>
        <PlayerNameP>
          <img src={top_status ? home_team.logo_url : away_team.logo_url} alt={top_status ? home_team.team_name : away_team.team_name} />
          선발 투수 <strong>{top_status ? home_team.pitcher_name : away_team.pitcher_name}</strong>
        </PlayerNameP>
        <TodayDiv>
          <span>오늘 경기</span> 투구 수 {number_of_pitches}개
        </TodayDiv>
      </PlayerDiv>
      <PlayerDiv>
        <PlayerNameP>
          <img src={top_status ? away_team.logo_url : home_team.logo_url} alt={top_status ? away_team.team_name : home_team.team_name} />
          1번 타자 <strong>{top_status ? away_team.hitter_name : home_team.hitter_name}</strong>
        </PlayerNameP>
        <TodayDiv>
          <span>오늘 경기</span> {away_team.plate_appearance}타석 {away_team.total_hit_count}안타
        </TodayDiv>
      </PlayerDiv>
    </PlayerWrapDiv>
  );
};

export default Player;
