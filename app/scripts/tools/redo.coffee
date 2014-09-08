'use strict'

{ToolBase} = require './toolbase'

class ToolRedo extends ToolBase

  focusable: false

  activate: ->
    @core.redo()


exports.ToolRedo = ToolRedo
