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
    if @index >= 0
      command = @commands[@index]
      command.undo()

      @index--

  redo: (target, state) ->
    if @index < @commands.length - 1
      @index++

      command = @commands[@index]
      command.execute target, state


exports.CommandStack = CommandStack
