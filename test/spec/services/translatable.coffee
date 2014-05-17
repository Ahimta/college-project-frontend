'use strict'

describe 'Service: Translatable', ->

  # load the service's module
  beforeEach module 'collegeProjectFrontendApp'

  # instantiate service
  Translatable = {}
  beforeEach inject (_Translatable_) ->
    Translatable = _Translatable_

  it 'should do something', ->
    expect(!!Translatable).toBe true
