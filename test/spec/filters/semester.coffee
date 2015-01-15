'use strict'

describe 'Filter: semester', ->

  # load the filter's module
  beforeEach module 'collegeProjectFrontendApp'

  # initialize a new instance of the filter before each test
  semester = null
  beforeEach inject ($filter) ->
    semester = $filter 'semester'

  it 'should return the input prefixed with "semester filter:"', ->
    input = {order: 1, year: '1436/1437'}
    expect(semester(input)).toEqual('1436/1437 - الفصل الأول')

  it 'should return nothing if the input is falsy', ->
    input = null
    expect(semester(input)).toBe ''
