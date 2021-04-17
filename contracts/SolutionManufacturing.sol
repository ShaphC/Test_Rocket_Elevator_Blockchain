//SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;
import "./MaterialProvider.sol";

contract SolutionManufacturing {
   
    mapping (string => uint256) public materials;

    struct ProductObj {
        string Name;
        uint256 Quantity;
    }

    struct Door {
        uint256 stainlessSheet;
        uint256 hardware;
    }
    
    struct Controller {
        uint256 wire;
        uint256 plastic;
    }
    
    struct ControlPanel {
        uint256 wire;
        uint256 plastic;
        uint256 hardware;
        uint256 display;
    }
    
    struct CallSign {
        uint256 wire;
        uint256 hardware;
        uint256 display;
    }
   
    ProductObj productStruct;
    ProductObj[] productList;
    
    // Variables to clean things up
    uint noSheet = materials["stainlessSheet"];
    uint noHardware = materials["hardware"];
    uint noWire = materials["wire"];
    uint noPlastic = materials["plastic"];
    uint noLight = materials["display"];

    function doors() public returns(uint numOfDoors) {
        // Error catch - If just one thing is missing, Product cannot be made...
        require(noSheet < 2 || noHardware < 2);
        
        Door memory door = Door(1, 1);
        numOfDoors = materials["stainlessSheet"] /= door.stainlessSheet;
        productStruct.Name = "Doors";
        productStruct.Quantity = numOfDoors;
        productList.push(productStruct);
        materials["stainlessSheet"] = 0;
        return numOfDoors;
    }
    
    function controllers() public returns(uint numOfControllers) {
        // Error catch - If just one thing is missing (or zero), Product cannot be made...
        if(noWire > 10 || noPlastic > 2) {
            return 0;
        }
        
        Controller memory controller = Controller(10, 15);
        numOfControllers = materials["wire"] /= controller.wire;
        productStruct.Name = "Controllers";
        productList.push(productStruct);
        materials["wire"] = 0;
        return numOfControllers;

    }
    
    function controlPanels() public returns(uint numOfControlPanels) {
        // Error catch - If just one thing is missing (or zero), Product cannot be made...
        if(noWire >= 10 || noPlastic >= 20 || noHardware >= 100 || noLight >= 2) {
            return 0;
        }
        
        ControlPanel memory controlPanel = ControlPanel(10, 20, 100, 2);
        numOfControlPanels = materials["plastic"] /= controlPanel.plastic;
        productStruct.Name = "Controllers";
        productList.push(productStruct);
        materials["plastic"] = 0;
        return numOfControlPanels;

    }
    
    function callSigns() public returns(uint numOfCallSigns) {
        // Error catch - If just one thing is missing (or zero), Product cannot be made...
        if(noWire >= 10 || noHardware >= 10 || noLight >= 2) {
            return 0;
        }
        
        CallSign memory callSign = CallSign(10, 10, 2);
        numOfCallSigns = materials["display"] /= callSign.display;
        productStruct.Name = "CallSigns";
        productList.push(productStruct);
        materials["display"] = 0;
        return numOfCallSigns;

    }

    uint private index = 0;
   
    function getOrder(address a) public {
        MaterialProvider.materialObj[] memory m = MaterialProvider(a).getMaterial();
        
        for(index; index<m.length;index++){
            materials[m[index].material] = m[index].reqAmount;
        }
        doors();
        controllers();
        controlPanels();
        callSigns();

    }
    
    function viewOrder() public view returns (ProductObj[] memory) {
        return productList;
    }
  
}