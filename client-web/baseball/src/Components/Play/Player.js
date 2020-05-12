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

const Player = () => {
  return (
    <PlayerWrapDiv>
      <PlayerDiv>
        <PlayerNameP><img src='https://sports-phinf.pstatic.net/team/kbo/default/HH.png' alt='한화 이글스 로고' />선발 투수 <strong>박찬호</strong></PlayerNameP>
        <TodayDiv>
          <span>오늘 경기</span> 투구 수 40개
        </TodayDiv>
      </PlayerDiv>
      <PlayerDiv>
        <PlayerNameP><img src='https://sports-phinf.pstatic.net/team/kbo/default/LT.png' alt='롯데 자이언츠 로고' />1번 타자 <strong>민병헌</strong></PlayerNameP>
        <TodayDiv>
          <span>오늘 경기</span> 2타석 2안타
        </TodayDiv>
      </PlayerDiv>
    </PlayerWrapDiv>
  );
};

export default Player;
