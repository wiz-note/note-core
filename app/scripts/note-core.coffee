'use strict'

{GraphicsContext} = require './graphicscontext'
{CommandDrawLine} = require './command/drawline'
{CommandDrawPath} = require './command/drawpath'

polymer = Polymer 'note-core',

  s: null
  gc: null

  ready: ->
    @s = new Snap @.$.canvas
    @gc = new GraphicsContext()

    drawLine = new CommandDrawLine @s, @gc
    drawLine.execute 10, 20, 100, 200

    drawPath = new CommandDrawPath @s, @gc
    drawPath.execute [10, 20, 100, 100, 200, 500]


return polymer;
