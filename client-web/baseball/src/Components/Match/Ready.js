import React from 'react';
import styled from 'styled-components';
import { feadIn } from '../Styles/Keyframes';

const ReadyWrapDiv = styled.div`
  position: fixed;
  top: 0;
  left: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.9);
  z-index: 100;
  animation: ${feadIn} 1s;
`;
const ReadyInnerDiv = styled.div`
  color: #fff;
`;

const Ready = ({ msg, data }) => {
  return (
    <ReadyWrapDiv>
      <ReadyInnerDiv children={msg} />
    </ReadyWrapDiv>
  );
};

export default Ready;
