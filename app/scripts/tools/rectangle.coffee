'use strict'

{ToolBase} = require './toolbase'
# {CommandDrawPath} = require '../commands/drawpath'
{CommandDrawRectangle} = require '../commands/drawrectangle'

class ToolRectangle extends ToolBase

  State:
    RELEASE: 0
    PRESS: 1

  state: null

  point: null

  command: null
  element: null

  constructor: (target, core) ->
    super target, core

    @state = @State.RELEASE

  onMouseDown: (event) ->
    event.preventDefault()

    @point = @getPoint event

    # @command = new CommandDrawRectangle @point
    # @element = @core.addCommand @command

    @state = @State.PRESS

  onMouseMove: (event) ->
    return unless @state is @State.PRESS

    event.preventDefault()

    # point = @getPoint event
    #
    # @command.addPath @point.concat point
    #
    # @point = point

  onMouseUp: (event) ->
    event.preventDefault()

    point = @getPoint event
    @command = new CommandDrawRectangle @point.concat point
    @element = @core.addCommand @command

    @state = @State.RELEASE

  onMouseLeave: (event) ->
    @onMouseMove event

    @state = @State.RELEASE


exports.ToolRectangle = ToolRectangle
