# TODO move to comics_render.com.coffee
module.exports =
  state:
    width : 720
    script_text : """
      "Первый день хакатона"
      
      PANEL
      Lucy happy SAYS "Пишите в треде, как прошла ночь"
      
      PANEL
      stephen SAYS TO SELF "Что-бы такого рассказать"
      
      PANEL
      ETH SAYS "даже не знаю чувак"
      TEZ sad SAYS "вообще как-то скучно ночь прошла"
      
      PANEL
      UNISWAP happy SAYS "У-и-и-и-и"
      narrator says "Еще 4M$ fee за день"
      
      PANEL
      ATOMEX SAYS "Я всю ночь работал"
      QUIPUSWAP SAYS "Я всю ночь готовился"
      DEXTER busted mouth SAYS "Я всю ночь отдыхал"
      
      PANEL
      SERUM
      OPENSEA SAYS "А кто мы вообще такие?"
      
      PANEL
      DYNAMOKYIV SAYS "Я вообще не знаю, что я здесь делаю"
      THANOS busted mouth SAYS "А я вообще устареть успел как логотип"
      """#"
  
  render : ()->
    div
      span "width "
      Number_input bind2 @, "width"
      div {
      }
        Textarea bind2 @, "script_text", {
          style :
            width     : 900
            height    : 300
        }
      div {
        style :
          background  : "#f2f4f8"
          padding     : 20
      }
        div {
          style:
            width : @state.width
            marginLeft : "auto"
            marginRight: "auto"
        }
          Comic_render {
            value : @state.script_text
          }
      
