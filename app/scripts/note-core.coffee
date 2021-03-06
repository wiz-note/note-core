'use strict'

{GraphicsContext} = require './graphicscontext'

{CommandStack} = require './commands/commandstack'
{ToolFactory} = require './tools/toolfactory'

polymer = Polymer 'note-core',

  tools: null
  currentTool: null

  s: null
  gc: null

  stack: null
  factory: null

  elements: null

  ready: ->
    @s = new Snap @.$.canvas
    @gc = new GraphicsContext()

    @stack = new CommandStack()

    @elements = []

    @tools = new ToolFactory this, @s, @gc
    @tools.bind @.$.tool_buttons
    @tools.activate 'freehand'

  addCommand: (command, gc) ->
    element = @stack.add @s, gc || @gc, command
    @elements.push element

    return element

  removeCommand: (command) ->
    index = @elements.indexOf command.element
    if index >= 0
      @elements.splice index, 1

    @stack.remove command

  undo: ->
    @stack.undo()

  redo: ->
    element = @stack.redo @s
    if element
      @elements.push element

  clear: ->
    for element in @elements
      element.remove()
      element = null

    @stack.clear()


return polymer;
