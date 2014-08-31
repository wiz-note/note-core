'use strict'

{CommandBase} = require './commandbase'

class CommandDrawLine extends CommandBase

  execute: (x0, y0, x1, y1) ->
    @drawLine x0, y0, x1, y1

  drawLine: (x0, y0, x1, y1) ->
    line = @target.line x0, y0, x1, y1
    line.attr @gc.state


exports.CommandDrawLine = CommandDrawLine
