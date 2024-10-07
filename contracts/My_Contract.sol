// SPDX-License-Ientifier: MIT

pragma solidity ^0.8.0;
contract My_Contract{
    address public owner;
    constructor(){
        owner=msg.sender;
    }
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
    function isEven(uint n) public pure returns (bool){
        if (n%2==0){
            return true;
        }
        return false;
    }

    function countEvenNumber() public view returns(uint){
        uint count=0;
        for(uint i =0; i<numbers.length; i++){
            if(isEven(numbers[i])){
                count++;
            }
        }
        return count;
    }

    function isOwner() public view returns(bool){
        return (msg.sender==owner);
    }
}