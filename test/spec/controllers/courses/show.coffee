'use strict'

describe 'Controller: CoursesShowCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  CoursesShowCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    CoursesShowCtrl = $controller 'CoursesShowCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(!!scope).toBe true
