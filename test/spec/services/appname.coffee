'use strict'

describe 'Service: APPNAME', ->

  # load the service's module
  beforeEach module 'collegeProjectFrontendApp'

  # instantiate service
  APPNAME = {}
  beforeEach inject (_APPNAME_) ->
    APPNAME = _APPNAME_

  it 'should do something', ->
    expect(!!APPNAME).toBe true
