module.exports =
  render : ()->
    Page_wrap {
      com   : @
      title : "Use case"
    }
      div {
        style :
          textAlign  : "left"
          paddingLeft: 100
          lineHeight : "30px"
      }
        section_offset = 20
        div "Хранилище комиксов + App для декодирования и просмотра"
        div {style:paddingLeft:section_offset}
          div "Почти как любой другой сайт с комиксами, только децентрализованный"
        div "Коллекционные карточки-комиксы для Динамо-Киев"
        div {style:paddingLeft:section_offset}
          div "Почти так же тупо как криптокотики (потому может работать)"
        
        div "И еще один интересный вариант"
        