module.exports =
  mount_done : ()->
    @render_comics()
    return
  
  props_change : (new_props)->
    if new_props.value != @props.value
      @render_comics new_props
    return
  
  render_comics : (props = @props)->
    comicgenerator.fromScriptToElement props.value, @refs.comics_container, donttranslate:true
    return
  
  render : ()->
    div {
      ref : "comics_container"
    }
