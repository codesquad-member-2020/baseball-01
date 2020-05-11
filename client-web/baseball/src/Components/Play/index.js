import React from 'react';
import styled from 'styled-components';
import { PlayBg } from '../Styles/Backgorund';
import Score from './Score';
import Player from './Player';

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

const Play = () => {
  return (
    <PlayWrapDiv>
      <InnerDiv width='1000px'>
        <Score />
        <Player />
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
