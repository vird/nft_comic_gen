module.exports =
  state : 
    width : 720
    script_text : """
      "Первый день хакатона"
      
      PANEL
      Lucy happy SAYS "Пишите в треде, как прошла ночь"
      
      PANEL
      stephen SAYS TO SELF "Что-бы такого рассказать"
      
      PANEL
      ETH SAYS "даже не знаю чувак"
      TEZ sad SAYS "вообще как-то скучно ночь прошла"
      
      PANEL
      UNISWAP happy SAYS "У-и-и-и-и"
      narrator says "Еще 4M$ fee за день"
      
      PANEL
      ATOMEX SAYS "Я всю ночь работал"
      QUIPUSWAP SAYS "Я всю ночь готовился"
      DEXTER busted mouth SAYS "Я всю ночь отдыхал"
      
      PANEL
      SERUM
      OPENSEA SAYS "А кто мы вообще такие?"
      
      PANEL
      DYNAMOKYIV SAYS "Я вообще не знаю, что я здесь делаю"
      THANOS busted mouth SAYS "А я вообще устареть успел как логотип"
            
      """#"
    publish_in_progress : false
  
  mount : ()->
    ev.on "wallet_connect", @handler = ()=>@force_update()
  
  unmount : ()->
    ev.off "wallet_connect", @handler
  
  publish : ()->
    @set_state publish_in_progress : true
    await @_publish defer()
    @set_state publish_in_progress : false
  
  _publish : (on_end)->
    comic =
      width       : @state.width
      script_text : @state.script_text
    buf = comic_encode comic
    
    token_id_offset = storage.assets.metadata.next_token_id.toNumber()
    token_def = {
      from_ : token_id_offset
      to_   : token_id_offset+1
    }
    metadata = {
      token_id: token_id_offset,
      token_info : taquito.MichelsonMap.fromLiteral({
        "content" : uint8_array2hex buf
      })
    }
    owners = [wallet_address]
    
    await contract.methods.mint_tokens(
      token_def.from_, token_def.to_,
      metadata.token_id, metadata.token_info,
      # BUG
      `owners`).send().cb defer(err, op);       return on_end err if err
    await op.confirmation().cb      defer(err); return on_end err if err
    await contract_storage_refresh  defer(err); return on_end err if err
    
    on_end()
  
  render : ()->
    Page_wrap {
      com   : @
      title : "Editor"
    }
      div {
        style:
          color     : theme.GRAY_OPT
          fontSize  : 20
      }
        span "Для справки по движку "
        a {href:"http://www.kesiev.com/stripthis/stripthis/comic-studio.html"}, "http://www.kesiev.com/stripthis/stripthis/comic-studio.html"
      
      div {
        style :
          textAlign  : "left"
          lineHeight : "30px"
      }
        table
          tbody
            tr
              td {
                style:
                  verticalAlign : "top"
              }
                span "width "
                Number_input bind2 @, "width"
                div {
                  style:
                    border : "1px solid black"
                }
                  Extended_textarea bind2 @, "script_text"
                div {
                  style:
                    width : "100%"
                    paddingTop : 20
                }
                  comic =
                    width       : @state.width
                    script_text : @state.script_text
                  res = comic_encode comic
                  div {
                    style:
                      textAlign : "center"
                  }, "publish size : #{res.length}"
                  if !window.wallet
                    Button {
                      label   : "Connect wallet"
                      on_click: ()=>wallet_connect()
                      style:
                        display     : "block"
                        marginLeft  : "auto"
                        marginRight : "auto"
                    }
                  else
                    if @state.publish_in_progress
                      Spinner {}
                    else
                      Button {
                        label : "Publish as #{wallet_address}"
                        style:
                          display     : "block"
                          marginLeft  : "auto"
                          marginRight : "auto"
                        on_click : ()=>@publish()
                      }
              td {
                style:
                  verticalAlign : "top"
              }
                div {
                  style:
                    width : "100%"
                    paddingTop : 20
                }
                  div {
                    style:
                      width : @state.width
                      marginLeft : "auto"
                      marginRight: "auto"
                  }
                    Comic_render {
                      value : @state.script_text
                    }
