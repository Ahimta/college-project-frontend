'use strict'

describe 'Controller: ClassesShowCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  ClassesShowCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ClassesShowCtrl = $controller 'ClassesShowCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(!!scope).toBe true
