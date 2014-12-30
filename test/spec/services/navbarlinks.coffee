'use strict'

describe 'Service: navbarLinks', ->

  # load the service's module
  beforeEach module 'collegeProjectFrontendApp'

  # instantiate service
  navbarLinks = {}
  beforeEach inject (_navbarLinks_) ->
    navbarLinks = _navbarLinks_

  it 'should do something', ->
    expect(!!navbarLinks).toBe true
