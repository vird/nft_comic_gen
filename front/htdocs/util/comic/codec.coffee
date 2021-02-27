window.hex2uint8_array = (hex) ->
  list = hex.match(/.{1,2}/g).map((byte)-> parseInt(byte, 16))
  new Uint8Array list

window.uint8_array2hex = (buffer)->
  Array.prototype.map.call(buffer, (x) -> ("00" + x.toString(16)).slice(-2)).join("")

window.comic_encode = (json)->
  str = JSON.stringify json
  pako.gzip str

window.comic_decode = (gzip_uint_array)->
  uint_array = pako.ungzip gzip_uint_array
  json = new TextDecoder().decode uint_array
  JSON.parse json
