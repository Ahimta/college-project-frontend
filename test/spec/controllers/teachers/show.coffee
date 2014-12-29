'use strict'

describe 'Controller: TeachersShowCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  TeachersShowCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TeachersShowCtrl = $controller 'TeachersShowCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(!!scope).toBe true
