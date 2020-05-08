import React from 'react';
import { Link } from 'react-router-dom';
import styled, { css } from 'styled-components';
import { introBallMove } from '../Styles/Keyframes';
import { BallBg } from '../Styles/Backgorund';

const StartWrap = styled.div`
  position: absolute;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 120px;
  height: 120px;
  text-align: center;
  z-index: 1;
  opacity: 0;
  a {
    font-weight: bold;
    font-size: 24px;
    color: #fff;
    line-height: 1.2;
    text-shadow: 2px 2px 2px gray;
  }
  ${props =>
    props.disappear &&
    css`
      animation-duration: 1.5s;
      animation-timing-function: ease-out;
      animation-name: ${introBallMove};
      animation-fill-mode: forwards;
    `};
  &::before {
    content: '';
    position: absolute;
    width: 100%;
    height: 100%;
    ${BallBg}
    box-shadow: 0 2px 5px rgba(27, 31, 35, 0.1);
    z-index: -1;
  }
  &:hover {
    &::before {
      transform: rotate(720deg);
    }
  }
`;

const StartLink = ({ link, name, disappear }) => {
  return (
    <StartWrap disappear={disappear}>
      <Link to={link}>{name}</Link>
    </StartWrap>
  );
};
export { StartLink };
