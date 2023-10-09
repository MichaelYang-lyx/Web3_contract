/*
// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.17 <0.9.0;

import "./VoucherToken.sol";

contract Merchant {
     struct Merchant {
         uint merchantId;
         mapping (uint => uint) productSurplus; 
     }

     mapping (uint => Merchant) public merchants;
     VoucherToken public voucherToken;

     event RedemptionApproved(uint merchantId, uint voucherId);

     modifier onlyMerchant(uint merchantId) {
         require(merchants[merchantId].merchantId == msg.sender, "You are not a merchant");
         _;
     }

     constructor(VoucherToken _voucherToken) {
         voucherToken = _voucherToken; 
     }

     function setSurplus(uint merchantId, uint productId, uint surplus) public onlyMerchant(merchantId) returns (bool) {
         merchants[merchantId].productSurplus[productId] = surplus; 
         return true; 
     }

     function redemptionApprove(uint merchantId, uint voucherId) public onlyMerchant(merchantId) returns (bool) {
         require(voucherToken.tokens[voucherId].merchantId == msg.sender, "You are not the merchant of this voucher"); 
         require(merchants[merchantId].productSurplus[voucherToken.tokens[voucherId].productId] > 0, "You do not have enough surplus for this product"); 
         merchants[merchantId].productSurplus[voucherToken.tokens[voucherId].productId]--;
         emit RedemptionApproved(merchantId, voucherId); 
         return true; 
     }
}

*/