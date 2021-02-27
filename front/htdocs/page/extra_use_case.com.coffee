module.exports =
  render : ()->
    Page_wrap {
      com   : @
      title : "Extra use case"
    }
      div {
        style :
          textAlign  : "left"
          paddingLeft: 100
          lineHeight : "30px"
      }
        section_offset = 20
        div "Продвигать свой проект на платформе для комиксов"
        div "Выпускать whitepaper'ы в комиксах еще до того как есть реализация"
        div {style:paddingLeft:section_offset}
          div "Привет ICO"
        
        div "Написать комикс-инструкцию на существующий смарт-контракт и получать аффилиатные бонусы"
        div {style:paddingLeft:section_offset}
          div "Такого еще в экосистеме криптовалют, кажется, не было"
          div "Хотя если бы finematics за деньги делал обзоры..."
        
        div "Представьте что пользователи eth лезут в dapp на tezos чтобы узнать про то как работают новые проекты на eth"