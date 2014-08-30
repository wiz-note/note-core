'use strict';
# lib = require './components/components'

polymer = Polymer 'note-core',

  s: null

  strokeWidth: 2
  strokeColor: '#000000'
  fillColor: '#ffffff'

  ready: ->
    @s = new Snap @.$.canvas

    @drawLine 10, 20, 100, 200

  drawLine: (x0, y0, x1, y1) ->
    line = @s.line x0, y0, x1, y1
    line.attr
      stroke: @strokeColor
      strokeWidth: @strokeWidth

return polymer;
