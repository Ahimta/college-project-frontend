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
      if hour <= 12 then "#{hour}ص"
      else "#{(hour - 12)}م"

    (schedule) ->
      from = hourToString(schedule.from)
      to   = hourToString(schedule.to)
      "#{from} - #{to}"
