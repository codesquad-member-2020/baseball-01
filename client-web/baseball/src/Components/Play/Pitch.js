import React from 'react';
import styled from 'styled-components';

const PitchBtn = styled.button`
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #f7f7f7;
  background-image: linear-gradient(#f7f7f7, #e7e7e7);
  border-radius: 50%;
  box-shadow: 0 3px 8px #aaa, inset 0 2px 3px #fff;
  color: #878787;
  display: block;
  font-family: 'Montserrat';
  font-size: 32px;
  margin: 36px;
  width: 144px;
  height: 144px;

  &::before {
    border-top: 2px solid #ddd;
    border-radius: 50%;
    box-shadow: inset 0 8px 48px #ddd;
    content: '';
    display: block;
    position: absolute;
    left: -18px;
    right: -18px;
    top: -18px;
    bottom: -18px;
    z-index: -1;
  }
  &:visited {
    color: #a7a7a7;
  }
  &:hover {
    color: rgb(13,25,37);
  }
  &:active {
    background: #f5f5f5;
  }
`;

const Pitch = () => {
  return <PitchBtn children='PITCH' />;
};

export default Pitch;
