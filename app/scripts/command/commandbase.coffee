'use strict'

class CommandBase

  @target: null
  @gc: null

  constructor: (target, gc) ->
    @target = target
    @gc = gc

  execute: ->


exports.CommandBase = CommandBase
