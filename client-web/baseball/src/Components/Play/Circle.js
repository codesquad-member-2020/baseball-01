import React from 'react';
import styled from 'styled-components';

const switchColor = type => {
  switch (type) {
    case 'ball':
      return '#6acb12';
    case 'strike':
      return '#e0e004';
    default:
      return '#e01a1a';
  }
};
const switchBoxShadow = type => {
  switch (type) {
    case 'ball':
      return 'rgba(0, 0, 0, 0.2) 0 0 5px 1px, inset #304701 0 0 5px, #6acb12 0 0 5px';
    case 'strike':
      return 'rgba(0, 0, 0, 0.2) 0 0 5px 1px, inset #808002 0 0 5px, #e0e004 0 0 5px';
    default:
      return 'rgba(0, 0, 0, 0.2) 0 0 5px 1px, inset #441313 0 0 5px, rgba(255, 0, 0, 0.5) 0 0 5px';
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
  margin: 0 2px;
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
  margin: 0 2px;
  border-radius: 50%;
  box-shadow: ${({ type }) => switchBoxShadow(type)};
  background: ${({ type }) => switchColor(type)};
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
