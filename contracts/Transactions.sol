// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Transactions {
    uint256 public totalTransactions;

    // difference between events and structs in solidity:
    // events are public, structs are private
    // events are emitted by the contract, structs are used to form input parameters for functions and return values

    // transfer event -- emitted when a transfer is made
    event Transfer(address from, address receiver, uint amount, string message, uint256 timestamp, string keyword);
    // transfer struct -- used to form input parameters
    struct TransferStruct {
        address sender;
        address receiver;
        uint amount;
        string message;
        uint256 timestamp;
        string keyword;
    }

    TransferStruct[] transactions;

    // main smart contract function
    function addToBlockchain(address payable receiver, uint amount, string memory message, string memory keyword) public {
        totalTransactions += 1;
        transactions.push(TransferStruct(msg.sender, receiver, amount, message, block.timestamp, keyword));

        // emit the transfer event
        emit Transfer(msg.sender, receiver, amount, message, block.timestamp, keyword);
    }

    function getAllTransactions() public view returns (TransferStruct[] memory) {
        return transactions;
    }

    function getTransactionCount() public view returns (uint256) {
        return totalTransactions;
    }
}
