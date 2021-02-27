module.exports =
  render : ()->
    Page_wrap {
      com   : @
      title : "whitepaper madness"
    }
      div {
        style :
          textAlign  : "left"
          paddingLeft: 100
          lineHeight : "30px"
      }
        section_offset = 20
        div "Работаем как DreamTeam"
        div {style:paddingLeft:section_offset}
          div "Сначала собираем ICO"
          div "Потом уже ищем техдира и начинаем делать реализацию"
        div "like/dislike пока нет, но можно выставить токены на продажу как в ICO"
        div "challenge'ы хакатона. \"Не з’їм, так понадкусую\""
      