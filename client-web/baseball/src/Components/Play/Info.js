import React from 'react';
import styled from 'styled-components';
import Circle from './Circle';
import Base from './Base';

const InfoWrapDiv = styled.div`
  width: 25%;
`;

const BallCountDiv = styled.div`
  width: 60%;
  padding: 10px 15px;
  color: #fff;
  border: 1px solid #000;
  border-radius: 5px;
  background: rgb(13, 25, 37);
  background: linear-gradient(180deg, rgba(13, 25, 37, 0.9) 50%, rgba(0, 0, 1, 0.9) 100%);
  > div {
    display: flex;
    align-items: center;
    margin: 5px 0;
    font-weight: bold;
    font-size: 18px;
    > span {
      width: 15px;
      margin-right: 10px;
    }
  }
`;

const Info = () => {
  return (
    <InfoWrapDiv>
      <Base hit='2'/>
      <BallCountDiv>
        <div>
          <span>B</span>
          <Circle number='3' show='2' type='ball' />
        </div>
        <div>
          <span>S</span>
          <Circle number='2' show='1' type='strike' />
        </div>
        <div>
          <span>O</span>
          <Circle number='2' show='1' type='out' />
        </div>
      </BallCountDiv>
    </InfoWrapDiv>
  );
};

export default Info;
