'use strict'

{CommandBase} = require './commandbase'

class CommandDrawPath extends CommandBase

  path: null

  pathNode: null
  prevPoint: null

  constructor: (path) ->
    @path = path

  execute: (target, gc) ->
    return @drawPath target, gc

  drawPath: (target, gc) ->
    if gc?
      @gc = {
        state: JSON.parse JSON.stringify gc.state
      }

    path = JSON.parse JSON.stringify @path

    return unless path.length >= 2

    [x, y] = path.splice 0, 2

    @element = target.path "M#{x},#{y}"
    @element.attr @gc.state

    @pathNode = @element.node

    @prevPoint = [x, y]
    if path.length >= 2
      @addPath path

    return @element

  addPath: (path, flag) ->
    if flag?
      @path = @path.concat path

    while path.length >= 2
      [x, y] = path.splice 0, 2

      if not px?
        [px, py] = @prevPoint

      svgPath = @pathNode.createSVGPathSegCurvetoQuadraticAbs (x + px) / 2, (y + py) / 2, px, py
      @pathNode.pathSegList.appendItem svgPath

      px = x;
      py = y;

    @prevPoint = [x, y]


exports.CommandDrawPath = CommandDrawPath
