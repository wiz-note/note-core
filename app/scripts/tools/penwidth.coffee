'use strict'

{ToolBase} = require './toolbase'

class ToolPenWidth extends ToolBase

  gc: null

  constructor: (target, core, gc) ->
    @gc = gc

  activate: ->
    @gc.state.strokeWidth = 4

    return false


exports.ToolPenWidth = ToolPenWidth
