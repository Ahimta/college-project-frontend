'use strict'

angular
  .module('collegeProjectFrontendApp', [
    'ngCookies'
    'ngResource'
    'ngSanitize'
    'ngRoute'
    'angularFileUpload'
    'LocalStorageModule'
  ])
  .config ($httpProvider) ->
    $httpProvider.interceptors.push (localStorageService) ->
      request: (config) ->
        config.headers['X-Access-Token'] = localStorageService.get('accessToken')
        config

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
      .when '/recruiters',
        templateUrl: 'views/recruiters/index.html'
        controller: 'RecruitersIndexCtrl'
      .when '/recruiters/new',
        templateUrl: 'views/recruiters/new.html'
        controller: 'RecruitersNewCtrl'
      .when '/faculty_members',
        templateUrl: 'views/faculty_members/index.html'
        controller: 'FacultyMembersIndexCtrl'
      .otherwise
        redirectTo: '/'
