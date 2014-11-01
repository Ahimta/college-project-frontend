'use strict'

###*
 # @ngdoc function
 # @name collegeProjectFrontendApp.controller:ApplicantnewCtrl
 # @description
 # # ApplicantnewCtrl
 # Controller of the collegeProjectFrontendApp
###
angular.module('collegeProjectFrontendApp')
  .controller 'ApplicantnewCtrl', ($scope, $http, $location, FileUploader, BACKEND, Utils) ->

    Utils.setPageTitle 'تقديم طلب'
    resource = "#{BACKEND}/job_requests"


    uploader = $scope.uploader = new FileUploader
      withCredentials: true
      method: 'PUT'

    uploader.onCompleteAll = ->
      $location.path '/'

    $scope.create = ->
      $http.post(resource, job_request: $scope.job_request)
        .then (res) ->
          uploader.onBeforeUploadItem = (item) ->
            item.url = "#{BACKEND}/job_requests/#{res.data.job_request.id}/files"
          res
        .then (res) ->
          if uploader.queue and uploader.queue.length == 0
            $location.path '/'
          else
            uploader.uploadAll()
          res