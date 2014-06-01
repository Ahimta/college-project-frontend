'use strict'

describe 'Controller: TeacherloginCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  TeacherloginCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TeacherloginCtrl = $controller 'TeacherloginCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
