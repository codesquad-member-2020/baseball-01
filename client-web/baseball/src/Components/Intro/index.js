import React from 'react';
import styled from 'styled-components';
import { IntroBg } from '../Styles/Backgorund';
import Title from './Title';

const IntroDiv = styled.div`
  ${IntroBg}
`;
const Intro = () => {
  return (
    <IntroDiv>
      <Title />
    </IntroDiv>
  );
};

export default Intro;
