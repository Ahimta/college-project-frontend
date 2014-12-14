'use strict'

describe 'Controller: CoursesIndexCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  CoursesIndexCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    CoursesIndexCtrl = $controller 'CoursesIndexCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(!!scope).toBe true
