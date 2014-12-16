'use strict'

describe 'Service: accountManager', ->

  # load the service's module
  beforeEach module 'collegeProjectFrontendApp'

  # instantiate service
  accountManager = {}
  beforeEach inject (_accountManager_) ->
    accountManager = _accountManager_

  it 'should do something', ->
    expect(!!accountManager).toBe true
