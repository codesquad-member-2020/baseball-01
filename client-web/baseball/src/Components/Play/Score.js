import React from 'react';
import styled from 'styled-components';

const ScoreWrapDiv = styled.div`
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 8px;
  border: 3px solid #000;
`;

const InningDiv = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 15%;
  height: 80px;
  font-weight: bold;
  font-size: 32px;
  color: #333;
  border-radius: 5px 0 0 5px;
  background: rgb(253, 253, 253);
  background: linear-gradient(180deg, rgba(253, 253, 253, 1) 45%, rgba(227, 227, 227, 1) 50%, rgba(248, 248, 248, 1) 100%);
`;

const MatchDiv = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 85%;
  height: 80px;
  padding-right: 15%;
  text-align: center;
  color: #fff;
  border-radius: 0 5px 5px 0;
  background: rgb(13, 25, 37);
  background: linear-gradient(180deg, rgba(13, 25, 37, 1) 50%, rgba(0, 0, 1, 1) 100%);
`;

const TeamDiv = styled.div`
  position: relative;
  width: 40%;
  height: 80px;
  span {
    display: block;
    position: absolute;
    top: 8px;
    left: 50%;
    transform: translateX(-50%);
    font-size: 14px;
  }
  img {
    width: 80px;
  }
  div {
    display: flex;
    justify-content: center;
    align-items: center;
    ${props => props.home && 'flex-direction: row-reverse'};
    font-size: 24px;
  }
`;
const ScoreDiv = styled.div`
  width: 20%;
  font-weight: bold;
  font-size: 32px;
  letter-spacing: 8px;
`;

const DetailBtn = styled.button`
  position: absolute;
  right: 2.5%;
  width: 12.5%;
`;

const Score = ({data}) => {
  const {round, home_team, away_team} = data
  return (
    <ScoreWrapDiv>
      <InningDiv>{round ? `${round}` : '1회 초'}</InningDiv>
      <MatchDiv>
        <TeamDiv>
          <span>AWAY</span>
          <div>
            <img src={away_team.logo_url} alt={away_team.team_name} />
            {away_team.team_name}
          </div>
        </TeamDiv>
        <ScoreDiv children={'0:0'} />
        <TeamDiv home>
          <span>HOME</span>
          <div>
            <img src={home_team.logo_url} alt={home_team.team_name} />
            {home_team.team_name}
          </div>
        </TeamDiv>
      </MatchDiv>
      <DetailBtn children={'자세히 보기'} />
    </ScoreWrapDiv>
  );
};

export default Score;
