'use strict'

{CommandBase} = require './commandbase'

class CommandDrawLine extends CommandBase

  vector: null

  constructor: (x0, y0, x1, y1) ->
    @vector = [x0, y0, x1, y1]

  execute: (target, gc) ->
    return @drawLine target, gc

  drawLine: (target, gc) ->
    [x0, y0, x1, y1] = @vector

    @element = target.line x0, y0, x1, y1
    @element.attr gc.state

    return @element

exports.CommandDrawLine = CommandDrawLine
