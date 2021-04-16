// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract ProjectOffice {
  Parts[] parts;
  address public owner;
  // mapping(address => Projects) public projects;

  // event for EVM logging
  event OwnerSet(address indexed oldOwner, address indexed newOwner);

  // function assign(uint projectId) public returns (uint) {
  //     require(projectId >= 0 && projectId <= 9);

  //     projects[projectId] = msg.sender;

  //     return projectId;
  // }

  struct Parts {
    uint256 Controllers;
    uint256 Shafts;
    uint256 Doors;
    uint256 Buttons;
    uint256 Displays;
    uint256 Pulleys;
  }

  // event DataStored(uint256 Controllers);

   modifier isOwner() {
         // If the first argument of 'require' evaluates to 'false', execution terminates and all
         // changes to the state and to Ether balances are reverted.
         // This used to consume all gas in old EVM versions, but not anymore.
         // It is often a good idea to use 'require' to check if functions are called correctly.
         // As a second argument, you can also provide an explanation about what went wrong.
         require(msg.sender == owner, "Caller is not owner");
         _;
   }

   constructor() public {
       owner = msg.sender; // 'msg.sender' is sender of current call, contract deployer for a constructor
       emit OwnerSet(address(0), owner);
   }

  // function changeOwner(address newOwner) public isOwner {
  //       emit OwnerSet(owner, newOwner);
  //       owner = newOwner;
  // }

  function neededParts(uint256 Batteries, uint256 Columns, uint256 Elevators, uint256 Floors) public isOwner {
      Parts memory p;
      p.Controllers = Batteries;
      p.Shafts = Elevators;
      p.Doors = Elevators * Floors;
      /*Multiples the elevator buttons by each floor and adds the buttons outside the elevator
      to the columns minus 1 up for the top floor and down for the first floor*/
      p.Buttons = (Elevators * Floors) + ((Columns * 5) - 2);
      p.Displays = Elevators;
      p.Pulleys = Elevators;

      parts.push(p);
  }

  // function getAddresses() public view returns (address[10] memory) {
  //   return projects;
  // }

  function getProjects() public view returns (Parts[] memory) {
    return parts;
  }
}