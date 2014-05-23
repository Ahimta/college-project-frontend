'use strict'

describe 'Service: Navbarable', ->

  # load the service's module
  beforeEach module 'collegeProjectFrontendApp'

  # instantiate service
  Navbarable = {}
  beforeEach inject (_Navbarable_) ->
    Navbarable = _Navbarable_

  it 'should do something', ->
    expect(!!Navbarable).toBe true
