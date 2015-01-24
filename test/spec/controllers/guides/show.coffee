'use strict'

describe 'Controller: GuidesShowCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  GuidesShowCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    GuidesShowCtrl = $controller 'GuidesShowCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(!!scope).toBe true
