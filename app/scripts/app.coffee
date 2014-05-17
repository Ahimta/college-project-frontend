'use strict'

angular
  .module('collegeProjectFrontendApp', [
    'ngCookies'
    'ngResource'
    'ngSanitize'
    'ngRoute'
    'pascalprecht.translate'
  ])
  .config ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/applicants',
        templateUrl: 'views/applicants.html'
        controller: 'ApplicantsCtrl'
      .otherwise
        redirectTo: '/applicants'

  .config ($translateProvider) ->
    $translateProvider.translations 'en',
      SWITCH_LANG: 'عربي'
      HOMEPAGE: 'Homepage'
      APPLICANTS:
        SINGULAR: 'Applicant'
        PLURAL: 'Applicants'

    $translateProvider.translations 'ar',
      SWITCH_LANG: 'English'
      HOMEPAGE: 'الصفحة الرئيسية'
      APPLICANTS:
        SINGULAR: 'متقدم'
        PLURAL: 'متقدمين'
