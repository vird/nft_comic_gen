#include "../src/fa2_nft_asset.mligo"

let main
    (param, s : nft_asset_param * nft_asset_storage)
  : (operation list) * nft_asset_storage =
    nft_asset_main(param, s)
