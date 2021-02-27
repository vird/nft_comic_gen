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
        table {
          style:
            width : "100%"
        }
          tbody
            tr
              td {
                style :
                  width : "50%"
                  verticalAlign : "top"
              }
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
              td {
                style :
                  width : "50%"
                  verticalAlign : "top"
                  paddingLeft   : 50
              }
                section_offset = 20
                div "История"
                div {style:paddingLeft:section_offset}
                  div "2014 Первая идея"
                  div "2016 Первая реализация"
                
                div "Почему работает"
                div {style:paddingLeft:section_offset}
                  div "В ЮАР 10 разных языков"
                  div "Малограммотное население"
                
                div "Для DeFi. \"Просто объясните по-нормальному как работает ваш проект и мы вложим деньги\""
                div {style:paddingLeft:section_offset}
                  div "Хотя бы как у finematics"
        