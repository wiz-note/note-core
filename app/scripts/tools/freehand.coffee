'use strict'

{ToolBase} = require './toolbase'

class ToolFreehand extends ToolBase

  onMouseDown: (event) ->
    [x, y] = @getPoint event
    console.log x, y

  onMouseMove: (event) ->

  onMouseUp: (event) ->

exports.ToolFreehand = ToolFreehand
