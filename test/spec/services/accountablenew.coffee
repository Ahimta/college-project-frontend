'use strict'

describe 'Service: accountableNew', ->

  # load the service's module
  beforeEach module 'collegeProjectFrontendApp'

  # instantiate service
  accountableNew = {}
  beforeEach inject (_accountableNew_) ->
    accountableNew = _accountableNew_

  it 'should do something', ->
    expect(!!accountableNew).toBe true
