# name glossary
module.exports =
  render : ()->
    Page_wrap {
      com   : @
      title : "Что в проекте?"
    }
      div {
        style :
          whiteSpace : "pre-wrap"
          textAlign  : "left"
          paddingLeft: 100
          lineHeight : "30px"
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
              }, """
                NFT
                Движок для комиксов
                Редактор
                ...
                ???
                !!!
                PROFIT
                """
              td {
                style :
                  width : "50%"
                  verticalAlign : "top"
              }
                section_offset = 20
                div "Что храним"
                div {style:paddingLeft:section_offset}
                  div "gzip(text)"
                
                div {style:height:20}
                div "Отличия"
                div {style:paddingLeft:section_offset}
                  div "mint может делать не только admin"
                  div "пофикшена уязвимость maxrange soft lock"
                
                div {style:height:20}
                div "Источники вдохновения"
                div {style:paddingLeft:section_offset}
                  div "База"
                  div
                    a {href :"https://github.com/tqtezos/smart-contracts"}, "tqtezos/smart-contracts"
                  div
                    a {href :"https://github.com/truffle-box/tezos-example-box"}, "truffle-box/tezos-example-box"
                
                  div {style:height:20}
                  div "Отдельные рецепты для реализации"
                  div
                    a {href :"https://github.com/madfish-solutions/quipuswap-core"}, "madfish-solutions/quipuswap-core"

