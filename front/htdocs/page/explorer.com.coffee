module.exports =
  state:
    selected_comic_idx: -1
    selected_comic    : null
    load_in_progress  : false
    id2title_hash     : {}
  
  mount : ()->
    ev.on "storage_load", @handler = ()=>
      @force_update()
      @title_refresh()
    @title_refresh()
    @comic_select 0
  
  unmount : ()->
    ev.off "storage_load", @handler
  
  title_refresh : ()->
    for def,k in window.storage?.assets.metadata.token_defs or []
      await window.storage.assets.metadata.metadata.get(def).cb defer(err, encoded);
      content     = encoded.token_info.get("content")
      content_arr = hex2uint8_array content
      try
        content_json = comic_decode content_arr
        @state.id2title_hash[k] = content_json.script_text.split("\n")[0]
        @force_update()
      catch err
        perr err
    
    return
  
  comic_select : (idx)->
    @set_state
      selected_comic_idx : idx
      load_in_progress : true
    
    def = window.storage.assets.metadata.token_defs[idx]
    await window.storage.assets.metadata.metadata.get(def).cb defer(err, encoded);
    if err
      perr err
    else
      content     = encoded.token_info.get("content")
      content_arr = hex2uint8_array content
      try
        content_json = comic_decode content_arr
        @set_state selected_comic : content_json
      catch err
        perr err
        @set_state selected_comic :
          width : 700
          script_text : """
            "Something wrong"
            
            PANEL with light openspace and office
            Lucy busted starving mouth SAYS TO SELF "..."
            
            """#"
    
    # comic_decode
    @set_state
      load_in_progress : false
    
  render : ()->
    Page_wrap {
      com   : @
      title : "Explorer"
    }
      comic_count = window.storage?.assets.metadata.token_defs.length or 0
      table {
        style:
          width : "100%"
      }
        tbody
          tr
            td {
              style:
                width : 300
                verticalAlign : "top"
            }
              span "Total comics deployed : #{comic_count}"
              table {
                class : "table"
                style :
                  width : "100%"
              }
                tbody
                  for v,k in window.storage?.assets.metadata.token_defs or []
                    is_selected = @state.selected_comic_idx == k
                    do (k,v)=>
                      tr {
                        style:
                          cursor: "pointer"
                        on_click : ()=>
                          @comic_select k
                      }
                        td {
                          style:
                            fontWeight : if is_selected then "bold" else null
                        }, @state.id2title_hash[k] or k
            td {
              style:
                verticalAlign : "top"
            }
              if @state.load_in_progress
                Spinner {}
              else if @state.selected_comic
                div {
                  style:
                    width : "100%"
                    paddingTop : 20
                }
                  div {
                    style:
                      width : @state.selected_comic.width
                      marginLeft : "auto"
                      marginRight: "auto"
                  }
                    Comic_render {
                      value : @state.selected_comic.script_text
                    }
