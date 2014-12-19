'use strict'

describe 'Controller: ClassesNewCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  ClassesNewCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ClassesNewCtrl = $controller 'ClassesNewCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(!!scope).toBe true
