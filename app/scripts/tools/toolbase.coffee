'use strict'

class ToolBase

  target: null

  listeners: null

  constructor: (target) ->
    @target = target

    @listeners = []

  activate: ->
    @addListener @target, 'mousedown', @onMouseDown?.bind @
    @addListener @target, 'mousemove', @onMouseMove?.bind @
    @addListener @target, 'mouseup',   @onMouseUp?.bind @

    @addListener @target, 'touchstart', @onMouseDown?.bind @
    @addListener @target, 'touchmove',  @onMouseMove?.bind @
    @addListener @target, 'touchend',   @onMouseUp?.bind @

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
      return [event.touches[0].clientX, event.touches[0].clientY]
    else
      return [event.x, event.y]

  onMouseDown: (event) ->

  onMouseMove: (event) ->

  onMouseUp: (event) ->


exports.ToolBase = ToolBase
