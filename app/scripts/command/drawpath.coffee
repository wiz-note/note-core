'use strict'

{CommandBase} = require './commandbase'

class CommandDrawPath extends CommandBase

  strokeWidth: 2
  strokeColor: '#000000'
  fillColor: '#ffffff'

  pathNode: null
  prevPoint: null

  constructor: (target) ->
    super target

  execute: (path) ->
    @drawPath path

  drawPath: (path, state) ->
    return unless path.length >= 2

    [x, y] = path.splice 0, 2

    element = @target.path "M#{x},#{y}"
    element.attr
      stroke: state?.strokeColor || @strokeColor
      strokeWidth: state?.strokeWidth || @strokeWidth
      strokeLinecap: 'round'
      strokeLinejoin: 'round'
      fill: 'none'

    @pathNode = element.node

    if path.length >= 2
      @prevPoint = [x, y]
      @addPath path

  addPath: (path) ->
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
