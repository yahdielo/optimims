// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract tic_tac_toeXO{

    address owner;

    struct Rows {
        uint value1;
        uint value2;
        uint value3;
    }
    struct Game {
        uint256 gameId;
        bool gameStarted;
        bool gameFull;
        address player1;
        address player2;
        Rows[3] board;
    }
    uint256 ID;
    Game game;

    mapping(uint256 => Game) allGames;

    event GameStarted(uint256 _Id, address _player1);
    event player2Joined(uint256 _id, address _player2);

    function startGame() external {

        ID++;
        allGames[ID].gameId = ID;
        allGames[game.gameId].player1 = msg.sender;
        allGames[game.gameId].gameStarted = true;
        emit GameStarted(ID, msg.sender);
    }

    function addPlayer2(uint256 _gameId, address _player2) internal {
        allGames[_gameId].player2 = _player2;

        emit player2Joined(_gameId, _player2);    
    }

    function _checkForGames(address _newPlayer) internal {
        for (uint i = 0; i < ID; i++){
            if (allGames[i].gameStarted == true && allGames[i].gameFull == false){
                addPlayer2(i, _newPlayer);
                
            }
        }
        
    }
    function joinAgame() external {
        //this function will joined you to any avaliable game
    } 


}