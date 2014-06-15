'use strict'

describe 'Controller: RecruitersIndexCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  RecruitersIndexCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    RecruitersIndexCtrl = $controller 'RecruitersIndexCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(!!scope).toBe true
