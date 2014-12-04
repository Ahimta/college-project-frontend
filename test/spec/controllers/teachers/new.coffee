'use strict'

describe 'Controller: TeachersNewCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  TeachersNewCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TeachersNewCtrl = $controller 'TeachersNewCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings).toBe undefined
