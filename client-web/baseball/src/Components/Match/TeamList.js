import React from 'react';
import { Link } from 'react-router-dom';
import styled from 'styled-components';
import Team from './Team';

const TeamListDiv = styled.div`
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  box-sizing: border-box;
  &::before,
  &::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 0;
    height: 0;
    border-top: 2px solid transparent;
  }
  a {
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #fff;
    padding: 20px 50px;
    z-index: 1;
  }
  &:hover {
    &::before,
    &::after {
      width: calc(100% - 4px);
      height: calc(100% - 4px);
    }
    &::before {
      transition: width 0.25s ease-out, height 0.25s ease-out 0.25s;
      border-top: 2px solid #fff;
      border-right: 2px solid #fff;
    }
    &::after {
      transition: height 0.25s ease-out, width 0.25s ease-out 0.25s;
      border-bottom: 2px solid #fff;
      border-left: 2px solid #fff;
    }
  }
`;

const TeamList = ({ link, home, away }) => {
  return (
    <TeamListDiv>
      <Link to={link}>
        <Team type='HOME' name={home.name} logoSrc={home.logoImg} />
        <span>VS</span>
        <Team type='AWAY' name={away.name} logoSrc={away.logoImg} />
      </Link>
    </TeamListDiv>
  );
};

export default TeamList;
