import React from 'react';
import styled from 'styled-components';
import baseballBg from '../Styles/baseball.png';
import { grow } from '../Styles/Keyframes';

const LoaderWrap = styled.div`
  position: absolute;
  display: flex;
  &::before {
    content: '';
    width: 20px;
    height: 20px;
    margin: 0 5px;
    opacity: 0.7;
    background: url(${baseballBg}) no-repeat;
    background-size: cover;
    animation: 1.2s ${grow} ease-in-out infinite;
  }
  &::after {
    content: '';
    width: 20px;
    height: 20px;
    margin: 0 5px;
    opacity: 0.7;
    background: url(${baseballBg}) no-repeat;
    background-size: cover;
    animation: 1.2s ${grow} ease-in-out infinite 0.3s;
  }
`;

const LoaderDiv = styled.div`
  width: 20px;
  height: 20px;
  margin: 0 5px;
  opacity: 0.7;
  background: url(${baseballBg}) no-repeat;
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
