import axios from 'axios';
import React from 'react';
import { Link } from 'react-router-dom';
import styled from 'styled-components';
import { MOCK_URL } from '../../constant/url';
import useAsync from '../Utils/useAsync';
import { Loader } from '../Utils/Loader';
import { BaseballBg } from '../Styles/Backgorund';

const MatchWrapDiv = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  ${BaseballBg}
`;
const MatchBoxDiv = styled.div`
  height: 80vh;
`;
const MatchMessageDiv = styled.div`
  text-align: center;
  h1 {
    margin-bottom: 10px;
    font-family: 'Montserrat';
    font-size: 40px;
    letter-spacing: 2px;
  }
  p {
    font-size: 18px;
    letter-spacing: 2px;
  }
`;

const MatchListDiv = styled.div`
  overflow-y: auto;
  height: calc(100% - 100px);
  margin: 15px 0;
`;

const MatchListItemDiv = styled.div``;

const Match = () => {
  const getMatch = async () => {
    const response = await axios(`${MOCK_URL}/match.json`);
    return response;
  };
  const state = useAsync(getMatch);
  const { loading, data, error } = state;
  if (loading) return <Loader />;
  if (error) return <div>에러</div>;
  if (!data) return null;

  const matchList = data.data;

  return (
    <MatchWrapDiv>
      <MatchBoxDiv>
        <MatchMessageDiv>
          <h1>Match List</h1>
          <p>플레이할 매치를 선택하세요.</p>
        </MatchMessageDiv>
        <MatchListDiv>
          {matchList.map((match, index) => (
            <MatchListItemDiv key={index}>
              {match.home.name} <img src={match.home.logoImg} alt={match.home.name} />
              vs {match.away.name} <img src={match.away.logoImg} alt={match.away.name} />
            </MatchListItemDiv>
          ))}
        </MatchListDiv>
        <Link to='/play'>플레이</Link>
      </MatchBoxDiv>
    </MatchWrapDiv>
  );
};

export default Match;
