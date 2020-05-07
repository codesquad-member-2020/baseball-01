import { css } from 'styled-components';
import introBg from './intro_bg.png';
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

export { IntroBg };
