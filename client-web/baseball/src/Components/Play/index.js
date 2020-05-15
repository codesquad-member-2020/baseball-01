import axios from 'axios';
import React, { useState, useEffect } from 'react';
import { URL } from '../../constant/url';
import styled from 'styled-components';
import { messageMove } from '../Styles/Keyframes';
import { PlayBg } from '../Styles/Backgorund';
import Score from './Score';
import Player from './Player';
import Pitch from './Pitch';
import Log from './Log';
import Info from './Info';

const PlayWrapDiv = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  ${PlayBg}
`;

const InnerDiv = styled.div`
  position: relative;
  display: flex;
  flex-direction: column;
  width: ${props => props.width};
  height: 100%;
`;

const BottomDiv = styled.div`
  display: flex;
  justify-content: space-between;
  margin-top: 15px;
`;

const Message = styled.p`
  position: absolute;
  top: 20%;
  left: 54%;
  font-weight: bold;
  font-size: 80px;
  color: white;
  text-shadow: 0 0.1em 20px rgba(0, 0, 0, 1), 0.05em -0.03em 0 rgba(0, 0, 0, 1), 0.05em 0.005em 0 rgba(0, 0, 0, 1), 0em 0.08em 0 rgba(0, 0, 0, 1),
    0.05em 0.08em 0 rgba(0, 0, 0, 1), 0px -0.03em 0 rgba(0, 0, 0, 1), -0.03em -0.03em 0 rgba(0, 0, 0, 1), -0.03em 0.08em 0 rgba(0, 0, 0, 1),
    -0.03em 0 0 rgba(0, 0, 0, 1);
  transform: translateX(-50%);
  animation: ${messageMove} 1s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards infinite alternate;
`;

const Play = ({ location }) => {
  // console.log(location);
  const { matchID, userTeam } = location.state.detail;
  const [initData, setInitData] = useState({
    away_team: '',
    home_team: '',
  });
  const [pitchData, setPitchData] = useState({
    top_status: false,
    game_over: false,
    hit_score: 0,
    logs: [],
    number_of_pitches: 0,
    out_sum: 0,
    pitcher_name: '',
    round: '1회 초',
    team_id: 0,
  });

  const playData = {...initData, ...pitchData}

  const setupData = async () => {
    const response = await axios(`${URL}/matches/${matchID}/teams/${userTeam}/setup`);
    setInitData(response.data);
    console.log(response.data);
    return response;
  };
  useEffect(() => {
    setupData();
  }, []);

  const onPitchHandler = async () => {
    const response = await axios.post(`${URL}/matches/${matchID}/pitch`);
    setPitchData(response.data.data);
    aaa()
    return response;
  };

  const aaa = () => {
    console.log(playData)
  }

  return (
    <PlayWrapDiv>
      <InnerDiv width='1000px'>
        <Score data={playData} />
        <Player data={playData} />
        <Pitch onClick={onPitchHandler} />
        <BottomDiv>
          <Info />
          <Log />
        </BottomDiv>
        <Message children={playData.logs.length > 0 ? playData.logs[playData.logs.length - 1].action_result : 'Play Ball!'} onClick={aaa} />
      </InnerDiv>
    </PlayWrapDiv>
  );
};

export default Play;
