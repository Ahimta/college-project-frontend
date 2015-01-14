'use strict'

describe 'Filter: schedule', ->

  # load the filter's module
  beforeEach module 'collegeProjectFrontendApp'

  # initialize a new instance of the filter before each test
  schedule = null
  beforeEach inject ($filter) ->
    schedule = $filter 'schedule'

  it 'should return the input prefixed with "schedule filter:"', ->
    input = {from: 16, to: 18}
    expect(schedule(input)).toBe "4م - 6م"
