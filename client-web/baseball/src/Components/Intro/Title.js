import React from 'react';
import { Link } from 'react-router-dom';

const Title = () => {
  const styleDiv = {
    color: '#fff',
    textAlign: 'center',
  };
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
    <div className='inner' style={styleDiv}>
      <h1 style={styleH1}>CODE STRIKE</h1>
      <p style={styleP}>Online Baseball Game</p>
      <Link to='/match'>GAME START</Link>
    </div>
  );
};

export default Title;
