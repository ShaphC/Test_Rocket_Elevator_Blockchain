const SolutionManufacturing = artifacts.require("SolutionManufacturing");

contract("SolutionManufacturing", (material) => {
   let solutionManufacturing;

   before(async () => {
      solutionManufacturing = await SolutionManufacturing.deployed();
   });

   
   
})