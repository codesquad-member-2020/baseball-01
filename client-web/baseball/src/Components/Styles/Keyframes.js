import { keyframes } from 'styled-components';
const grow = keyframes`
  0%, 40%, 100% {
    -webkit-transform: scale(0);
            transform: scale(0);
  }
  40% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
`;
const introBallMove = keyframes`
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

const introTitleMove = keyframes`
  from {
    opacity: 0;
    transform: translateX(-30px)
  }
  to {
    opacity: 1;
    transform: translateX(0)
  }
`;

const beforeBorders = keyframes`
  from {
    width:0;
    height:100%;
  }
  to {
    width:100%;
    height:100%;
  }
`;
const afterBorders = keyframes`
  0% {
    top: calc(var(--border-width) * -1);
    left: auto;
    bottom: auto;
    right: 50%;
    width: 0;
    height: var(--border-width);
  }
  33% {    
    top: calc(var(--border-width) * -1);
    left: auto;
    bottom: auto;
    right: calc(var(--border-width) * -1);
    width: calc(var(--border-width) + 50%);
    height: var(--border-width);
  }
  66% {
    top: calc(var(--border-width) * -1);
    left: auto;
    bottom: auto;
    right: calc(var(--border-width) * -1);
    width: var(--border-width);
    height: calc((var(--border-width) * 2) + 100%);
  }
  100% {
    top: auto;
    left: auto;
    bottom: calc(var(--border-width) * -1);
    right: calc(var(--border-width) * -1);
    width: calc(var(--border-width) + 50%);
    height: calc((var(--border-width) * 2) + 100%);
  }
`;
export { introBallMove, introTitleMove, grow, beforeBorders, afterBorders };
