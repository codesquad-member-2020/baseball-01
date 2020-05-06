import React from 'react';

const NoMatch = ({ location }) => {
  return (
    <div>
      <h1>404 NOT FOUND!</h1>
      <p>찾으시는 페이지가 없습니다! 주소가 맞나 다시 한 번 확인해주세요!</p>
      <p>{location.pathname}</p>
    </div>
  );
};

export default NoMatch;
