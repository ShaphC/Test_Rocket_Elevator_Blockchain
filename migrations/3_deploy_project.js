const Project = artifacts.require("ProjectOffice");

module.exports = function(deployer) {
  deployer.deploy(Project);
};
