module.exports =
  render : ()->
    Page_wrap {
      com   : @
      title : "Afterparty todo list"
    }
      div {
        style :
          textAlign  : "left"
          paddingLeft: 100
          lineHeight : "30px"
      }
        section_offset = 20
        div "like/dislike"
        div "Удаление плагиата (уже есть, но можно лучше)"
        div "Средство от front-running'а"
        div {style:paddingLeft:section_offset}
          div "2-ступенчатая схема публикации"
          div "Сначала залог + hash"
          div "Потом контент и возвращается залог"
          div "Если не опубликовал - твой залог сгорает"
        
        div {style:height:20}
        div "Доп функциональность NFT"
        div {style:paddingLeft:section_offset}
          div "Донаты автору"
          div "Донаты правообладателю"
