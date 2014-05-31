'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'IndexCtrl', ($scope, Sectionable, Utils) ->

    Utils.setPageTitle 'الصفحة الرئيسية'

    Sectionable $scope

    $scope.gates = [
      {
        description: 'إدارة التوظيف'
        name: 'بوابة المسؤولين'
        action: ->
      }
      {
        description: 'إدارة الطلاب و المواد'
        name: 'بوابة المرشدين'
        action: ->
      }
      {
        description: 'بيانات الطالب'
        name: 'بوابة الطلاب'
        action: ->
      }
    ]
