'use strict';
# lib = require './components/components'

polymer = Polymer 'note-core',

  notitle: '',

  aProp: false,

  ready: ->
    console.log 'ok'

  task: (dummy) ->
    return dummy

return polymer;
