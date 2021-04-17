const Quality = artifacts.require("QualityControl");

module.exports = function(deployer) {
  deployer.deploy(Quality);
};