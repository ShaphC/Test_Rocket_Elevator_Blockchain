var Material = artifacts.require("/contracts/Material-provider.sol");

module.exports = function(deployer) {
  deployer.deploy(Material);
};
