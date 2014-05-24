'use strict'

describe 'Service: BACKEND', ->

  # load the service's module
  beforeEach module 'collegeProjectFrontendApp'

  # instantiate service
  BACKEND = {}
  beforeEach inject (_BACKEND_) ->
    BACKEND = _BACKEND_

  it 'should do something', ->
    expect(!!BACKEND).toBe true
