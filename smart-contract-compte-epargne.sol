// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Epargne {
    address proprietaire;
    uint deadline;
    uint depotID;

    mapping (uint => uint) depots;

    event lancementEpargne(uint deadline);
    event argentDepose(uint date, uint value);

    constructor(){
        proprietaire=msg.sender;
    }

    
}