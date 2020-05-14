import axios from 'axios';
import React from 'react';
import { URL } from '../../constant/url';
import styled from 'styled-components';
import { messageMove } from '../Styles/Keyframes';
import { PlayBg } from '../Styles/Backgorund';
import useAsync from '../Utils/useAsync';
import { Loader } from '../Utils/Loader';
import Score from './Score';
import Player from './Player';
import Pitch from './Pitch';
import Log from './Log';
import Info from './Info';

const PlayWrapDiv = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  ${PlayBg}
`;

const InnerDiv = styled.div`
  position: relative;
  display: flex;
  flex-direction: column;
  width: ${props => props.width};
  height: 100%;
`;

const BottomDiv = styled.div`
  display: flex;
  justify-content: space-between;
  margin-top: 15px;
`;

const Message = styled.p`
  position: absolute;
  top: 20%;
  left: 54%;
  font-weight: bold;
  font-size: 80px;
  color: white;
  text-shadow: 0 0.1em 20px rgba(0, 0, 0, 1), 0.05em -0.03em 0 rgba(0, 0, 0, 1), 0.05em 0.005em 0 rgba(0, 0, 0, 1), 0em 0.08em 0 rgba(0, 0, 0, 1),
    0.05em 0.08em 0 rgba(0, 0, 0, 1), 0px -0.03em 0 rgba(0, 0, 0, 1), -0.03em -0.03em 0 rgba(0, 0, 0, 1), -0.03em 0.08em 0 rgba(0, 0, 0, 1),
    -0.03em 0 0 rgba(0, 0, 0, 1);
  transform: translateX(-50%);
  animation: ${messageMove} 1s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards infinite alternate;
`;

const Play = ({ location }) => {
  console.log(location);
  const { matchID, userTeam } = location.state.detail;

  const setupData = async () => {
    const response = await axios(`${URL}/matches/${matchID}/teams/${userTeam}/setup`);
    return response;
  };

  const state = useAsync(setupData);
  const { loading, data, error } = state;
  if (loading) return <Loader />;
  if (error) return <div>에러</div>;
  if (!data) return null;
  
  const setData = data.data
  console.log(setData)

  return (
    <PlayWrapDiv>
      <InnerDiv width='1000px'>
        <Score data={setData}/>
        <Player />
        <Pitch />
        <BottomDiv>
          <Info />
          <Log />
        </BottomDiv>
        <Message children='STRIKE!!' />
      </InnerDiv>
    </PlayWrapDiv>
  );
};

export default Play;
