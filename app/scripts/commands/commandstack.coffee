'use strict'

class CommandStack

  commands: null
  index: null

  constructor: ->
    @clear()

  add: (target, state, command) ->
    if @index isnt @commands.length - 1
      @commands.splice @index + 1, @commands.length - @index - 1

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
    return false unless @index < @commands.length - 1

    @index++

    command = @commands[@index]
    element = command.execute target, state

    return element

  clear: ->
    @commands = []
    @index = -1


exports.CommandStack = CommandStack
