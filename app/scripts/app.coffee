'use strict'

angular
  .module('collegeProjectFrontendApp', [
    'ngCookies'
    'ngResource'
    'ngSanitize'
    'ngRoute'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/applicants',
        templateUrl: 'views/applicants/index.html'
        controller: 'ApplicantsCtrl'
      .when '/',
        templateUrl: 'views/index.html'
        controller: 'IndexCtrl'
      .when '/applicants/new',
        templateUrl: 'views/applicants/new.html'
        controller: 'ApplicantnewCtrl'
      .when '/applicants/:id',
        templateUrl: 'views/applicants/show.html'
        controller: 'ApplicantshowCtrl'
      .when '/dashboard',
        templateUrl: 'views/dashboard.html'
        controller: 'DashboardCtrl'
      .when '/students',
        templateUrl: 'views/students/index.html'
        controller: 'StudentsCtrl'
      .when '/teachers',
        templateUrl: 'views/teachers/index.html'
        controller: 'TeachersCtrl'
      .when '/courses',
        templateUrl: 'views/courses/index.html'
        controller: 'CoursesCtrl'
      .otherwise
        redirectTo: '/'
