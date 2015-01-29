'use strict'

angular
  .module('collegeProjectFrontendApp', [
    'ngCookies'
    'ngResource'
    'ngSanitize'
    'ngRoute'
    'ngAnimate'
    'angularFileUpload'
    'LocalStorageModule'
    'restangular'
    'angular-loading-bar'
  ])
  .config ($httpProvider) ->
    $httpProvider.interceptors.push [
      'localStorageService'
      '$location'
      '$q'
      (localStorageService, $location, $q) ->
        request: (config) ->
          config.headers['X-Access-Token'] = localStorageService.get('accessToken')
          config

        responseError: (res) ->
          switch res.status
            when 404
              $location.path('/') unless res.config.url.match(/guide$/)
            when 401
              isPublic = ($location.path() in ['/', '/applicants/new'])
              isLogin  = (res.config.method == 'POST' and res.config.url.match(/sessions/))
              $location.path('/') unless isPublic or isLogin
          $q.reject(res)
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
      .when '/guides/:id',
        templateUrl: 'views/guides/show.html'
        controller: 'GuidesShowCtrl'
      .when '/guides',
        templateUrl: 'views/guides/index.html'
        controller: 'GuidesIndexCtrl'
      .when '/students/:id/edit',
        templateUrl: 'views/students/edit.html'
        controller: 'StudentsEditCtrl'
      .when '/students/:id',
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
      .when '/classes/:id/edit',
        templateUrl: 'views/classes/edit.html'
        controller: 'ClassesEditCtrl'
      .when '/classes/:id',
        templateUrl: 'views/classes/show.html'
        controller: 'ClassesShowCtrl'
      .when '/courses/:id/:action?',
        templateUrl: 'views/courses/show.html'
        controller: 'CoursesShowCtrl'
      .when '/teachers/:id/:action?',
        templateUrl: 'views/teachers/show.html'
        controller: 'TeachersShowCtrl'
      .when '/admins/:id/:action?',
        templateUrl: 'views/admins/show.html'
        controller: 'AdminsShowCtrl'
      .when '/supervisors/:id/:action?',
        templateUrl: 'views/supervisors/show.html'
        controller: 'SupervisorsShowCtrl'
      .when '/recruiters/:id/:action?',
        templateUrl: 'views/recruiters/show.html'
        controller: 'RecruitersShowCtrl'
      .otherwise
        redirectTo: '/'
