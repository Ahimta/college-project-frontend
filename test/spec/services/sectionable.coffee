'use strict'

describe 'Service: Sectionable', ->

  # load the service's module
  beforeEach module 'collegeProjectFrontendApp'

  # instantiate service
  Sectionable = {}
  beforeEach inject (_Sectionable_) ->
    Sectionable = _Sectionable_

  it 'should do something', ->
    expect(!!Sectionable).toBe true
