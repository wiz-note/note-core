'use strict'

{ToolBase} = require './toolbase'
{CommandDrawPath} = require '../commands/drawpath'

class ToolFreehand extends ToolBase

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

    @command = new CommandDrawPath @point
    @element = @core.addCommand @command

    @state = @State.PRESS

  onMouseMove: (event) ->
    return unless @state is @State.PRESS

    event.preventDefault()

    point = @getPoint event

    @command.addPath @point.concat point

    @point = point

  onMouseUp: (event) ->
    event.preventDefault()

    @state = @State.RELEASE


exports.ToolFreehand = ToolFreehand
