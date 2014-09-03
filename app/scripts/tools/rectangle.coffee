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
    @command = new CommandDrawRectangle @point.concat @point
    @element = @core.addCommand @command

    @state = @State.PRESS

  onMouseMove: (event) ->
    return unless @state is @State.PRESS

    event.preventDefault()

    point = @getPoint event
    @command.moveRectangle @point.concat point

  onMouseUp: (event) ->
    event.preventDefault()

    point = @getPoint event
    @command.moveRectangle @point.concat point

    @state = @State.RELEASE

  onMouseLeave: (event) ->
    @onMouseUp event

    @state = @State.RELEASE


exports.ToolRectangle = ToolRectangle
