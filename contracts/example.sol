// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract example {

	string myString = 'hello world';

	function sayHello() external view returns(string memory ){
		return myString;
	}
}
