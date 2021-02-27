module.exports =
  mount : ()->
    route_list = [
      ""
      "2"
      "3"
      # "connect"
      "explorer"
      "editor"
      "use_case"
      "south_africa"
      "south_africa_2"
      "extra_use_case"
      "todo"
      "links"
      "wtf"
      "wtf2"
    ]
    window.route2com_hash =
      ""              : {com:"Page_intro",          title:"Привет"}
      "2"             : {com:"Page_glossary",       title:"Что в проекте"}
      "3"             : {com:"Page_nft",            title:"NFT"}
      # "connect"       : {com:"Page_connect",        title:"Connect"}
      "explorer"      : {com:"Page_explorer",       title:"Explorer"}
      "editor"        : {com:"Page_editor",         title:"Editor"}
      "use_case"      : {com:"Page_use_case",       title:"Use case"}
      "south_africa"  : {com:"Page_south_africa",   title:"ЮАР"}
      "south_africa_2": {com:"Page_south_africa_2", title:"ЮАР wtf"}
      "extra_use_case": {com:"Page_extra_use_case", title:"Extra use case"}
      "todo"          : {com:"Page_todo",           title:"TODO"}
      "links"         : {com:"Page_links",          title:"Links"}
      "wtf"           : {com:"Page_wtf",            title:"wtf"}
      "wtf2"          : {com:"Page_wtf2",           title:"wtf2"}
    
    window.map_hash = {}
    for route in route_list # proper order
      v = route2com_hash[route]
      window.map_hash[v.com] = v.title
    
    document.onkeydown = (e)=>
      if e.altKey
        switch e.keyCode
          when Keymap.LEFT
            e.preventDefault()
            idx = route_list.idx @path
            if (route = route_list[idx-1])?
              route_go route
            
          when Keymap.RIGHT
            e.preventDefault()
            idx = route_list.idx @path
            if (route = route_list[idx+1])?
              route_go route
          
      return
  
  render : ()->
    Router_multi {
      render : (hash)=>
        @path = path = hash[""]?.path or ""
        if com = window.route2com_hash[path]
          window[com.com] {}
        else
          div "404"
    }
