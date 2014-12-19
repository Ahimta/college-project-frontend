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
    $httpProvider.interceptors.push [
      'localStorageService'
      (localStorageService) ->
        request: (config) ->
          config.headers['X-Access-Token'] = localStorageService.get('accessToken')
          config
    ]

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
      .when '/supervisors',
        templateUrl: 'views/supervisors/index.html'
        controller: 'SupervisorsIndexCtrl'
      .when '/supervisors/new',
        templateUrl: 'views/supervisors/new.html'
        controller: 'SupervisorsNewCtrl'
      .when '/students',
        templateUrl: 'views/students/index.html'
        controller: 'StudentsIndexCtrl'
      .when '/students/new',
        templateUrl: 'views/students/new.html'
        controller: 'StudentsNewCtrl'
      .when '/teachers',
        templateUrl: 'views/teachers/index.html'
        controller: 'TeachersIndexCtrl'
      .when '/teachers/new',
        templateUrl: 'views/teachers/new.html'
        controller: 'TeachersNewCtrl'
      .when '/guides/:guide_id?',
        templateUrl: 'views/guides/index.html'
        controller: 'GuidesIndexCtrl'
      .when '/students/:id/:mode?',
        templateUrl: 'views/students/show.html'
        controller: 'StudentsShowCtrl'
      .when '/courses',
        templateUrl: 'views/courses/index.html'
        controller: 'CoursesIndexCtrl'
      .when '/courses/new',
        templateUrl: 'views/courses/new.html'
        controller: 'CoursesNewCtrl'
      .when '/classes',
        templateUrl: 'views/classes/index.html'
        controller: 'ClassesIndexCtrl'
      .when '/classes/new',
        templateUrl: 'views/classes/new.html'
        controller: 'ClassesNewCtrl'
      .when '/classes/:id/:action?',
        templateUrl: 'views/classes/show.html'
        controller: 'ClassesShowCtrl'
      .otherwise
        redirectTo: '/'
