'use strict'

{CommandBase} = require './commandbase'

class CommandDrawRectangle extends CommandBase

  path: null
  gc: null

  constructor: (path, gc) ->
    @path = path

    if gc?
      @gc = gc

  execute: (target, gc) ->
    return @drawRectangle target, gc

  drawRectangle: (target, gc) ->
    [x0, y0, x1, y1] = @path
    [x, w] = if x0 < x1 then [x0, x1 - x0] else [x1, x0 - x1]
    [y, h] = if y0 < y1 then [y0, y1 - y0] else [y1, y0 - y1]

    @element = target.rect x, y, w, h
    @element.attr @gc || gc.state

    return @element

  moveRectangle: (path) ->
    [x0, y0, x1, y1] = path
    [x, w] = if x0 < x1 then [x0, x1 - x0] else [x1, x0 - x1]
    [y, h] = if y0 < y1 then [y0, y1 - y0] else [y1, y0 - y1]

    @element.node.attributes[0].value = x
    @element.node.attributes[1].value = y
    @element.node.attributes[2].value = w
    @element.node.attributes[3].value = h

    @path = path


exports.CommandDrawRectangle = CommandDrawRectangle
