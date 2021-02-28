# intro
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
        Page_nav {com : @}
        div {
          style:
            color     : theme.GRAY_OPT
            fontSize  : 20
        }, "для навигации используйте alt+стрелочки или панель вверху"
      div {
        style:
          display     : "table"
          height      : "100%"
          width       : "100%"
      }
        div {
          style:
            display       : "table-cell"
            verticalAlign : "middle"
            textAlign     : "center"
        }
          div {
            style:
              fontSize  : 100
          }, "Дичь"
          div {
            style:
              color     : theme.GRAY_OPT
              fontSize  : 20
          }, "Теперь с комиксами"
          div {
            style:
              paddingTop: 20
              fontSize  : 30
          }, "Изначальная идея: интерактивные комиксы с use case'ами для смарт контрактов"
