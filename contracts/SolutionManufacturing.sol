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

    // constructor() public {
    //     materials["stainlessSheet"] = 0;
    //     materials["hardware"] = 0;
    //     materials["wire"] = 0;
    //     materials["plastic"] = 0;
    //     materials["buttons"] = 0;
    //     materials["display"] = 0;
    
    // }
    
    // string aluminumBar ="Aluminum Bars"; 
    // string stainlessSheet ="stainlessSheet"; 
    // string steelCable ="steel cable";
    // string hardware ="hardware";
    // string interior ="interior";
    // string display ="display";
    // string wire = "wire";
    // string plastic = "plastic";
    
    // Variables to clean things up
    uint256 noSheet = materials["stainlessSheet"];
    uint noHardware = materials["hardware"];
    uint noWire = materials["wire"];
    uint noPlastic = materials["plastic"];
    uint noLight = materials["display"];

    function doors() private returns(uint numOfDoors) {
        // Error catch - If just one thing is missing, Product cannot be made...
        // require(noSheet >= 2 || noHardware >= 2);
        // if(noSheet < 1 || noHardware < 1) {
        //     return 0;
        // }
        
        Door memory door = Door(2, 2);
        // numOfDoors = materials["stainlessSheet"];
        numOfDoors = 1;
        productStruct.Name = "Doors";
        productStruct.Quantity = numOfDoors;
        productList.push(productStruct);
        // materials["stainlessSheet"] = 0;
        // materials["hardware"] =0;
        return numOfDoors;

    }
    
    function controllers() private returns(uint numOfControllers) {
        // Error catch - If just one thing is missing (or zero), Product cannot be made...
        // require(noWire > 2 || noPlastic > 2);
        // if(noWire < 1 || noPlastic < 1) {
        //     return 0;
        // }
        
        Controller memory controller = Controller(10, 15);
        // numOfControllers = materials["wire"] /= controller.wire;
        numOfControllers = 2;
        productStruct.Name = "Controllers";
        productStruct.Quantity = numOfControllers;
        productList.push(productStruct);
        // materials["wire"] = 0;
        // materials["plastic"] = 0;
        return numOfControllers;

    }
    
    function controlPanels() private returns(uint numOfControlPanels) {
        // Error catch - If just one thing is missing (or zero), Product cannot be made...
        // require(noWire > 2 || noPlastic > 2 || noHardware > 2 || noLight > 2);
        // if(noWire < 1 || noPlastic < 1 || noHardware < 1 || noLight < 1) {
        //     return 0;
        // }
        
        ControlPanel memory controlPanel = ControlPanel(10, 20, 100, 2);
        // numOfControlPanels = materials["plastic"] /= controlPanel.plastic;
        numOfControlPanels = 3;
        productStruct.Name = "ControlPanels";
        productStruct.Quantity = numOfControlPanels;
        productList.push(productStruct);
        // materials["wire"] = 0;
        // materials["hardware"] = 0;
        // materials["plastic"] = 0;
        // materials["display"] = 0;
        return numOfControlPanels;

    }
    
    function callSigns() private returns(uint numOfCallSigns) {
        // Error catch - If just one thing is missing (or zero), Product cannot be made...
        // require(noWire > 2 || noHardware > 2 || noLight > 2);
        // if(noWire < 1|| noHardware < 1 || noLight < 1) {
        //     return 0;
        // }
        
        CallSign memory callSign = CallSign(10, 10, 2);
        // numOfCallSigns = materials["display"] /= callSign.display;
        numOfCallSigns = 4;
        productStruct.Name = "CallSigns";
        productStruct.Quantity = numOfCallSigns;
        productList.push(productStruct);
        // materials["wire"] = 0;
        // materials["hardware"] = 0;
        // materials["display"] = 0;
        return numOfCallSigns;

    }

    uint private index = 0;
   
    function getOrder(address a) public {
        Material.materialObj[] memory m = Material(a).getMaterial();
        for(index; index<m.length;index++){
            materials[m[index].material] = m[index].reqAmount;
        }
        doors();
        controllers();
        controlPanels();
        callSigns();
        
        // return m;
    }
    
    function viewOrder() public view returns (ProductObj[] memory) {
        return productList;
    }
  
}

