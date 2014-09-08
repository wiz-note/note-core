'use strict'

class CommandBase

  element: null
  gc: null

  constructor: ->

  execute: (target, gc) ->
    if gc?
      @gc = {
        state: JSON.parse JSON.stringify gc.state
      }

  undo: ->
    if @element?
      @element.remove()
      @element = null


exports.CommandBase = CommandBase
