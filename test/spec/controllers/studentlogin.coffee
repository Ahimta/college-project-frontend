'use strict'

describe 'Controller: StudentloginCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  StudentloginCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    StudentloginCtrl = $controller 'StudentloginCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
