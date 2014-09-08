'use strict'

{ToolBase} = require './toolbase'

class ToolUndo extends ToolBase

  focusable: false

  activate: ->
    @core.undo()


exports.ToolUndo = ToolUndo
