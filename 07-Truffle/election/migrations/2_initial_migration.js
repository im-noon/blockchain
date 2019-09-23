const Election = artifacts.require("Election");

module.exports = function(deployer) {
  deployer.deploy(Election, "President Election 2020", "Oprah Winfrey", "Kanye West");
};
