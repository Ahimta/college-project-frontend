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
    expect(schedule(input)).toBe '4:00م - 6:00م'

  it 'should return nothing if the input is falsy', ->
    input = null
    expect(schedule(input)).toBe ''
