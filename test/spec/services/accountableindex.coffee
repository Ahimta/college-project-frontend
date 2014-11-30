'use strict'

describe 'Service: AccountableIndex', ->

  # load the service's module
  beforeEach module 'collegeProjectFrontendApp'

  # instantiate service
  AccountableIndex = {}
  beforeEach inject (_AccountableIndex_) ->
    AccountableIndex = _AccountableIndex_

  it 'should do something', ->
    expect(!!AccountableIndex).toBe true
