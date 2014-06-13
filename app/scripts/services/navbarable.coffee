'use strict'

angular.module('collegeProjectFrontendApp')
  .service 'Navbarable', ($location) ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    (scope, links) ->

      scope.isActive = (path) ->
        "##{$location.path()}" == path
