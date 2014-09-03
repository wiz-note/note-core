'use strict'

class CommandStack

  commands: null

  constructor: ->
    @commands = []

  add: (target, state, command) ->
    @commands.push command

    element = command.execute target, state

    return element

  remove: (command) ->
    command.undo()


exports.CommandStack = CommandStack
