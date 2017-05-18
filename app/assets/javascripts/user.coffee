# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#modal .modal-body').on 'ajax:success', (event, html) ->
    result_list = $(@).closest('.modal-body').find('div.list')
    result_list.html html
