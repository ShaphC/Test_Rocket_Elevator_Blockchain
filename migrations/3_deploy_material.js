<<<<<<< HEAD:migrations/3_deploy_material.js
const Material = artifacts.require("MaterialProvider");
=======
var Material = artifacts.require("MaterialProvider");
>>>>>>> main:migrations/2_deploy_material.js

module.exports = function(deployer) {
  deployer.deploy(Material);
};
