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
          $scope.isUploading = true
          uploader.onBeforeUploadItem = (item) ->
            jobRequest = res.data.job_request
            item.url = "#{BACKEND}/job_requests/#{jobRequest.id}/files?token=#{jobRequest.token}"
          res
        .then (res) ->
          if uploader.queue and uploader.queue.length == 0
            $location.path '/'
          else
            uploader.uploadAll()
