pragma solidity ^0.4.18;

import './base/Level.sol';
import './CallMeMaybe.sol';

contract CallMeMaybeFactory is Level {

  uint public insertCoin = 0.1 ether;

  function createInstance(address _player) public payable returns (address) {
    _player;
    require(msg.value >= insertCoin);
    CallMeMaybe instance = new CallMeMaybe();
    require(this.balance >= insertCoin);
    instance.transfer(insertCoin);
    return instance;
  }

  function validateInstance(address _instance, address _player) public constant returns (bool) {
    _player;
    CallMeMaybe instance = CallMeMaybe(_instance);
    return instance.balance == 0;
  }

  function() public payable {}
}
