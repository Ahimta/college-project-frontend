'use strict'

describe 'Controller: RecruitersShowCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  RecruitersShowCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    RecruitersShowCtrl = $controller 'RecruitersShowCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
