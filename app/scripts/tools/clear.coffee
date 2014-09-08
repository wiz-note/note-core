'use strict'

{ToolBase} = require './toolbase'

class ToolClear extends ToolBase

  focusable: false

  activate: ->
    @core.clear()


exports.ToolClear = ToolClear
