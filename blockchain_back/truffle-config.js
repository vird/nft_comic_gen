const { alice } = require('./scripts/sandbox/accounts');

module.exports = {
  contracts_directory : "contracts/roots",
  // see <http://truffleframework.com/docs/advanced/configuration>
  // for more details on how to specify configuration options!
  networks: {
    development: {
      host: "http://localhost",
      port: 8732,
      network_id: "*",
      secretKey: alice.sk,
      type: "tezos"
    }
  }
};

var fs = require("fs");

if (fs.existsSync("faucet.json")) {
  const { mnemonic, secret, password, email } = require("./faucet.json");
  module.exports.networks.push({
    host: "https://delphinet.smartpy.io",
    port: 443,
    network_id: "*",
    secret,
    mnemonic,
    password,
    email,
    type: "tezos"
  });
}
