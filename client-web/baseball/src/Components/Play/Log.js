import React from 'react';
import styled from 'styled-components';

const LogWrapDiv = styled.div`
  position: relative;
  overflow-y: auto;
  width: 150px;
  max-height: 70vh;
  padding: 10px 15px;
  margin-bottom: 15px;
  color: #fff;
  text-align: center;
  border: 1px solid #000;
  border-radius: 5px;
  background: rgb(13, 25, 37);
  background: linear-gradient(180deg, rgba(13, 25, 37, 0.9) 50%, rgba(0, 0, 1, 0.9) 100%);
  > div:first-child {
    color: #e8a602;
  }
  > div + div {
    padding-top: 8px;
    margin-top: 8px;
    border-top: 1px solid #a6a8b2;
  }
  p {
    margin: 5px 0;
    color: #01a7e8;
  }
  li {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin: 5px 0;
    font-size: 14px;
    color: #a6a8b2;
  }
`;

const Log = () => {
  return (
    <LogWrapDiv>
      <div>
        1번 타자 민병헌
        <ul>
          <li>
            볼<span>S1 B3</span>
          </li>
          <li>
            볼<span>S1 B2</span>
          </li>
          <li>
            볼<span>S1 B1</span>
          </li>
          <li>
            스트라이크<span>S1 B0</span>
          </li>
        </ul>
      </div>
      <div>
        9번 타자 민병헌
        <p>아웃</p>
        <ul>
          <li>
            볼<span>S1 B3</span>
          </li>
          <li>
            볼<span>S1 B2</span>
          </li>
          <li>
            볼<span>S1 B1</span>
          </li>
          <li>
            스트라이크<span>S1 B0</span>
          </li>
        </ul>
      </div>
      <div>
        8번 타자 민병헌
        <p>안타</p>
        <ul>
          <li>
            볼<span>S1 B3</span>
          </li>
          <li>
            볼<span>S1 B2</span>
          </li>
          <li>
            볼<span>S1 B1</span>
          </li>
          <li>
            스트라이크<span>S1 B0</span>
          </li>
        </ul>
      </div>
    </LogWrapDiv>
  );
};

export default Log;
