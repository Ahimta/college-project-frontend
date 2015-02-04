'use strict'

###*
 # @ngdoc filter
 # @name collegeProjectFrontendApp.filter:day
 # @function
 # @description
 # # day
 # Filter in the collegeProjectFrontendApp.
###
angular.module('collegeProjectFrontendApp')
  .filter 'day', ->
    (dayInt) ->
      switch parseInt(dayInt)
        when 0 then 'الأحد'
        when 1 then 'الإثنين'
        when 2 then 'الثلاثاء'
        when 3 then 'الأربعاء'
        when 4 then 'الخميس'
