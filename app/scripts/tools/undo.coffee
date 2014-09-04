'use strict'

{ToolBase} = require './toolbase'

class ToolUndo extends ToolBase

  activate: ->
    @core.undo()

    return false

exports.ToolUndo = ToolUndo
