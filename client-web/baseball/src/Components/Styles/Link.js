import { Link } from 'react-router-dom';
import styled, { keyframes } from 'styled-components';
import { BaseballBg } from './Backgorund';

const StartLinkMoveY = keyframes`
  from {
    opacity: 0;
    animation-timing-function: cubic-bezier(0.02, 0.01, 0.21, 1);
    transform: scale(0.4) translate(-120px, 0px);
  }
  to {
    opacity: 1;
    transform: scale(1) translate(0px, 150px) rotate(720deg);;
  }
`;

const StartLink = styled(Link)`
  position: absolute;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 120px;
  height: 120px;
  font-weight: bold;
  font-size: 24px;
  color: #fff;
  text-align: center;
  line-height: 1.2;
  text-shadow: 2px 2px 2px gray;
  z-index: 1;
  animation-duration: 1.5s;
  animation-timing-function: ease-out;
  animation-name: ${StartLinkMoveY};
  animation-fill-mode: forwards;
  &::before {
    content: '';
    position: absolute;
    width: 100%;
    height: 100%;
    ${BaseballBg}
    box-shadow: 0 2px 5px rgba(27, 31, 35, 0.1);
    z-index: -1;
  }
  &:hover {
    &::before {
      transform: rotate(720deg);
    }
  }
`;

export { StartLink };
