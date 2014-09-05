'use strict'

{ToolBase} = require './toolbase'

class ToolClear extends ToolBase

  activate: ->
    @core.clear()

    return false


exports.ToolClear = ToolClear
