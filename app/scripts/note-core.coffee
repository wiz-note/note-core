'use strict'

{GraphicsContext} = require './graphicscontext'
{CommandStack}    = require './command/commandstack'
{CommandDrawLine} = require './command/drawline'
{CommandDrawPath} = require './command/drawpath'

polymer = Polymer 'note-core',

  s: null
  gc: null

  stack: null

  ready: ->
    @s = new Snap @.$.canvas
    @gc = new GraphicsContext()

    @stack = new CommandStack()

    @test()

  test: ->
    # drawLine = new CommandDrawLine @s, @gc
    # drawLine.execute 10, 20, 100, 200

    command = new CommandDrawPath [10, 20, 100, 100, 200, 500]
    @stack.add @s, @gc, command


return polymer;
