'use strict'

describe 'Filter: semester', ->

  # load the filter's module
  beforeEach module 'collegeProjectFrontendApp'

  # initialize a new instance of the filter before each test
  semester = null
  beforeEach inject ($filter) ->
    semester = $filter 'semester'

  it 'should return the input prefixed with "semester filter:"', ->
    input = {from: 16, to: 18}
    expect(semester(input)).toBe "4م - 6م"
