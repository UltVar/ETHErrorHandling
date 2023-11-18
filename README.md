# ETHErrorHandling
Here is a guide on the ETH Error Handling project that I made!

# Description
This project is all about the error handling capabilities of Solidity. There are three common functions in error handling: Assert(), Require(), and Revert(). These are used to catch input errors and gate inputs that are not required in the functions.

# Assert and Require
Assert and Require are validation functions, which are used to validate inputs and variables. In the project, both were used inside the MintToken function. Require() was used to check the input value from the user as well as checking the totalSupply if it is less than or equal 12,000 in value. If it does, the function will return True and continue with the minting, otherwise it will stop its actions and revert all actions to the values of each variable in the contract. Assert() was used to validate the totalSupply if it at most reached 12,000. If it exceeds, it will return False and reverts all actions made within the mint token.

# Revert
Revert is mainly a command function, which is used to revert all actions made within the function. Revert() was used in the burnToken function. It's preceded by an if-statement in which checks if the totalSupply becomes less than zero after burning. If True, then the if-statement will go to the revert function and revert all burn actions and all variables' values are unchanged. Otherwise, the function will successfully burn the token.

# Source Code
```
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
```

# Video Presentation
Here is a link to a video presentation showcasing the actual error handling: https://www.loom.com/share/81004d1275ca458c82ca5f33edded418?sid=b45583dc-ab06-43a7-a95f-65fc200b745b
