'use strict'

describe 'Controller: StudentsNewCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  StudentsNewCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    StudentsNewCtrl = $controller 'StudentsNewCtrl', {
      $scope: scope
    }
