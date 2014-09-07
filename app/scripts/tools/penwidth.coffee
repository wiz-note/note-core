'use strict'

{ToolBase} = require './toolbase'

class ToolPenWidth extends ToolBase

  WIDTH_LIST: [1, 2, 4, 8]
  DEFAULT_WIDTH: 2

  gc: null

  constructor: (target, core, gc) ->
    @gc = gc

    dropdown = core.$.penwidth
    for width in @WIDTH_LIST
      option = document.createElement 'option'
      option.innerText = width
      if width is @DEFAULT_WIDTH
        option.selected = true
      dropdown.appendChild option

    dropdown.addEventListener 'change', (event) =>
      width = event.target.value
      @gc.state.strokeWidth = width

  activate: ->
    return false


exports.ToolPenWidth = ToolPenWidth
