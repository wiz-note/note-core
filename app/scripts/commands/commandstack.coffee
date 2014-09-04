'use strict'

class CommandStack

  commands: null
  index: null

  constructor: ->
    @commands = []

  add: (target, state, command) ->
    @commands.push command
    @index = @commands.length - 1

    element = command.execute target, state

    return element

  remove: (command) ->
    command.undo()

  undo: ->
    @remove @commands[@index]
    if @index > 0
      @index--


exports.CommandStack = CommandStack
