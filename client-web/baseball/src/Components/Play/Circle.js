import React from 'react';
import styled from 'styled-components';

const switchColor = type => {
  switch (type) {
    case 'ball':
      return 'rgb(4,116,194)';
    case 'strike':
      return 'rgb(182,133,3)';
    default:
      return 'rgb(197,14,11)';
  }
};

const switchColorGradient = type => {
  switch (type) {
    case 'ball':
      return 'linear-gradient(180deg, rgba(4,116,194,1) 0%, rgba(0,191,249,1) 100%)';
    case 'strike':
      return 'linear-gradient(180deg, rgba(182,133,3,1) 0%, rgba(241,198,36,1) 100%)';
    default:
      return 'linear-gradient(180deg, rgba(197,14,11,1) 49%, rgba(228,33,16,1) 100%)';
  }
};

const CircleWrapDiv = styled.div`
  position: relative;
`;

const CircleListSpan = styled.span`
  position: relative;
`;

const CircleBackgroundSpan = styled.span`
  display: inline-block;
  width: 20px;
  height: 20px;
  margin: 0 5px;
  border-radius: 50%;
  background: rgb(255, 255, 255);
  background: linear-gradient(180deg, rgba(255, 255, 255, 0.7) 0%, rgba(204, 204, 204, 0.7) 100%);
`;

const OnCircleListSpan = styled.span`
  position: absolute;
  top: 0;
  left: 0;
  z-index: 1;
`;

const OnCircleSpan = styled.span`
  display: inline-block;
  width: 20px;
  height: 20px;
  margin: 0 5px;
  border-radius: 50%;
  background: ${({ type }) => switchColor(type)};
  background: ${({ type }) => switchColorGradient(type)};
`;

const Circle = ({ number, show, type }) => {
  const circleList = [];
  const onCircleList = [];

  for (let i = 0; i < number; i++) {
    circleList.push(<CircleBackgroundSpan type={type} key={i} />);
  }

  for (let i = 0; i < show; i++) {
    onCircleList.push(<OnCircleSpan type={type} key={i} />);
  }

  return (
    <CircleWrapDiv>
      <CircleListSpan>{circleList}</CircleListSpan>
      <OnCircleListSpan>{onCircleList}</OnCircleListSpan>
    </CircleWrapDiv>
  );
};

export default Circle;
