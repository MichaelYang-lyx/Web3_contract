/*
// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.17 <0.9.0;

import "./VoucherToken.sol";

contract Consumer {
    struct Consumer {
        uint consumerId;
        uint[] vouchers;
    }

    mapping (uint => Consumer) public consumers;
    VoucherToken public voucherToken;

    event RedemptionRequested(uint consumerId, uint voucherId);

    modifier onlyConsumer(uint consumerId) {
        require(consumers[consumerId].consumerId == msg.sender, "You are not a consumer");
        _;
    }

    constructor(VoucherToken _voucherToken) {
        voucherToken = _voucherToken;
    }

    function addVoucher(uint consumerId, uint voucherId) public onlyConsumer(consumerId) returns (bool) {
        consumers[consumerId].vouchers.push(voucherId);
        return true;
    }

    function redemptionRequest(uint consumerId, uint voucherId) public onlyConsumer(consumerId) returns (bool) {
        require(voucherToken.tokens[voucherId].ownerId == msg.sender, "You do not own this voucher");
        emit RedemptionRequested(consumerId, voucherId);
        return true; 
    }
}
*/