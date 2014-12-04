'use strict'

describe 'Controller: GuidesIndexCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  GuidesIndexCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    GuidesIndexCtrl = $controller 'GuidesIndexCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings).toBe undefined
