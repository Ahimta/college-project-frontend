'use strict'

angular.module('collegeProjectFrontendApp')
  .service 'Utils', ($document, APPNAME) ->
    # AngularJS will instantiate a singleton by calling "new" on this function

    setPageTitle: (title) ->
      $document[0].title = "#{APPNAME} - #{title}"
