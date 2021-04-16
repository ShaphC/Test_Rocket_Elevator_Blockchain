pragma solidity >=0.4.22 <0.9.0;

import "./MaterialProvider.sol";

contract SolutionManufacturing {
   
    mapping (string => uint256) public materials;

    struct Product {
        uint256 Name;
        uint256 Quantity;
    }

    struct Door {
        uint256 stainlessSheetMaterial;
        uint256 hardwareMaterial;
        uint256 sensorMaterial;
    }
    
    struct Controller {
        uint256 wireMaterial;
        uint256 plasticMaterial;
        uint256 harnessMaterial;
    }
    
    struct ControlPanel {
        uint256 wireMaterial;
        uint256 plasticMaterial;
        uint256 buttonsMaterial;
        uint256 hardwareMaterial;
        uint256 displayLightMaterial;
    }
    
    struct CallSign {
        uint256 wireMaterial;
        uint256 hardwareMaterial;
        uint256 displayLightMaterial;
    }
   
    ProductObj productStruct;
    ProductObj[] productList;

    constructor() public {
        materials["stainlessSheetMaterial"] = 0;
        materials["hardwareMaterial"] = 0;
        materials["sensorMaterial"] = 0;
        materials["wireMaterial"] = 0;
        materials["plasticMaterial"] = 0;
        materials["harnessMaterial"] = 0;
        materials["buttonsMaterial"] = 0;
        materials["displayLightMaterial"] = 0;
    
    }
    
    // Variables to clean things up
    uint noSheet = materials["stainlessSheetMaterial"];
    uint noHardware = materials["hardwareMaterial"];
    uint noSensor = materials["sensorMaterial"];
    uint noWire = materials["wireMaterial"];
    uint noPlastic = materials["plasticMaterial"];
    uint noHarness = materials["harnessMaterial"];
    uint noButton = materials["buttonsMaterial"];
    uint noLight = materials["displayLightMaterial"];

    function doors() public returns(uint numOfDoors) {
        // Error catch - If just one thing is missing (or zero), Product cannot be made...
        if(noSheet == 0 || noHardware == 0 || noSensor == 0) {
            return 0;
        }
        
        Door memory door = Door(1, 100, 1);
        numOfDoors = materials["stainlessSheetMaterial"];
        productStruct.Name = "Doors";
        productList.push(productStruct);
        
        return numOfDoors;

    }
    
    function controllers() public returns(uint numOfControllers) {
        // Error catch - If just one thing is missing (or zero), Product cannot be made...
        if(noWire == 0 || noPlastic == 0 ||) {
            return 0;
        }
        
        Controller memory controller = Controller(10, 15, 1);
        numOfControllers = materials["wireMaterial"];
        productStruct.Name = "Controllers";
        productList.push(productStruct);
        
        return numOfControllers;

    }
    
    function controllPanels() public returns(uint numOfControlPanels) {
        // Error catch - If just one thing is missing (or zero), Product cannot be made...
        if(noWire == 0 || noPlastic == 0 || noButton == 0 || noHardware == 0 || noLight == 0) {
            return 0;
        }
        
        ControlPanel memory controlPanel = ControlPanel(1, 100, 1, 4, 6);
        numOfControllers = materials["wireMaterial"];
        productStruct.Name = "Controllers";
        productList.push(productStruct);
        
        return numOfControllers;

    }
    
    function callSigns() public returns(uint numOfCallSigns) {
        // Error catch - If just one thing is missing (or zero), Product cannot be made...
        if(noWire == 0 || noHardware == 0 || noLight == 0) {
            return 0;
        }
        
        CallSign memory callSign = CallSign(1, 100, 1, 4, 6);
        numOfCallSigns = materials["wireMaterial"];
        productStruct.Name = "CallSigns";
        productList.push(productStruct);
        
        return numOfCallSigns;

    }

   
    function getOrder(address a) public {
        MaterialProvider.Material[] memory m = MaterialProvider(a).pushMaterials();
        
        for(index; index<m.length;index++){
            materials[m[index].material] = m[index].quantity;
        }
        doors();
        controllers();
        controlPanel();
        callSigns();

    }
    
    function viewOrder() public view returns (ProductObj[] memory) {
        return productList;
    }
   
}
