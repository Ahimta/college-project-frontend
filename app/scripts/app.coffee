'use strict'

angular
  .module('collegeProjectFrontendApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/applicants',
        templateUrl: 'views/applicants.html'
        controller: 'ApplicantsCtrl'
      .otherwise
        redirectTo: '/applicants'
