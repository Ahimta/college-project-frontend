'use strict'

describe 'Controller: CoursesCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  CoursesCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    CoursesCtrl = $controller 'CoursesCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
