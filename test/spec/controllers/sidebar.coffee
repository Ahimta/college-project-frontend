'use strict'

describe 'Controller: SidebarCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  SidebarCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    SidebarCtrl = $controller 'SidebarCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(!!scope).toBe true
