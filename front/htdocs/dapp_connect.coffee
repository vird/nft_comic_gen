# node_url = "https://api.tez.ie/rpc/mainnet"
if localStorage.use_prod or /github\.io/.test location.hostname
  node_url = "https://api.tez.ie/rpc/delphinet"
  network =  beacon.NetworkType.DELPHINET
  window.contract_address = "KT1Jj8pCZ6YWCG14EoAUVTVCuDH2R3smKt1X"
else
  node_url = "http://#{location.hostname}:8732"
  network =  beacon.NetworkType.DELPHINET
  window.contract_address = "KT1LpYunv2yDapf1yYMPKGm3o3NNp6KMdyiK" # TODO autoreplace with new iteration

window.Tezos = new taquito.TezosToolkit node_url

window.ev = new Event_mixin

window.contract_refresh = (on_end)->
  await Tezos.wallet.at(contract_address).cb defer(err, contract); return on_end err if err
  window.contract = contract
  ev.dispatch "contract_load"
  
  await contract_storage_refresh defer(err); return on_end err if err
  on_end()

window.contract_storage_refresh = (on_end)->
  await contract.storage().cb defer(err, storage); return on_end err if err
  window.storage = storage
  ev.dispatch "storage_load"
  
  on_end()

await contract_refresh defer(err); throw err if err

window.wallet = null
window.wallet_address = null

window.wallet_connect = ()->
  opt = 
    name: "NFT + комиксы"
    preferredNetwork: network
    disableDefaultEvents: true
    eventHandlers: {}
  
  opt.eventHandlers[beacon.BeaconEvent.PAIR_INIT] = {
    handler: beacon.defaultEventCallbacks.PAIR_INIT
  }
  opt.eventHandlers[beacon.BeaconEvent.PAIR_SUCCESS] = {
    handler: (data)=>
      # TODO later/never
      ev.dispatch "wallet_public_token"
      puts data.publicKey
  }
  wallet = new BeaconWallet opt
  Tezos.setWalletProvider wallet
  
  opt = {
    network: {
      type: network
      rpcUrl: node_url
    }
  }
  await wallet.requestPermissions(opt).cb defer(err); throw err if err
  await wallet.getPKH().cb defer(err, user_address); throw err if err
  
  window.wallet = wallet
  window.wallet_address = user_address
    
  ev.dispatch "wallet_connect"
