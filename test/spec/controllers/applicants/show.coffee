'use strict'

describe 'Controller: ApplicantshowCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  ApplicantshowCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ApplicantshowCtrl = $controller 'ApplicantshowCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(!!scope).toBe true
