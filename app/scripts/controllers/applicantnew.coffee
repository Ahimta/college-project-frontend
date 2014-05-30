'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'ApplicantnewCtrl', ($scope, $http, $location, BACKEND, Utils) ->

    Utils.setPageTitle 'تقديم طلب'

    $scope.create = ->
      $http.post("#{BACKEND}/applicants", applicant: $scope.applicant).then (_) ->
        $location.path '/applicants'
