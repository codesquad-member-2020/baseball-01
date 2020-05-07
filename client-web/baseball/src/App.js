import React from 'react';
import Routes from './Components/Routes';
import GlobalStyled from './Components/Styles/GlobalStyle';

function App() {
  return (
    <>
      <GlobalStyled width={'1000px'} />
      <Routes />
    </>
  );
}

export default App;
