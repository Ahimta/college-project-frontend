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
        templateUrl: 'views/applicants/index.html'
        controller: 'ApplicantsCtrl'
      .when '/',
        templateUrl: 'views/index.html'
        controller: 'IndexCtrl'
      .when '/applicants/new',
        templateUrl: 'views/applicants/new.html'
        controller: 'ApplicantnewCtrl'
      .otherwise
        redirectTo: '/'

  .config ($translateProvider) ->
    $translateProvider.translations 'en',
      SWITCH_LANG: 'عربي'
      HOMEPAGE: 'Homepage'
      APPLICANTS:
        SINGULAR: 'Applicant'
        PLURAL: 'Applicants'
        TITLE: 'Applicants'
        NEW: 'Apply'
      COURSES:
        SINGULAR: 'Course'
        PLURAL: 'Courses'
        TITLE: 'Courses'
      TEACHERS:
        SINGULAR: 'Teacher'
        PLURAL: 'Teachers'
        TITLE: 'Teachers'
      STUDENTS:
        SINGULAR: 'Student'
        PLURAL: 'Students'
        TITLE: 'Students'

      NAME: 'Name'
      FIRST_NAME: 'First name'
      LAST_NAME: 'Last name'
      PHONE: 'Phone'
      ADDRESS: 'Address'
      SPECIALIZATION: 'Specialization'
      DEGREE: 'Degree'
      ACCEPT: 'Accept'
      REJECT: 'Reject'


    $translateProvider.translations 'ar',
      SWITCH_LANG: 'English'
      HOMEPAGE: 'الصفحة الرئيسية'
      APPLICANTS:
        SINGULAR: 'متقدم'
        PLURAL: 'متقدمين'
        TITLE: 'المتقدمين'
        NEW: 'تقديم طلب'
      COURSES:
        SINGULAR: 'مادة'
        PLURAL: 'مواد'
        TITLE: 'المواد'
      TEACHERS:
        SINGULAR: 'أستاذ'
        PLURAL: 'أساتذة'
        TITLE: 'اﻷساتذة'
      STUDENTS:
        SINGULAR: 'طالب'
        PLURAL: 'طلاب'
        TITLE: 'الطلاب'

      NAME: 'الاسم'
      FIRST_NAME: 'الاسم الأول'
      LAST_NAME: 'الاسم الأخير'
      PHONE: 'رقم الهاتف'
      ADDRESS: 'العنوان'
      SPECIALIZATION: 'التخصص'
      DEGREE: 'الدرجة العلمية'
      ACCEPT: 'قبول'
      REJECT: 'رفض'
