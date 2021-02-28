module.exports =
  render : ()->
    Page_wrap {
      com   : @
      title : "Afterparty todo list + links"
    }
      div {
        style :
          textAlign  : "left"
          paddingLeft: 100
          lineHeight : "30px"
      }
        tbody
          tr
            td {
              style :
                width : "50%"
                verticalAlign : "top"
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
            td {
              style :
                width : "50%"
                verticalAlign : "top"
            }
              section_offset = 20
              table
                tbody
                  tr
                    td "source"
                    td
                      a {href:"https://github.com/vird/nft_comic_gen"}, "https://github.com/vird/nft_comic_gen"
                  tr
                    td "потрогать"
                    td a {href:"https://vird.github.io/nft_comic_gen_web/"}, "https://vird.github.io/nft_comic_gen_web/"
              
              div {style:height:20}
              div
                div "Команда"
                div
                  span "Глушковский Сергей"
                div {style:paddingLeft:section_offset}
                  div
                    img {
                      src : "img/favicon_github.png"
                      style:
                        width : 16
                        height: 16
                        position: "relative"
                        top : 2
                    }
                    span " "
                    a {href:"https://github.com/vird"}, "github.com/vird"
                  div
                    img {
                      src : "img/favicon_facebook.png"
                      style:
                        width : 16
                        height: 16
                        position: "relative"
                        top : 2
                    }
                    span " "
                    a {href:"https://facebook.com/virdvird"}, "facebook.com/virdvird"
                  
