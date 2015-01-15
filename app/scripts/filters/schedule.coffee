'use strict'

###*
 # @ngdoc filter
 # @name collegeProjectFrontendApp.filter:schedule
 # @function
 # @description
 # # schedule
 # Filter in the collegeProjectFrontendApp.
###
angular.module('collegeProjectFrontendApp')
  .filter 'schedule', ->

    hourToString = (hour) ->
      if hour <= 12 then "#{hour}:00ص"
      else "#{(hour - 12)}:00م"

    (schedule) ->
      if schedule and schedule.from and schedule.to
        from = hourToString(schedule.from)
        to   = hourToString(schedule.to)
        "#{from} - #{to}"
      else
        ''
