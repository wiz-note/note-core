'use strict'

{ToolFreehand}    = require './freehand'
{ToolRectangle}   = require './rectangle'
{ToolPenColor}    = require './pencolor'
{ToolPenWidth}    = require './penwidth'
{ToolUndo}        = require './undo'
{ToolRedo}        = require './redo'
{ToolClear}       = require './clear'

class ToolFactory

  TOOL_CLASSES:
    'freehand': ToolFreehand
    'rectangle': ToolRectangle
    'pencolor': ToolPenColor
    'penwidth': ToolPenWidth
    'undo': ToolUndo
    'redo': ToolRedo
    'clear': ToolClear

  tools: null

  constructor: (core, target, gc)->
    @tools = {}
    for tool of @TOOL_CLASSES
      @tools[tool] = new @TOOL_CLASSES[tool] target.node, core, gc

  get: (id) ->
    return @tools[id]


exports.ToolFactory = ToolFactory
