'use strict'

describe 'Controller: CoursesNewCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  CoursesNewCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    CoursesNewCtrl = $controller 'CoursesNewCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(!!scope).toBe true
