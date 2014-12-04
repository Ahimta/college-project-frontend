'use strict'

describe 'Controller: TeachersIndexCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  TeachersIndexCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TeachersIndexCtrl = $controller 'TeachersIndexCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings).toBe undefined
