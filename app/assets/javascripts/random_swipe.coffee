# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
renewUsers = (count) ->
  $('#rest_name').text(count)

gon.watch('name_', interval: 1000, renewUsers)
