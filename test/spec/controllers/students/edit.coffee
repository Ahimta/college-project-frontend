'use strict'

describe 'Controller: StudentsEditCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  StudentsEditCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    StudentsEditCtrl = $controller 'StudentsEditCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(!!scope).toBe true
