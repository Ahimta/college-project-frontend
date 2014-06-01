'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'IndexCtrl', ($scope, Sectionable, Utils, Navbarable) ->

    Utils.setPageTitle 'الصفحة الرئيسية'

    Sectionable $scope

    links = [
      {
        description: 'إدارة التوظيف'
        name: 'بوابة المسؤولين'
        path: '#/login/admin'
      }
      {
        description: 'إدارة الطلاب و المواد'
        name: 'بوابة المرشدين'
        path: '#/login/teacher'
      }
      {
        description: 'بيانات الطالب'
        name: 'بوابة الطلاب'
        path: '#/login/student'
      }
    ]

    Navbarable $scope, links

