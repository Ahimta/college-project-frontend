'use strict'

describe 'Controller: SupervisorsIndexCtrl', ->

  # load the controller's module
  beforeEach module 'collegeProjectFrontendApp'

  SupervisorsIndexCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    SupervisorsIndexCtrl = $controller 'SupervisorsIndexCtrl', {
      $scope: scope
    }
