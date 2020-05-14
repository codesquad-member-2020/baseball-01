import axios from 'axios';
import React from 'react';
import styled from 'styled-components';
import Team from './Team';
import { URL } from '../../constant/url';

const TeamListDiv = styled.div`
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  box-sizing: border-box;
  padding: 15px;
  z-index: 10;
  & + & {
    margin-top: 20px;
  }
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
  > * {
    margin: 0 20px;
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
  &.active {
    pointer-events: none;
    > * {
      opacity: 0.3;
    }
    .active::before {
      display: none;
    }
    &::before {
      content: '경기중입니다.';
      display: flex;
      justify-content: center;
      align-items: center;
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      z-index: 100;
      opacity: 1;
      background: rgba(0, 0, 0, 0.7);
    }
  }
`;

const TeamList = ({ link, home, away, matchID, onSelectTeam }) => {
  
  const getMatch = async team => {
    const response = await axios.patch(`${URL}/matches/${matchID}/teams/${team}`);
    return onSelectTeam(response, matchID, team);
  };

  return (
    <TeamListDiv className={home.user_status && away.user_status && 'active'}>
      <Team type='home' name={home.team_name} logoSrc={home.logo_image} teamID={home.team_id} onClickHandler={getMatch} status={home.user_status} />
      <span>VS</span>
      <Team type='away' name={away.team_name} logoSrc={away.logo_image} teamID={away.team_id} onClickHandler={getMatch} status={away.user_status} />
      
    </TeamListDiv>
  );
};

export default TeamList;
