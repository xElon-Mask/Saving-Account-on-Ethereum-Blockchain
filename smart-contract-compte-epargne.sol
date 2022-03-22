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

    receive() external payable {
        if(address(this).balance == 0) {
            deadline = block.timestamp + 4 weeks;
            emit lancementEpargne(deadline);
        }

        depotID += 1;
        depots[depotID] = msg.value;
        emit argentDepose(block.timestamp, msg.value);
    }

    function sendEth() public payable {
        if(address(this).balance == 0) {
            deadline = block.timestamp + 4 weeks;
            emit lancementEpargne(deadline);
        }

        depotID += 1;
        depots[depotID] = msg.value;
        emit argentDepose(block.timestamp, msg.value);
    }

    function withdrawEth() public {
        require(msg.sender == proprietaire, "Vous n'êtes pas le propriétaire de ce compte Epargne");
        require(block.timestamp >= deadline, "Vous ne pouvez pas encore accéder à votre Epargne, la période de temps n'est pas totalement écoulée");
        payable(msg.sender).transfer(address(this).balance);
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }


}

    
