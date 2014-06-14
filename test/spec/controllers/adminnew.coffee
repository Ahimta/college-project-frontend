'use strict'

describe 'Controller: AdminnewCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  AdminnewCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    AdminnewCtrl = $controller 'AdminnewCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
