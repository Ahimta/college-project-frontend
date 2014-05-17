'use strict'

describe 'Controller: ApplicantnewCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  ApplicantnewCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ApplicantnewCtrl = $controller 'ApplicantnewCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
