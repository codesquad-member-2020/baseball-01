import React from 'react';
import styled from 'styled-components';

const basePosition = type => {
  switch (type) {
    case 'one':
      return 'top:45px; left:80px;';
    case 'two':
      return 'top:15px; left: 50%;';
    case 'three':
      return 'top:45px; left:20px;';
    default:
      return 'top:100%; left:50%;';
  }
};

const BaseWrapDiv = styled.div`
  position: relative;
  width: 60%;
  padding: 10px 15px;
  margin-bottom: 15px;
  color: #fff;
  text-align: center;
  border: 1px solid #000;
  border-radius: 5px;
  background: rgb(13, 25, 37);
  background: linear-gradient(180deg, rgba(13, 25, 37, 0.9) 50%, rgba(0, 0, 1, 0.9) 100%);
`;

const BaseDiv = styled.div`
  position: relative;
  width: 100px;
  height: 100px;
  margin-left: 3px;
`;

const BaseSpan = styled.span`
  position: absolute;
  display: block;
  width: 40px;
  height: 40px;
  border: 2px solid #000;
  border-radius: 5px;
  background: rgb(255, 255, 255);
  background: linear-gradient(180deg, rgba(255, 255, 255, 1) 72%, rgba(221, 221, 221, 1) 82%);
  transform: rotate(45deg) translateX(-50%);
  ${({ base }) => basePosition(base)}
  &.active {
    background: rgb(253, 212, 0);
    background: linear-gradient(180deg, rgba(253, 212, 0, 1) 72%, rgba(232, 166, 2, 1) 82%);
  }
`;

const HomeBaseSpan = styled.span`
  position: absolute;
  left: 52%;
  top: 85%;
  display: block;
  width: 19px;
  height: 19px;
  border-radius: 5px;
  background: rgb(255, 255, 255);
  background: linear-gradient(180deg, rgba(255, 255, 255, 1) 72%, rgba(221, 221, 221, 1) 82%);
  transform: rotate(45deg) translateX(-50%);
  &::before {
    content: '';
    position: absolute;
    top: -1px;
    left: -1px;
    width: 25px;
    height: 25px;
    border-radius: 5px;
    background: rgb(255, 255, 255);
    background: linear-gradient(180deg, rgba(255, 255, 255, 1) 72%, rgba(221, 221, 221, 1) 82%);
    transform: rotate(45deg) translateX(-50%);
  }
`;

const Base = ({ hit }) => {
  const aa = parseInt(hit);
  return (
    <BaseWrapDiv>
      <BaseDiv>
        <BaseSpan className={`${aa >= 1 ? 'active' : ''}`} base='one' />
        <BaseSpan className={`${aa >= 2 ? 'active' : ''}`} base='two' />
        <BaseSpan className={`${aa >= 3 ? 'active' : ''}`} base='three' />
        <HomeBaseSpan />
      </BaseDiv>
    </BaseWrapDiv>
  );
};

export default Base;
