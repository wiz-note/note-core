'use strict'

{ToolBase} = require './toolbase'
{CommandDrawPath} = require '../commands/drawpath'

class ToolFreehand extends ToolBase

  State:
    RELEASE: 0
    PRESS: 1

  state: null

  stroke: null
  prevPoint: null

  command: null
  element: null

  constructor: (target, core) ->
    super target, core

    @state = @State.RELEASE

  onMouseDown: (event) ->
    event.preventDefault()

    [x, y] = @getPoint event

    # @stroke = []
    # @stroke.push x, y

    @command = new CommandDrawPath [x, y]
    @element = @core.addCommand @command

    @prevPoint = [x, y]

    @state = @State.PRESS

  onMouseMove: (event) ->
    return unless @state is @State.PRESS

    event.preventDefault()

    [x, y] = @getPoint event
    [prevX, prevY] = @prevPoint

    # @stroke.push x, y
    @command.addPath [prevX, prevY, x, y]

    @prevPoint = [x, y]

  onMouseUp: (event) ->
    event.preventDefault()

    @state = @State.RELEASE


exports.ToolFreehand = ToolFreehand
