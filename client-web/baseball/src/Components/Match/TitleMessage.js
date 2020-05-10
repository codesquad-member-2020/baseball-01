import React from 'react';
import styled from 'styled-components';

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

const TitleMessage = () => {
  return (
    <MatchMessageDiv>
      <h1>Match List</h1>
      <p>플레이할 매치를 선택하세요.</p>
    </MatchMessageDiv>
  );
};

export default TitleMessage;
