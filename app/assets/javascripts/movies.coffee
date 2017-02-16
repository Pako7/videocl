# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '.rent-movie', (evt) ->
  id = $(@).data('id')
  if parseInt(id)
    $.ajax
      url: '/movies/finalize_rent'
      type: 'post'
      dataType: 'json'
      data:
        id: id
      success: (data) ->
        console.log data
        console.log data.message
