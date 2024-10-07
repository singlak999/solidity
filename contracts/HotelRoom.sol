// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom{
    address payable public owner;
    event Occupy(address occupant, uint value);
    enum Statuses{Vacant, Occupied}
    Statuses public currentStatus;
    constructor(){
        owner=payable(msg.sender);
        currentStatus=Statuses.Vacant;
    }

    modifier onlyWhileVacant{
        require(currentStatus==Statuses.Vacant,"Currently Occupied");
        _;
    }

    modifier costs(uint amount){
        require(msg.value>=amount, "Not enough ether provided");
        _;
    }

    function book() public payable onlyWhileVacant costs(2 ether){
        require(msg.value>=2 ether, "Not enough ether provided");
       
        owner.transfer(msg.value);
        (bool sent, bytes memory data)= (owner.call{value: msg.value})("");
        currentStatus=Statuses.Occupied;

        emit Occupy(msg.sender, msg.value);
    }
}