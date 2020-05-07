import React from 'react';
import styled from 'styled-components';
import { IntroBg } from '../Styles/Backgorund';
import {StartLink} from '../Styles/Link';
import Title from './Title';

const IntroDiv = styled.div`
  ${IntroBg}
  color: #fff;
`;

const Intro = () => {
  return (
    <IntroDiv>
      <Title />
      <StartLink to='/match'>GAME START</StartLink>
    </IntroDiv>
  );
};

export default Intro;
