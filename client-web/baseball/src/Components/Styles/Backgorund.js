import { css } from 'styled-components';
import introBg from './intro_bg.png';
import baseballBg from './baseball.png';
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
  width: 100%;
  height: 100%;
  background: url(${baseballBg}) no-repeat;
  background-size: cover;
  opacity: 0.7;
  transition: all 3s;
`;
export { IntroBg, BaseballBg };
