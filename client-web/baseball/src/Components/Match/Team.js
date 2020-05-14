import React from 'react';
import styled from 'styled-components';

const TeamDiv = styled.div`
  position: relative;
  cursor: pointer;
  z-index: 1;
  img {
    width: 150px;
  }
  &.active {
    cursor: none;
    pointer-events: none;
    &::before {
      content: '팀선택 완료';
      position: absolute;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      background: radial-gradient(black, transparent);
    }
  }
`;

const Team = ({ type, name, logoSrc, onClickHandler, teamID, status }) => {
  const click = () => {
    return onClickHandler(teamID);
  };
  return (
    <TeamDiv onClick={click} className={status && 'active'}>
      <div>{type}</div>
      <div>
        <img src={logoSrc} alt={name} onLoad={() => console.log('이미지 로드')} />
      </div>
      <div>{name}</div>
    </TeamDiv>
  );
};

export default Team;
