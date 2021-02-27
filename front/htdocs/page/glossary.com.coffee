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
      }, """
        NFT
        Движок для комиксов
        Редактор
        ...
        ???
        !!!
        PROFIT
        """
