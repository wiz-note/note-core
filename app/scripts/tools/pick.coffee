'use strict'

{ToolBase} = require './toolbase'
{CommandDrawRectangle} = require '../commands/drawrectangle'

class ToolPick extends ToolBase

  State:
    RELEASE: 0
    PRESS: 1

  GC:
    state:
      strokeWidth: 1
      stroke: '#555555'
      fill: 'none'

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
    @command = new CommandDrawRectangle @point.concat(@point)
    @element = @core.addCommand @command, @GC

    @state = @State.PRESS

  onMouseMove: (event) ->
    return unless @state is @State.PRESS

    event.preventDefault()

    point = @getPoint event
    @command.moveRectangle @point.concat point

  onMouseUp: (event) ->
    event.preventDefault()

    @core.removeCommand @command

    @state = @State.RELEASE

  onMouseLeave: (event) ->
    if @state is @State.PRESS
      @onMouseUp event

    @state = @State.RELEASE


exports.ToolPick = ToolPick
