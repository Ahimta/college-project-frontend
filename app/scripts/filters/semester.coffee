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

    orderToString = (order) ->
      switch
        when 1 then 'الفصل الأول'
        when 2 then 'الفصل الثاني'
        when 3 then 'الفصل الثالث'
        when 4 then 'الفصل الرابع'

    (semester) ->
      if semester and semester.order and semester.year
        orderString = orderToString(semester.order)
        year        = semester.year

        "#{year} - #{orderString}"
      else
        ''
