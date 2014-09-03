'use strict'

{CommandBase} = require './commandbase'

class CommandDrawRectangle extends CommandBase

  path: null

  constructor: (path) ->
    @path = path

  execute: (target, gc) ->
    return @drawRectangle target, gc

  drawRectangle: (target, gc) ->
    [x0, y0, x1, y1] = @path
    [x, w] = if x0 < x1 then [x0, x1 - x0] else [x1, x0 - x1]
    [y, h] = if y0 < y1 then [y0, y1 - y0] else [y1, y0 - y1]

    @element = target.rect x, y, w, h
    @element.attr gc.state

    return @element


exports.CommandDrawRectangle = CommandDrawRectangle
