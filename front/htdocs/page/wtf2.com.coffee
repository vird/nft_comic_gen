module.exports =
  state:
    selected_comic_idx: -1
    selected_comic    : null
  
  mount : ()->
    @comic_select 0
  
  comic_select : (idx)->
    @set_state
      selected_comic_idx: idx
      selected_comic    : wtf_list[idx]
    
  
  render : ()->
    Page_wrap {
      com   : @
      title : "whitepaper madness"
    }
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
              table {
                class : "table"
                style :
                  width : "100%"
              }
                tbody
                  for v,k in wtf_list
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
                        }, v.title
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
