var ConvertLib = artifacts.require("./ConvertLib.sol");
var MetaCoin = artifacts.require("./MetaCoin.sol");
var Contract1 = artifacts.require("./Contract1.sol");
var Contract2 = artifacts.require("./Contract2.sol");

module.exports = function(deployer) {
  deployer.deploy(Contract1);
  deployer.link(Contract1, Contract2);
  deployer.deploy(Contract2, {gas: 4500000});
  // Contract1.deployed().then(function(instance) {
  //   Contract1 = instance;
  //   deployer.deploy(Contract2, Contract1);});

  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, MetaCoin);
  deployer.deploy(MetaCoin);
};
