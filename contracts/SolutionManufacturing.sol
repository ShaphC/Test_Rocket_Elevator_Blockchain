pragma solidity >=0.4.22 <0.9.0;

contract SolutionManufacturing {
   int256 public aluminumMaterial;
   int256 public stainlessSheetMaterial;
   int256 public steelCableMaterial;
   int256 public hardwareMaterial;
   int256 public bumperMaterial;
   int256 public interiorLightMaterial;
   int256 public displayLightMaterial;

   constructor() public {
      aluminumMaterial = 0;
      stainlessSheetMaterial = 0;
      steelCableMaterial = 0;
      hardwareMaterial = 0;
      bumperMaterial = 0;
      interiorLightMaterial = 0;
      displayLightMaterial = 0;
   }

      // For 1 Battery, 2 Columns, 4 Elevators per Column, and 5 floors

   function assignMaterial(
      int256 numOfBatteries,
      int256 numOfColumns,
      int256 numOfElevators,
      int256 numOfFloors
   ) public {

      // Simple logic to calculate how much material will be had according to the inputted Batteries, Columns, Elevators and Floors
      
      aluminumMaterial = (numOfElevators * numOfFloors) / numOfColumns;
      stainlessSheetMaterial = numOfElevators * 2;1
      steelCableMaterial = (numOfFloors * numOfElevators);
      hardwareMaterial = (numOfBatteries * 30) + (numOfColumns * 300) + (numOfElevators * 100) + (numOfFloors * 10);
      bumperMaterial = numOfColumns * 18;
      hardwareMaterial = (numOfBatteries * 30) + (numOfColumns * 300) + (numOfElevators * 100) + (numOfFloors * 10);
      bumperMaterial = numOfColumns * 18;
      interiorLightMaterial = numOfElevators * 2;
      displayLightMaterial = numOfElevators + numOfFloors;
   }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    // Function for checking if enough material is available to create needed shafts, columns, batteries, etc.
    // Running IF ELSE Boolean statements if there is enough material to produce assembled components

   // function neededMaterial(int256 doorMaterial, int256 controllerMaterial, int256 panelMaterial, int256 callSignMaterial) public {
      
   // }

   // Creating the Doors, Controllers, Control Panel, and Call Sign

   mapping (string => uint256) public materials;

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

   function doors() public returns(uint numOfDoors) {
      
      if(materials["stainlessSheetMaterial"] >= 1 && materials["hardwareMaterial"] >= 100 && materials["sensorMaterial"] >= 1) {
         Door memory door = Door(1, 100, 1);
         numOfDoors = door.stainlessSheetMaterial;
         return numOfDoors;

      }
   }
   function controllers() public returns(uint numOfControllers) {

      if(materials["wireMaterial"] >= 15 && materials["plasticMaterial"] >= 10 && materials["harnessMaterial"] >= 1) {
         Controller memory controller = Controller(15, 10, 1);
         numOfControllers = controller.wireMaterial;
         return numOfControllers;

      }
   }
   function controllPanels() public returns(uint numOfControlPanels) {

      if(materials["stainlessSheetMaterial"] >= 1 && materials["hardwareMaterial"] >= 100 && materials["sensorMaterial"] >= 1) {
         ControlPanel memory controlPanel = ControlPanel(1, 100, 1, 4, 6);
         numOfControlPanels = controlPanel.wireMaterial;
         return numOfControlPanels;

      }
   }
   function callSigns() public returns(uint numOfCallSigns) {

      if(materials["stainlessSheetMaterial"] >= 1 && materials["hardwareMaterial"] >= 100 && materials["sensorMaterial"] >= 1) {
         CallSign memory callSign = CallSigns(1, 100, 1);
         numOfCallSigns) { = materials["stainlessSheetMaterial"] /= callSign.stainlessSheetMaterial;
         return numOfCallSigns) {;

      }
   }
   
   // Maybe a function for viewing this information on the frontend?

   // function getMaterial() public view returns () {
   //    return something;
   // }

}
