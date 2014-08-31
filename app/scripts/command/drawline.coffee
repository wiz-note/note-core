'use strict'

{CommandBase} = require './commandbase'

class CommandDrawLine extends CommandBase

  strokeWidth: 2
  strokeColor: '#000000'
  fillColor: '#ffffff'

  execute: (x0, y0, x1, y1) ->
    @drawLine x0, y0, x1, y1

  drawLine: (x0, y0, x1, y1) ->
    line = @target.line x0, y0, x1, y1
    line.attr
      stroke: @strokeColor
      strokeWidth: @strokeWidth


exports.CommandDrawLine = CommandDrawLine
