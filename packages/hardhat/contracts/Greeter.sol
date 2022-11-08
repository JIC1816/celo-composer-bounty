//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// remember to remove unnecessary imports and its use when deploying your smart contract
import "hardhat/console.sol";

contract Greeter {
    event newGreeting(string greeting, address sender);

    string private greeting;

    constructor(string memory _greet) {
        console.log("Deploying a Greeter with greeting:", _greet);
        greeting = _greet;
    }

    function greet() external view returns (string memory) {
        return greeting;
    }

    function setGreeting(string memory _greeting) external {
        if (bytes(_greeting).length < 5) {
            revert("Greeting must be at least 5 characters long");
        }
        console.log("Changing greeting from '%s' to '%s'", greeting, _greeting);
        greeting = _greeting;
        emit newGreeting(_greeting, msg.sender);
    }
}
