// inspired by https://github.com/tqtezos/minter/blob/master/contracts/test/nft-contracts.test.ts
const nft = artifacts.require("nft");
const { MichelsonMap } = require("@taquito/michelson-encoder");
const { InMemorySigner } = require("@taquito/signer");
const { alice, bob } = require("../scripts/sandbox/accounts");

async function setUser(user) {
  tezos.setProvider({
    signer: await InMemorySigner.fromSecretKey(user.sk),
    config: {
      confirmationPollingTimeoutSecond: 10000,
    },
  });
}

contract('nft', () => {
  let nftInstance;
  let storage;
  let inspector;
  
  before(async() => {
    nftInstance = await nft.deployed();
    storage = await nftInstance.storage();
    // console.log("storage", storage);
  });
  
  let token_id_offset = 0;
  async function mint_tokens_test(user) {
    await setUser(user);
    const beforeBalance = await tezos.tz.getBalance(user.pkh);
    const token_def = {
      from_ : token_id_offset,
      to_ : token_id_offset+1
    };
    const buf = Buffer.alloc(10*1024);
    const metadata = {
      token_id: token_id_offset,
      token_info : MichelsonMap.fromLiteral({
        "content" : buf.toString("hex")
      })
    };
    const owners = [user.pkh];
    
    // serialize на грани фантастики
    const op = await nftInstance.mint_tokens(
      token_def.from_, token_def.to_,
      metadata.token_id, metadata.token_info,
      owners
    );
    const afterBalance = await tezos.tz.getBalance(user.pkh);
    console.log("spent", (beforeBalance - afterBalance) / 1e6);
    storage = await nftInstance.storage();
    // console.log("storage.assets.metadata", storage.assets.metadata);
    
    token_id_offset++;
  }
  
  it("mint_tokens alice", async() => {
    await mint_tokens_test(alice);
  });
  
  it("mint_tokens bob", async() => {
    await mint_tokens_test(bob);
  });
  
});
