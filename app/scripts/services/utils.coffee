'use strict'

angular.module('collegeProjectFrontendApp')
  .service 'Utils', ($document, APPNAME) ->
    # AngularJS will instantiate a singleton by calling "new" on this function

    setPageTitle: (title) ->
      $document[0].title = "#{APPNAME} - #{title}"

    getSchedule: (classes) ->
      _(classes)
        .groupBy('day')
        .map (day) ->
          _.groupBy day, ((klass) -> klass.schedule.from)
        .value()

    class:
      hasCollision: (schedule) -> (klass) ->
        (schedule[klass.day][klass.schedule.from].length > 1)
