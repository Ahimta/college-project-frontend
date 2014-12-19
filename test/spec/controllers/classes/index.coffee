'use strict'

describe 'Controller: ClassesIndexCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  ClassesIndexCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ClassesIndexCtrl = $controller 'ClassesIndexCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(!!scope).toBe true
