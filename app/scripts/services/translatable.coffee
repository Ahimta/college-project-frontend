'use strict'

angular.module('collegeProjectFrontendApp')
  .service 'Translatable', ($locale) ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    (scope) ->

      scope.isArabic = ->
        true

      scope.getDir = -> 'rtl'

      scope.getLang = -> 'ar'

      scope.switchLang = ->
