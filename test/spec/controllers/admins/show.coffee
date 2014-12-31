'use strict'

describe 'Controller: AdminsShowCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  AdminsShowCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    AdminsShowCtrl = $controller 'AdminsShowCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(!!scope).toBe true
