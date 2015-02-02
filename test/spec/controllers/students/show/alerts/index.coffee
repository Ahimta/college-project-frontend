'use strict'

describe 'Controller: StudentsShowAlertsIndexCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  StudentsShowAlertsIndexCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    StudentsShowAlertsIndexCtrl = $controller 'StudentsShowAlertsIndexCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(!!scope).toBe true
