// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./ProjectOffice.sol";

//like a javascript class
contract Material {
    string public material;
    uint public age;

    materialObj[] public materialList;
    
    // Constructor   
    //    function Material() public {
        
    //    }
    struct materialObj {
        string _material;
        uint _reqAmount;
    }


    //Reading data from another smart contract

    //Running calculations on the type and amount of materials needed for THIS request

    //Array to store all the materials in a list and function to push it





   // Types of variables
   // #STRINGS -
   // #INT/UINT -
   // #ADDRESS -
   // #BYTES1 Through 32 - 
   // #BYTES -
   // #MAPPING -
   // #STRUCT -
    

    // Visibility in Solidity -For variables and Functions
    // Public -Variables or functions that can be called by other smart contracts
    // Private -Variables and functions are only available for the current contract
    // Internal -Variables and functions can only be accesssed by only one contract 
    // External -Variables and functions that can be called from other contracts in transactions and can only be called internally with specific this.functionName() method


    //More on variables
    //State Variables
    //Local Variables
    //Global variables
}