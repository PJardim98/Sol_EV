// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract SmartMeter{
    bool public buyer;
    bool public seller;
    address payable public owner;

    constructor(bool isBuyer, bool isSeller, address payable _owner) public {
        require(isBuyer != isSeller);
        buyer = isBuyer;
        seller = isSeller;
        owner = _owner;
    }

    


}