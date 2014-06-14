'use strict'

angular
  .module('collegeProjectFrontendApp', [
    'ngCookies'
    'ngResource'
    'ngSanitize'
    'ngRoute'
  ])
  .config ($httpProvider) ->
    $httpProvider.defaults.withCredentials = true

  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/index.html'
        controller: 'IndexCtrl'
      .when '/applicants',
        templateUrl: 'views/applicants/index.html'
        controller: 'ApplicantsCtrl'
      .when '/applicants/new',
        templateUrl: 'views/applicants/new.html'
        controller: 'ApplicantnewCtrl'
      .when '/applicants/:id',
        templateUrl: 'views/applicants/show.html'
        controller: 'ApplicantshowCtrl'
      .when '/dashboard',
        templateUrl: 'views/dashboard.html'
        controller: 'DashboardCtrl'
      .when '/admins',
        templateUrl: 'views/admins/index.html'
        controller: 'AdminsCtrl'
      .when '/login',
        templateUrl: 'views/login.html'
        controller: 'LoginCtrl'
      .when '/admins/new',
        templateUrl: 'views/admins/new.html'
        controller: 'AdminnewCtrl'
      .otherwise
        redirectTo: '/'
