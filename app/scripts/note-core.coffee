'use strict'

{CommandDrawLine} = require './command/drawline'
{CommandDrawPath} = require './command/drawpath'

polymer = Polymer 'note-core',

  s: null

  strokeWidth: 2
  strokeColor: '#000000'
  fillColor: '#ffffff'

  pathNode: null
  prevPoint: null

  ready: ->
    @s = new Snap @.$.canvas

    drawLine = new CommandDrawLine @s
    drawLine.execute 10, 20, 100, 200

    drawPath = new CommandDrawPath @s
    drawPath.execute [10, 20, 100, 100, 200, 500]


return polymer;
