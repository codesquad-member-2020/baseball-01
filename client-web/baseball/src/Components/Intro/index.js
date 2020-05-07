import React, { useState } from 'react';
import styled, { css } from 'styled-components';
import { IntroBg } from '../Styles/Backgorund';
import { StartLink } from './StartLink';
import { introTitleMove } from '../Styles/Keyframes';
import Title from './Title';
import { Loader } from './Loader';

const IntroDiv = styled.div`
  ${IntroBg}
  color: #fff;
`;

const TitleDiv = styled.div`
  text-align: center;
  opacity: 0;
  ${props =>
    props.disappear &&
    css`
      animation-duration: 1.5s;
      animation-timing-function: ease-out;
      animation-name: ${introTitleMove};
      animation-fill-mode: forwards;
    `}
`;

const Intro = () => {
  const [loader, setLoader] = useState(true);
  const [visible, setVisible] = useState(false);
  setTimeout(() => {
    setLoader(false);
    setVisible(true);
  }, 2000);
  return (
    <IntroDiv>
      {loader && <Loader />}
      <TitleDiv disappear={visible}>
        <Title />
      </TitleDiv>
      <StartLink link='/match' name='GAME START' disappear={visible} />
    </IntroDiv>
  );
};

export default Intro;
