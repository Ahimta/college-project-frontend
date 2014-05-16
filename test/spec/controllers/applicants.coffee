'use strict'

describe 'Controller: ApplicantsCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  ApplicantsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ApplicantsCtrl = $controller 'ApplicantsCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
