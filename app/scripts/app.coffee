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
      .when '/dashboard',
        templateUrl: 'views/dashboard.html'
        controller: 'DashboardCtrl'
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
        BODY: 'Applicants for academic jobs.'
      COURSES:
        SINGULAR: 'Course'
        PLURAL: 'Courses'
        TITLE: 'Courses'
        BODY: 'Courses for students and teachers.'
      TEACHERS:
        SINGULAR: 'Teacher'
        PLURAL: 'Teachers'
        TITLE: 'Teachers'
        BODY: 'Teachers information.'
      STUDENTS:
        SINGULAR: 'Student'
        PLURAL: 'Students'
        TITLE: 'Students'
        BODY: 'Students information.'

      DASHBOARD: 'Dashboard'
      DETAILS: 'Details'
      LOGO: 'Logo'

      NAME: 'Name'
      FIRST_NAME: 'First name'
      LAST_NAME: 'Last name'
      PHONE: 'Phone'
      ADDRESS: 'Address'
      SPECIALIZATION: 'Specialization'
      DEGREE: 'Degree'
      ACCEPT: 'Accept'
      REJECT: 'Reject'
      ACCEPTED: 'Accepted'
      REJECTED: 'Rejected'


    $translateProvider.translations 'ar',
      SWITCH_LANG: 'English'
      HOMEPAGE: 'الصفحة الرئيسية'
      APPLICANTS:
        SINGULAR: 'متقدم'
        PLURAL: 'متقدمين'
        TITLE: 'المتقدمين'
        NEW: 'تقديم طلب'
        BODY: 'المتقدمين للوظائف اﻷكاديمية.'
      COURSES:
        SINGULAR: 'مادة'
        PLURAL: 'مواد'
        TITLE: 'المواد'
        BODY: 'مواد الطلاب و الأساتذة.'
      TEACHERS:
        SINGULAR: 'أستاذ'
        PLURAL: 'أساتذة'
        TITLE: 'اﻷساتذة'
        BODY: 'بيانات الأساتذة.'
      STUDENTS:
        SINGULAR: 'طالب'
        PLURAL: 'طلاب'
        TITLE: 'الطلاب'
        BODY: 'بيانات الطلاب.'

      DASHBOARD: 'لوحة التحكم'
      DETAILS: 'التفاصيل'
      LOGO: 'الشعار'

      NAME: 'الاسم'
      FIRST_NAME: 'الاسم الأول'
      LAST_NAME: 'الاسم الأخير'
      PHONE: 'رقم الهاتف'
      ADDRESS: 'العنوان'
      SPECIALIZATION: 'التخصص'
      DEGREE: 'الدرجة العلمية'
      ACCEPT: 'قبول'
      REJECT: 'رفض'
      ACCEPTED: 'تم القبول'
      REJECTED: 'تم الرفض'

  .constant 'BACKEND', 'https://college-project.herokuapp.com/api/v1'
