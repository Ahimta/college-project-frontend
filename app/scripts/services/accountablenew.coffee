'use strict'

###*
 # @ngdoc service
 # @name collegeProjectFrontendApp.accountableNew
 # @description
 # # accountableNew
 # Factory in the collegeProjectFrontendApp.
###
angular.module('collegeProjectFrontendApp')
  .factory 'accountableNew', ($http, $location, $log, BACKEND) ->

    (scope, resource, formName, redirectUrl) ->

      reqBodyName = resource[0...-1]
      url         = "#{BACKEND}/#{resource}"

      scope.create = ->
        reqBody              = {}
        reqBody[reqBodyName] = scope[formName]

        $http.post(url, reqBody)
          .then (res) ->
            $location.path redirectUrl
            scope.usernameConflict = false
            res

          .catch (res) ->
            $log.debug res
            scope.usernameConflict = res.status == 409
