'use strict'

{ToolPick}        = require './pick'
{ToolFreehand}    = require './freehand'
{ToolRectangle}   = require './rectangle'
{ToolPenColor}    = require './pencolor'
{ToolPenWidth}    = require './penwidth'
{ToolUndo}        = require './undo'
{ToolRedo}        = require './redo'
{ToolClear}       = require './clear'

class ToolFactory

  TOOL_CLASSES:
    'pick': ToolPick
    'freehand': ToolFreehand
    'rectangle': ToolRectangle
    'pencolor': ToolPenColor
    'penwidth': ToolPenWidth
    'undo': ToolUndo
    'redo': ToolRedo
    'clear': ToolClear

  tools: null
  currentTool: null

  constructor: (core, target, gc) ->
    @tools = {}
    for tool of @TOOL_CLASSES
      @tools[tool] = new @TOOL_CLASSES[tool] target.node, core, gc

  bind: (element) ->
    element.addEventListener 'click', =>
      @activate event.target.id

  activate: (id) ->
    tool = @tools[id]

    return unless tool?
    return if @currentTool is tool

    oldTool = @currentTool

    @currentTool = tool
    isActivated = @currentTool.activate()
    if isActivated
      oldTool?.deactivate()


exports.ToolFactory = ToolFactory
