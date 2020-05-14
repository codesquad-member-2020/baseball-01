import React from 'react';
import styled from 'styled-components';
import ballBg from '../Styles/ball_bg.png';
import { grow } from '../Styles/Keyframes';
import { IntroBg } from '../Styles/Backgorund';

const LoaderWrap = styled.div`
  position: fixed;
  top: 0;
  left: 0;
  background: ${IntroBg};
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: row;
  
  &::before {
    content: '';
    width: 20px;
    height: 20px;
    margin: 0 5px;
    opacity: 0.7;
    background: url(${ballBg}) no-repeat;
    background-size: cover;
    animation: 1.2s ${grow} ease-in-out infinite;
  }
  &::after {
    content: '';
    width: 20px;
    height: 20px;
    margin: 0 5px;
    opacity: 0.7;
    background: url(${ballBg}) no-repeat;
    background-size: cover;
    animation: 1.2s ${grow} ease-in-out infinite 0.3s;
  }
`;

const LoaderDiv = styled.div`
  width: 20px;
  height: 20px;
  margin: 0 5px;
  opacity: 0.7;
  background: url(${ballBg}) no-repeat;
  background-size: cover;
  animation: 1.2s ${grow} ease-in-out infinite 0.15555s;
`;
const Loader = () => {
  return (
    <LoaderWrap>
      <LoaderDiv />
    </LoaderWrap>
  );
};
export { Loader };
