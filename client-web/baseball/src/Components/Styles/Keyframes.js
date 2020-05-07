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

export { introBallMove, introTitleMove, grow };
