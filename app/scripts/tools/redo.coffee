'use strict'

{ToolBase} = require './toolbase'

class ToolRedo extends ToolBase

  activate: ->
    @core.redo()

    return false


exports.ToolRedo = ToolRedo
