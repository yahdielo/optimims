// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract tictactoe {

    address owner;

    // the values represent the columns of each row
    struct Rows {
        uint value1;
        uint value2;
        uint value3;
    }
    struct Game {
        uint256 gameId;
        bool gameStarted;
        bool gameFull;
        bool gameFinish;
        address player1;
        address player2;
        uint256 p1Move; //player1 needs to make a move so the next one can make his
        uint256 p2Move; //to keep track of moves i took the p1 and p2 moves aproach, so players cant jump turns
        address winner;
        Rows[3] board;
    }
    uint256 ID;
    Game game;

    mapping(uint256 => Game) allGames;

    event GameStarted(uint256 _Id, address _player1);
    event player2Joined(uint256 _id, address _player2);
    event  challengeStarted(uint256 _id);
    event playerMadeHisMove(uint256 _gameId,address _player);

    constructor() {
        owner = msg.sender;
    }

    function startGame() external {

        allGames[ID].gameId = ID;
        allGames[game.gameId].player1 = msg.sender;
        allGames[game.gameId].gameStarted = true;

        emit GameStarted(ID, msg.sender);

        ID++;
    }

    function _addPlayer2(uint256 _gameId, address _player2) internal {
        //add player 2 to the game
        allGames[_gameId].player2 = _player2;
        allGames[_gameId].gameFull = true;
        emit player2Joined(_gameId, _player2);    
    }

    function _checkForGames(address _newPlayer) internal {
        //will iterate in the mapping to find any avaliable game
        for (uint i = 0; i <= ID; i++){
            if (allGames[i].gameStarted == true && allGames[i].gameFull == false){
                _addPlayer2(i, _newPlayer);
            }
        }
    }

    function joinAgame() external {
        //this function will joined you to any avaliable game
        _checkForGames(msg.sender);
    } 

    function challengeFriend(address _player2) external {

        allGames[ID].gameId = ID;
        allGames[game.gameId].player1 = msg.sender;
        allGames[game.gameId].player2 = _player2;
        allGames[game.gameId].gameStarted = true;
        allGames[game.gameId].gameFull = true;

        emit challengeStarted(ID);

        ID++;
    }

    function _checkWinner(uint256 _gameId) internal returns(uint256){
        //this function will scan for combinations of winner and return 1 if player 1 won and 2 if player 2 won
        // and 0 if we still dont have a winner;
    }

    //this example bellow represent the board and the spaces
    //  1| 2| 3
    //  4| 5| 6
    //  7| 8| 9
    // as solidity doest allow for multi dimensional array
    // the number 1 respresents [0][0], 2 = [0][1], 3 = [0][2] and so on
    function makeMove(uint256 _gameId, uint256 _move) external {
        
        if (msg.sender == allGames[_gameId].player1){
            if(_move == 1){
                require(allGames[_gameId].board[0].value1 == 0);
                allGames[_gameId].board[0].value1 = 1;
            }
            if(_move == 2){
                require(allGames[_gameId].board[0].value2 == 0);
                allGames[_gameId].board[0].value2 = 1;
            }
            if(_move == 3){
                require(allGames[_gameId].board[0].value3 == 0);
                allGames[_gameId].board[0].value3 = 1;
            }
            if(_move == 4){
                require(allGames[_gameId].board[1].value1 == 0);
                allGames[_gameId].board[1].value1 = 1;
            }
            if(_move == 5){
                require(allGames[_gameId].board[1].value2 == 0);
                allGames[_gameId].board[1].value2 = 1;
            }
            if(_move == 6){
                require(allGames[_gameId].board[1].value3 == 0);
                allGames[_gameId].board[1].value3 = 1;
            }
            if(_move == 7){
                require(allGames[_gameId].board[2].value1 == 0);
                allGames[_gameId].board[2].value1 = 1;
            }
            if(_move == 8){
                require(allGames[_gameId].board[2].value2 == 0);
                allGames[_gameId].board[2].value2 = 1;
            }
            if(_move == 9){
                require(allGames[_gameId].board[2].value2 == 0);
                allGames[_gameId].board[2].value2 = 1;
            }
            allGames[_gameId].p1Move++;
            emit playerMadeHisMove(_gameId, msg.sender);
        }
        if (msg.sender == allGames[_gameId].player2){
            require(allGames[_gameId].p2Move < allGames[_gameId].p1Move, "Not your turn");
            if(_move == 1){
                require(allGames[_gameId].board[0].value1 == 0);
                allGames[_gameId].board[0].value1 = 2;
            }
            if(_move == 2){
                require(allGames[_gameId].board[0].value2 == 0);
                allGames[_gameId].board[0].value2 = 2;
            }
            if(_move == 3){
                require(allGames[_gameId].board[0].value3 == 0);
                allGames[_gameId].board[0].value3 = 2;
            }
            if(_move == 4){
                require(allGames[_gameId].board[1].value1 == 0);
                allGames[_gameId].board[1].value1 = 2;
            }
            if(_move == 5){
                require(allGames[_gameId].board[1].value2 == 0);
                allGames[_gameId].board[1].value2 = 2;
            }
            if(_move == 6){
                require(allGames[_gameId].board[1].value3 == 0);
                allGames[_gameId].board[1].value3 = 2;
            }
            if(_move == 7){
                require(allGames[_gameId].board[2].value1 == 0);
                allGames[_gameId].board[2].value1 = 2;
            }
            if(_move == 8){
                require(allGames[_gameId].board[2].value2 == 0);
                allGames[_gameId].board[2].value2 = 2;
            }
            if(_move == 9){
                require(allGames[_gameId].board[2].value2 == 0);
                allGames[_gameId].board[2].value2 = 2;
            }
            allGames[_gameId].p2Move++;
            emit playerMadeHisMove(_gameId, msg.sender);
        }
        if (allGames[_gameId].p1Move >= 3){
            _checkWinner(_gameId);
        }
    }

    


}