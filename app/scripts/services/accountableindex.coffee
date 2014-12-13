'use strict'

###*
 # @ngdoc service
 # @name collegeProjectFrontendApp.AccountableIndex
 # @description
 # # AccountableIndex
 # Factory in the collegeProjectFrontendApp.
###
angular.module('collegeProjectFrontendApp')
  .factory 'AccountableIndex', ($http, $log, BACKEND) ->

    (scope, resource, collectionName) ->
      url = "#{BACKEND}/#{resource}"

      invalidate = ->
        $http.get(url)
          .then (response) ->
            scope[collectionName] = response.data[resource]
            response

          .catch (error) ->
            $log.debug error

      scope.destroy = (id) ->
        $http.delete("#{url}/#{id}")
          .then(invalidate)

      invalidate()
