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
      stainlessSheetMaterial = numOfElevators * 2;
      steelCableMaterial = (numOfFloors * numOfElevators);
      hardwareMaterial = (numOfBatteries * 30) + (numOfColumns * 300) + (numOfElevators * 100) + (numOfFloors * 10);
      bumperMaterial = numOfColumns * 18;
      hardwareMaterial = (numOfBatteries * 30) + (numOfColumns * 300) + (numOfElevators * 100) + (numOfFloors * 10);
      bumperMaterial = numOfColumns * 18;
      interiorLightMaterial = numOfElevators * 2;
      displayLightMaterial = numOfElevators + numOfFloors;
   }


    // Function for checking if enough material is available to create needed shafts, columns, batteries, etc.
    // Running IF ELSE Boolean statements if there is enough material to produce assembled components

   function neededMaterial(int256 doorMaterial, int256 controllerMaterial, int256 panelMaterial, int256 callSignMaterial) public {
      
   }

   // Creating the Doors, Controllers, Control Panel, and Call Sign
   

   
   
   // Maybe a function for viewing this information on the frontend?

   // function getMaterial() public view returns () {
   //    return something;
   // }

}
