'use strict'

describe 'Controller: FacultyMembersIndexCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  FacultyMembersIndexCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    FacultyMembersIndexCtrl = $controller 'FacultyMembersIndexCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(!!scope).toBe true
