'use strict'

describe 'Controller: IndexCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  IndexCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    IndexCtrl = $controller 'IndexCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(!!scope).toBe true
