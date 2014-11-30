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
      _isEditing = {}

      invalidate = ->
        $http.get(url)
          .then (response) ->
            scope[collectionName] = response.data[resource]
            response

          .catch (error) ->
            $log.debug error

      scope.update = (id, student_account) ->
        reqBody           = {}
        reqBody[resource] = student_account

        $http.put("#{url}/#{id}", reqBody)
          .then(invalidate)

      scope.edit = (id) ->
        _isEditing[id] = true

      scope.reset = (id) ->
        _isEditing[id] = false

      scope.isEditing = (id) ->
        _isEditing[id]

      scope.destroy = (id) ->
        $http.delete("#{url}/#{id}")
          .then(invalidate)

      invalidate()
