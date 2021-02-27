module.exports =
  render : ()->
    Page_wrap {
      com   : @
      title : "Links"
    }
      div {
        style :
          textAlign  : "left"
          paddingLeft: 100
          lineHeight : "30px"
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
        