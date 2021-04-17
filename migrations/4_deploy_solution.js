const Solution = artifacts.require("SolutionManufacturing");

module.exports = function(deployer) {
  deployer.deploy(Solution);
};