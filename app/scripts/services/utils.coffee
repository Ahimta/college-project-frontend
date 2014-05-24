'use strict'

angular.module('collegeProjectFrontendApp')
  .service 'Utils', ($document, $translate, APPNAME) ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    setPageTitle: (title) ->
      $translate([APPNAME, title]).then (translations) ->
        $document[0].title = "#{translations[APPNAME]} - #{translations[title]}"
