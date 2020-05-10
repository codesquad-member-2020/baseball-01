import React from 'react';
import styled from 'styled-components';

const TeamDiv = styled.div``;

const Team = ({ type, name, logoSrc }) => {
  return (
    <TeamDiv>
      <div>{type}</div>
      <div>
        <img src={logoSrc} alt={name} />
      </div>
      <div>{name}</div>
    </TeamDiv>
  );
};

export default Team;
