'use strict'

class ToolBase

  target: null
  core: null

  listeners: null

  offsetX: 0
  offsetY: 0

  constructor: (target, core) ->
    @target = target
    @core = core

    @listeners = []

    @offsetX = @target.offsetLeft
    @offsetY = @target.offsetTop

  activate: ->
    @addListener @target, 'mousedown',  @onMouseDown.bind @
    @addListener @target, 'mousemove',  @onMouseMove.bind @
    @addListener @target, 'mouseup',    @onMouseUp.bind @
    @addListener @target, 'mouseleave', @onMouseLeave.bind @

    @addListener @target, 'touchstart', @onMouseDown.bind @
    @addListener @target, 'touchmove',  @onMouseMove.bind @
    @addListener @target, 'touchend',   @onMouseUp.bind @
    @addListener @target, 'touchleave', @onMouseLeave.bind @

  deactivate: ->
    @removeAllListeners()

  addListener: (target, event, listener) ->
    target.addEventListener event, listener

    @listeners.push [target, event, listener]

  removeAllListeners: ->
    for [target, event, listener] in @listeners
      target.removeEventListener event, listener

  getPoint: (event) ->
    if event.touches?
      return [event.touches[0].clientX - @offsetX, event.touches[0].clientY - @offsetY]
    else
      return [event.x - @offsetX, event.y - @offsetY]

  onMouseDown: (event) ->

  onMouseMove: (event) ->

  onMouseUp: (event) ->

  onMouseLeave: (event) ->


exports.ToolBase = ToolBase
