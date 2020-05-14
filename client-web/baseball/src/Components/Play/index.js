import axios from 'axios';
import React from 'react';
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
  console.log(location);
  const { matchID, userTeam } = location.state.detail;

  fetch(`http://13.124.60.97:8080/matches/${matchID}/teams/${userTeam}/setup`)
    .then(res => res.json())
    .then(res => res);
  return (
    <PlayWrapDiv>
      <InnerDiv width='1000px'>
        <Score />
        <Player />
        <Pitch />
        <BottomDiv>
          <Info />
          <Log />
        </BottomDiv>
        <Message children='STRIKE!!' />
      </InnerDiv>
      {/* <div>스코어</div>
      <div>베이스</div>
      <div>아웃카운트</div>
      <div>던지기버튼</div>
      <div>로그</div>
      <div>투수정보</div>
      <div>타자정보</div> */}
    </PlayWrapDiv>
  );
};

export default Play;
