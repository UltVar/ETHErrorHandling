// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract MyToken {

    // public variables here
    string public tokenName = "Ultima";
    string public tokenAbbreviation = "ult";
    uint public totalSupply = 0;

    // mapping variable here
    mapping(address => uint) public balance;

    // mint function
    function mintToken(address _address, uint _value) public{
        require(_value <= 12000 && totalSupply <= 12000);
        totalSupply += _value;
        balance[_address] += _value;
        assert(totalSupply <= 12000);
    }

    // burn function
    function burnToken(address _address, uint _value) public{
        totalSupply -= _value;
        balance[_address] -= _value;
        if(totalSupply < 0){
            revert();
        }
    }
}