'use strict'

angular.module('collegeProjectFrontendApp')
  .controller 'IndexCtrl', ($scope, Sectionable, Utils) ->

    Utils.setPageTitle 'HOMEPAGE'

    Sectionable $scope
