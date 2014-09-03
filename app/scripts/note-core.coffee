'use strict'

{GraphicsContext} = require './graphicscontext'

{CommandStack}    = require './commands/commandstack'
{CommandDrawLine} = require './commands/drawline'
{CommandDrawPath} = require './commands/drawpath'

{ToolFreehand}    = require './tools/freehand'
{ToolRectangle}    = require './tools/rectangle'

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

    return element

  removeCommand: (command) ->
    @stack.remove command

  test: ->
    target = @s.node
    # tool = new ToolFreehand target, this
    tool = new ToolRectangle target, this
    tool.activate()

    command = new CommandDrawLine 10, 20, 100, 200
    @addCommand command
    @removeCommand command

    command = new CommandDrawPath [10, 20, 100, 100, 200, 500]
    @addCommand command
    @removeCommand command


return polymer;
