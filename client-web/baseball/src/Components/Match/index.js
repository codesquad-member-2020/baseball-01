import axios from 'axios';
import React from 'react';
import styled from 'styled-components';
import { MOCK_URL } from '../../constant/url';
import useAsync from '../Utils/useAsync';
import { Loader } from '../Utils/Loader';
import { BaseballBg } from '../Styles/Backgorund';
import TitleMessage from './TitleMessage';
import TeamList from './TeamList';

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
  color: #fff;
`;


const MatchListDiv = styled.div`
  overflow-y: auto;
  height: calc(100% - 100px);
  margin: 15px 0;
`;


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
        <TitleMessage />
        <MatchListDiv>
          {matchList.map((match, index) => (
            <TeamList link={`/play/${match.matchId}`} home={match.home} away={match.away} key={index}/>
          ))}
        </MatchListDiv>
      </MatchBoxDiv>
    </MatchWrapDiv>
  );
};

export default Match;
