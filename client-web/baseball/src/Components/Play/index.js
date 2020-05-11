import React from 'react';
import styled from 'styled-components';
import { PlayBg } from '../Styles/Backgorund';
import Score from './Score';

const PlayWrapDiv = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  ${PlayBg}
`;

const Play = () => {
  return (
    <PlayWrapDiv>
      <Score />
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
