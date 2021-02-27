module.exports =
  render : ()->
    Page_wrap {
      com   : @
      title : "ЮАР"
    }
      div {
        style :
          textAlign   : "left"
          paddingLeft : 100
          paddingRight: 100
          lineHeight  : "30px"
      }
        div
          img {
            src: "/img/south_africa_comics.jpg"
            style:
              display : "block"
              width : "600"
              objectFit: "cover"
              marginLeft : "auto"
              marginRight: "auto"
          }
        div {
          style:
            textAlign : "center"
        }
          span "Подробнее "
          a {href:"https://adv-simfi.ru/dogovor-komiks.html"}, "https://adv-simfi.ru/dogovor-komiks.html"
        