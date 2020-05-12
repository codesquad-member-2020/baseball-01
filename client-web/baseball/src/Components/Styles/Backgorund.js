import { css } from 'styled-components';
import introBg from './intro_bg.png';
import baseballBg from './baseball_bg.jpg';
import ballBg from './ball_bg.png';
import playBg from './play_bg.jpg';


const IntroBg = css`
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  width: 100%;
  height: 100%;
  background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)), url(${introBg}) no-repeat;
  background-size: cover;
`;

const BaseballBg = css`
  background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)), url(${baseballBg}) no-repeat;
  background-size: cover;
`

const PlayBg = css`
  background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(${playBg}) no-repeat;
  background-size: cover;
`

const BallBg = css`
  width: 100%;
  height: 100%;
  background: url(${ballBg}) no-repeat;
  background-size: cover;
  opacity: 0.7;
  transition: all 3s;
`;
export { IntroBg, BaseballBg, BallBg, PlayBg };
