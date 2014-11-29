'use strict'

describe 'Controller: SupervisorsNewCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  SupervisorsNewCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    SupervisorsNewCtrl = $controller 'SupervisorsNewCtrl', {
      $scope: scope
    }
