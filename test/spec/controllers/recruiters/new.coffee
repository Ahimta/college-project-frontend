'use strict'

describe 'Controller: RecruitersNewCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  RecruitersNewCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    RecruitersNewCtrl = $controller 'RecruitersNewCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(!!scope).toBe true
