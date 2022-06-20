var StandardToken = artifacts.require("./Standard_Token.sol");

module.exports = function(deployer) {
  deployer.deploy(StandardToken);
};
