import React from 'react';

const Title = () => {
  const styleH1 = {
    marginBottom: 20,
    fontFamily: 'Bungee Outline',
    fontSize: 80,
    transform: 'skew(-20deg)',
  };
  const styleP = {
    marginBottom: 80,
    fontWeight: 300,
    letterSpacing: 10,
  };
  return (
    <>
      <h1 style={styleH1}>CODE STRIKE</h1>
      <p style={styleP}>Online Baseball Game</p>
    </>
  );
};

export default Title;
