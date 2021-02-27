module.exports =
  render : ()->
    Page_wrap {
      com   : @
      title : "ЮАР"
    }
      div {
        style :
          textAlign  : "left"
          paddingLeft: 100
          lineHeight : "30px"
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
        