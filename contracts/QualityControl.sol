//SPDX-License-Identifier: MIT
pragma solidity >=0.5.00 <0.9.0;
pragma experimental ABIEncoderV2;

import './SolutionManufacturing.sol';

contract QualityControl {

    struct Permit{
        uint256 identifier;
        uint256 startdate;
        uint256 enddate;
        //uint datetime // 1512220800
    }

    struct ProductObj{
        string name;
        uint64 quantity;
        bool verified;
    }

    struct Verification{
        Permit certificate;
        Permit perm;
        ProductObj[] mList;
    }
    //Product[] mList;
    Verification v;
    uint64 index = 0;


    function generatePermit() private view returns(Permit memory certificate){
        Permit memory p;
        p.identifier = block.timestamp/2;
        p.startdate = block.timestamp;
        p.enddate = block.timestamp + 5* 365 days;
        return p;
    }

    function VerificationStamp(address a) public{
        v.certificate = generatePermit();
        v.perm = generatePermit();
        SolutionManufacturing.ProductObj[] memory productList = SolutionManufacturing(a).viewOrder();
        for(index;index<productList.length;index++){
            productList memory p;
            p.verified = true;
            p.name = productList[index].Name;
            p.quantity = productList[index].Quantity;
            v.mList.push(p);
        }
    }

    function getVerification() public view returns(Verification memory){
        return v;
    }



}