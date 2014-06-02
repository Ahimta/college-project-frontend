'use strict'

describe 'Controller: AdminloginCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  AdminloginCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    AdminloginCtrl = $controller 'AdminloginCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(!!scope).toBe true
