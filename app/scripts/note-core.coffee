'use strict'

{GraphicsContext} = require './graphicscontext'

{CommandStack}    = require './commands/commandstack'
{ToolFactory}    = require './tools/toolfactory'

polymer = Polymer 'note-core',

  tools: null
  currentTool: null

  s: null
  gc: null

  factory: null
  stack: null

  elements: null

  ready: ->
    @s = new Snap @.$.canvas
    @gc = new GraphicsContext()

    @stack = new CommandStack()

    @elements = []

    @tools = new ToolFactory this, @s, @gc
    @.$.tool_buttons.addEventListener 'click', @onToolButtonClick.bind(@)

    @activateTool 'freehand'

  onToolButtonClick: (event) ->
    @activateTool event.target.id

  activateTool: (id) ->
    tool = @tools.get id
    if tool?
      oldTool = @currentTool

      @currentTool = tool
      isActivated = @currentTool.activate()
      if isActivated
        oldTool?.deactivate()

  addCommand: (command) ->
    element = @stack.add @s, @gc, command
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
    element = @stack.redo @s, @gc
    if element
      @elements.push element

  clear: ->
    for element in @elements
      element.remove()
      element = null

    @stack.clear()


return polymer;
