'use strict'

class CommandBase

  element: null
  gc: null

  constructor: ->

  execute: (target, gc) ->

  undo: ->
    if @element?
      @element.remove()
      @element = null


exports.CommandBase = CommandBase
