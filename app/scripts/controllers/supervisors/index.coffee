'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:SupervisorsIndexCtrl
 # @description
 # # SupervisorsIndexCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'SupervisorsIndexCtrl', ($scope, $http, $location, $log, Utils, BACKEND) ->

    Utils.setPageTitle 'وحدة الإرشاد'

    url = "#{BACKEND}/supervisor_accounts"
    _isEditing = {}

    invalidate = ->
      $http.get(url)
        .then (response) ->
          $scope.supervisors = response.data.supervisor_accounts
          response

      .catch (error) ->
        $log.debug error

    $scope.update = (id, supervisor_account) ->
      $http.put("#{url}/#{id}", supervisor_account: supervisor_account)
        .then(invalidate)

    $scope.edit = (id) ->
      _isEditing[id] = true

    $scope.reset = (id) ->
      _isEditing[id] = false

    $scope.isEditing = (id) ->
      _isEditing[id]

    $scope.destroy = (id) ->
      $http.delete("#{url}/#{id}")
        .then(invalidate)

    invalidate()
