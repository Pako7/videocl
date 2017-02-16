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
        $('#modal-message-rent').html(data.message)
        if data.success == true
          $('#modal-message-rent').addClass 'alert-success'
          $('#modal-message-rent').removeClass 'alert-danger'
        else
          $('#modal-message-rent').addClass 'alert-danger'
          $('#modal-message-rent').removeClass 'alert-success'
        $('#container-result-rent-message').modal 'show'
        window.setTimeout ->
         $('#container-result-rent-message').modal 'hide'
        , 2450

