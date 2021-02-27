module.exports =
  render : ()->
    div {
      style:
        height      : "100%"
        width       : "100%"
    }
      div {
        style:
          marginBottom : -50
      }
        Page_nav {com : @props.com}
      div {
        style:
          display     : "table"
          height      : "100%"
          width       : "100%"
      }
        div {
          style:
            paddingTop    : 100
            display       : "table-cell"
            # verticalAlign : "middle"
            textAlign     : "center"
        }
          div {
            style:
              fontSize  : 50
          }, @props.title
          @props.children