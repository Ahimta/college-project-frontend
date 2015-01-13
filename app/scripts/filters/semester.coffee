'use strict'

###*
 # @ngdoc filter
 # @name collegeProjectFrontendApp.filter:semester
 # @function
 # @description
 # # semester
 # Filter in the collegeProjectFrontendApp.
###
angular.module('collegeProjectFrontendApp')
  .filter 'semester', ->

    hourToString = (hour) ->
      if hour <= 12 then "#{hour}ص"
      else "#{(hour - 12)}م"

    (semester) ->
      from = hourToString(semester.from)
      to   = hourToString(semester.to)
      "#{from} - #{to}"
