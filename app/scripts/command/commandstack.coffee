'use strict'

class CommandStack

  commands: null

  constructor: ->
    @commands = []

  add: (target, state, command) ->
    @commands.push command

    command.execute target, state

  remove: (command) ->


exports.CommandStack = CommandStack
