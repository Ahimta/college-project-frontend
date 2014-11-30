'use strict'

describe 'Controller: StudentsIndexCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  StudentsIndexCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    StudentsIndexCtrl = $controller 'StudentsIndexCtrl', {
      $scope: scope
    }
