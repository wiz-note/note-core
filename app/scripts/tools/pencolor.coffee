'use strict'

{ToolBase} = require './toolbase'

class ToolPenColor extends ToolBase

  COLOR_LIST: [
    'black',
    'blue',
    'green',
    'yellow',
    'orange',
    'red'
  ]
  DEFAULT_COLOR: 'black'

  focusable: false

  gc: null

  constructor: (target, core, gc) ->
    @gc = gc

    dropdown = core.$.pencolor
    for color in @COLOR_LIST
      option = document.createElement 'option'
      option.innerText = color
      option.style.backgroundColor = '#ff0000'
      if color is @DEFAULT_COLOR
        option.selected = true
      dropdown.appendChild option

    dropdown.addEventListener 'change', (event) =>
      color = event.target.value
      @gc.state.stroke = color


exports.ToolPenColor = ToolPenColor
