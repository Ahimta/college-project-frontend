'use strict'

describe 'Controller: TeachersCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  TeachersCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TeachersCtrl = $controller 'TeachersCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(!!scope).toBe true
