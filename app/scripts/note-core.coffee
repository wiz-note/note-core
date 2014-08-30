'use strict';
# lib = require './components/components'

polymer = Polymer 'note-core',

  s: null

  strokeWidth: 2
  strokeColor: '#000000'
  fillColor: '#ffffff'

  pathNode: null
  prevPoint: null

  ready: ->
    @s = new Snap @.$.canvas

    # @drawLine 10, 20, 100, 200
    @drawPath [10, 20, 100, 100, 200, 500]

  drawLine: (x0, y0, x1, y1) ->
    line = @s.line x0, y0, x1, y1
    line.attr
      stroke: @strokeColor
      strokeWidth: @strokeWidth

  drawPath: (path, state) ->
    return unless path.length >= 2

    [x, y] = path.splice 0, 2

    element = @s.path "M#{x},#{y}"
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

return polymer;
