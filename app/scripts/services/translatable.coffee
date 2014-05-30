'use strict'

angular.module('collegeProjectFrontendApp')
  .service 'Translatable', ($locale, $translate) ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    (scope) ->

      scope.isArabic = ->
        true

      scope.getDir = ->
        if scope.isArabic() then 'rtl' else 'ltr'

      scope.getLang = ->
        if scope.isArabic() then 'ar' else 'en'

      scope.switchLang = ->
        lang = if scope.isArabic() then 'en' else 'ar'
        $locale.id = lang
        $translate.use lang

      $translate.use if scope.isArabic() then 'ar' else 'en'
