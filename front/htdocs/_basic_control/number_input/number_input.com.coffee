module.exports =  
  text : ""
  mount : ()->
    @set_text @props
    @force_update()
    return
  
  render : ()->
    # WARNING эта хуйня не понимает нормально точку
    input {
      id          : @props.id
      class       : @props.class
      style       : @props.style
      disabled    : @props.disabled
      
      type        : "number"
      value       : @text
      on_change   : @on_change
      placeholder : @props.placeholder
      pattern     : "-?[0-9]*([\.,][0-9]*)?"
      # pattern     : "^[-0-9\.,]*$"
      step        : @props.step
      onKeyPress: (event)=>
        if event.nativeEvent.which == 13 # ENTER
          @props.on_enter?()
        return
      
      onFocus     : ()=>@props.on_focus?()
      onBlur      : ()=>@props.on_blur?()
      on_hover    : ()=>@props.on_hover?()
      on_mouse_out: ()=>@props.on_mouse_out?()
    }
  
  props_change : (props)->
    return if props.value == @props.value
    return if props.value == parseFloat @text
    @set_text props
    
  set_text : (props)->
    if props.value?
      if isNaN props.value
        @text = ""
        return
      @text = props.value.toString()
    return
  
  on_change : (event)->
    value = event.target.value
    @text = value
    @force_update()
    num_value = parseFloat value
    if @props.can_empty and value == ""
      @props.on_change(num_value)
      return
    
    return if isNaN num_value
    @props.on_change?(num_value)
    return
