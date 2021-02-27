const nft = artifacts.require("nft");
// const nft = artifacts.require("nft2");
const { MichelsonMap } = require("@taquito/michelson-encoder");
const { alice } = require("../scripts/sandbox/accounts");

module.exports = async(deployer, _network, accounts)  => {
  deployer.deploy(nft, {
    admin : {
      admin : alice.pkh,
      pending_admin : null,
      paused : true
    },
    assets : {
      ledger : MichelsonMap.fromLiteral({}),
      operators : MichelsonMap.fromLiteral({}),
      metadata : {
        token_defs : [],
        next_token_id : 0,
        metadata : MichelsonMap.fromLiteral({})
      }
    },
    metadata : MichelsonMap.fromLiteral({
      "" : Buffer("tezos-storage:content", "ascii").toString("hex"),
      "content" : Buffer("\0", "ascii").toString("hex")
    })
  });
};
