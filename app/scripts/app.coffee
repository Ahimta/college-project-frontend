'use strict'

angular
  .module('collegeProjectFrontendApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute'
  ])
  .config ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/applicants',
        templateUrl: 'views/applicants.html'
        controller: 'ApplicantsCtrl'
      .otherwise
        redirectTo: '/applicants'

    $locationProvider.html5Mode true
