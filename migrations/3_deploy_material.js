const Material = artifacts.require("MaterialProvider");

module.exports = function(deployer) {
  deployer.deploy(Material);
};
