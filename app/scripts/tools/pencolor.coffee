'use strict'

{ToolBase} = require './toolbase'

class ToolPenColor extends ToolBase

  gc: null

  constructor: (target, core, gc) ->
    @gc = gc

  activate: ->
    @gc.state.stroke = '#ff0000'

    return false


exports.ToolPenColor = ToolPenColor
