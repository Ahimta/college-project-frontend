'use strict'

describe 'Controller: ClassesEditCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  ClassesEditCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ClassesEditCtrl = $controller 'ClassesEditCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(!!scope).toBe true
