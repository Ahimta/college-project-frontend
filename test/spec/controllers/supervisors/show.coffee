'use strict'

describe 'Controller: SupervisorsShowCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  SupervisorsShowCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    SupervisorsShowCtrl = $controller 'SupervisorsShowCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(!!scope).toBe true
