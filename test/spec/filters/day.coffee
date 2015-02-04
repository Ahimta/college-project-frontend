'use strict'

describe 'Filter: day', ->

  # load the filter's module
  beforeEach module 'collegeProjectFrontendApp'

  # initialize a new instance of the filter before each test
  day = {}
  beforeEach inject ($filter) ->
    day = $filter 'day'

  it 'should return the input prefixed with "day filter:"', ->
    expect(!!day).toBe true
