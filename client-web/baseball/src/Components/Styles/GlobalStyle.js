import { createGlobalStyle } from 'styled-components';
import reset from 'styled-reset';

const GlobalStyled = createGlobalStyle`
  ${reset}
  * {
    box-sizing: border-box;
  }
  body {
    overflow:hidden;
    padding: 0;
    margin: 0;
    font-family: 'Noto Sans KR', 'Montserrat', sans-serif;
    height: 100vh;
  }
  a {
    text-decoration: none;
  }
  #wrap {
    height: 100vh;
  }
  .inner {
    width: ${props => props.width};
   }
`;

export default GlobalStyled;
