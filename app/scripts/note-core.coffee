'use strict'

{GraphicsContext} = require './graphicscontext'
{CommandStack}    = require './command/commandstack'
{CommandDrawLine} = require './command/drawline'
{CommandDrawPath} = require './command/drawpath'

polymer = Polymer 'note-core',

  s: null
  gc: null

  stack: null

  elements: null

  ready: ->
    @s = new Snap @.$.canvas
    @gc = new GraphicsContext()

    @stack = new CommandStack()

    @elements = []

    @test()

  addCommand: (command) ->
    element = @stack.add @s, @gc, command
    @elements.push element

  test: ->
    command = new CommandDrawLine 10, 20, 100, 200
    @addCommand command

    command = new CommandDrawPath [10, 20, 100, 100, 200, 500]
    @addCommand command


return polymer;
