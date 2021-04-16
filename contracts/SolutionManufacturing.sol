//SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;
import "./MaterialProvider.sol";

contract SolutionManufacturing {
   
    mapping (string => uint256) materials;

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
        uint256 buttons;
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

    constructor() public {
        materials["stainlessSheet"] = 0;
        materials["hardware"] = 0;
        materials["wire"] = 0;
        materials["plastic"] = 0;
        materials["buttons"] = 0;
        materials["display"] = 0;
    
    }
    
    // Variables to clean things up
    uint noSheet = materials["stainlessSheet"];
    uint noHardware = materials["hardware"];
    uint noSensor = materials["sensor"];
    uint noWire = materials["wire"];
    uint noPlastic = materials["plastic"];
    uint noHarness = materials["harness"];
    uint noButton = materials["buttons"];
    uint noLight = materials["display"];

    function doors() public returns(uint numOfDoors) {
        // Error catch - If just one thing is missing (or zero), Product cannot be made...
        if(noSheet == 0 || noHardware == 0 || noSensor == 0) {
            return 0;
        }
        
        Door memory door = Door(1, 100);
        numOfDoors = materials["stainlessSheet"];
        productStruct.Name = "Doors";
        productList.push(productStruct);
        
        return numOfDoors;

    }
    
    function controllers() public returns(uint numOfControllers) {
        // Error catch - If just one thing is missing (or zero), Product cannot be made...
        if(noWire == 0 || noPlastic == 0) {
            return 0;
        }
        
        Controller memory controller = Controller(10, 15);
        numOfControllers = materials["wire"];
        productStruct.Name = "Controllers";
        productList.push(productStruct);
        
        return numOfControllers;

    }
    
    function controlPanels() public returns(uint numOfControlPanels) {
        // Error catch - If just one thing is missing (or zero), Product cannot be made...
        if(noWire == 0 || noPlastic == 0 || noButton == 0 || noHardware == 0 || noLight == 0) {
            return 0;
        }
        
        ControlPanel memory controlPanel = ControlPanel(1, 100, 1, 4, 6);
        numOfControlPanels = materials["plastic"];
        productStruct.Name = "Controllers";
        productList.push(productStruct);
        
        return numOfControlPanels;

    }
    
    function callSigns() public returns(uint numOfCallSigns) {
        // Error catch - If just one thing is missing (or zero), Product cannot be made...
        if(noWire == 0 || noHardware == 0 || noLight == 0) {
            return 0;
        }
        
        CallSign memory callSign = CallSign(1, 100, 1);
        numOfCallSigns = materials["plastic"];
        productStruct.Name = "CallSigns";
        productList.push(productStruct);
        
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

    }
    
    function viewOrder() public view returns (ProductObj[] memory) {
        return productList;
    }
   
}