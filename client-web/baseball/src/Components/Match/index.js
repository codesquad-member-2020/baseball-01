import axios from 'axios';
import React, { useState } from 'react';
import styled from 'styled-components';
import { URL } from '../../constant/url';
import useAsync from '../Utils/useAsync';
import { Loader } from '../Utils/Loader';
import { BaseballBg } from '../Styles/Backgorund';
import TitleMessage from './TitleMessage';
import TeamList from './TeamList';
import Ready from './Ready';

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

const Match = ({ history }) => {
  const [msg, setMsg] = useState(null);
  const [ready, setReady] = useState(null);
  
  const getMatch = async () => {
    const response = await axios(`${URL}/matches`);
    return response;
  };
  const state = useAsync(getMatch);
  const { loading, data, error } = state;
  if (loading) return <Loader />;
  if (error) return <div>에러</div>;
  if (!data) return null;

  const matchList = data.data.data;

  const selectTeamData = (state, id, team) => {
    const { data, message } = state.data;
    console.log(state.data);
    data && play(data, id, team);
    return setMsg(message);
  };

  const play = (data, id, team) => {
    setReady(data);
    let checkTimer = setTimeout(async function tick() {
      let response = await axios(`${URL}/matches/${id}`);
      let awayStatus = response.data.data.away.user_status;
      let homeStatus = response.data.data.home.user_status;
      console.log(response.data);
      if (awayStatus === homeStatus)
        return history.push({
          pathname: '/play',
          state: { detail: {
            matchID : `${id}`,
            userTeam: `${team}`
          } },
        });
      checkTimer = setTimeout(tick, 2000); // (*)
    }, 2000);
  };

  return (
    <MatchWrapDiv>
      <MatchBoxDiv>
        <TitleMessage />
        <MatchListDiv>
          {matchList.map(match => (
            <TeamList
              link={`/play`}
              home={match.home}
              away={match.away}
              matchID={match.match_id}
              key={match.match_id}
              onSelectTeam={selectTeamData}
            />
          ))}
        </MatchListDiv>
      </MatchBoxDiv>
      {ready && <Ready msg={msg} data={ready} />}
    </MatchWrapDiv>
  );
};

export default Match;
