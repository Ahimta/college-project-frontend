'use strict'

describe 'Service: ROLES', ->

  # load the service's module
  beforeEach module 'collegeProjectFrontendApp'

  # instantiate service
  ROLES = {}
  beforeEach inject (_ROLES_) ->
    ROLES = _ROLES_

  it 'should do something', ->
    expect(!!ROLES).toBe true
