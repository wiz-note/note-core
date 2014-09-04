'use strict'

{GraphicsContext} = require './graphicscontext'

{CommandStack}    = require './commands/commandstack'

{ToolFreehand}    = require './tools/freehand'
{ToolRectangle}    = require './tools/rectangle'
{ToolUndo}    = require './tools/undo'

polymer = Polymer 'note-core',

  TOOL_CLASSES:
    'freehand': ToolFreehand
    'rectangle': ToolRectangle
    'undo': ToolUndo

  tools: null
  currentTool: null

  s: null
  gc: null

  stack: null

  elements: null

  ready: ->
    @s = new Snap @.$.canvas
    @gc = new GraphicsContext()

    @stack = new CommandStack()

    @elements = []

    @tools = {}
    for tool of @TOOL_CLASSES
      @tools[tool] = new @TOOL_CLASSES[tool] @s.node, this

    @.$.tool_buttons.addEventListener 'click', @onToolButtonClick.bind(@)

    @activateTool 'freehand'

  onToolButtonClick: (event) ->
    @activateTool event.target.id

  activateTool: (id) ->
    if @tools[id]?
      oldTool = @currentTool

      @currentTool = @tools[id]
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


return polymer;
