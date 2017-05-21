# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.list').on 'change', ->
    $result_table = $(@).find('table.results')
    $result_table.massCheckable()

  $('#modal .modal-body').on 'ajax:success', (event, html) ->
    $target = $('#modal .modal-body .list')
    $target.html html
    $target.change()

  testMethod = ->
    $(@).val()
    hash = {}
    hash.id = $(@).val()
    hash.name = $(@).closest('.user').find('.user-name')
    hash.age = $(@).closest('.user').find('.user-age')
    hash

  selectedIds = ->
    $('#yey').find('input[type="hidden"]')
             .map -> $(@).val()
             .get()

  $('#modal .modal-footer button.select').on 'click', ->
    selected = selectedIds()
    container = {}
    container.users = $('#users-list')
                        .find('input:checked')
                        .filter -> !($(@).val() in selected)
                        .map ->
                          hash = {}
                          hash.id = $(@).val()
                          hash.name = $(@).closest('.user').find('.user-name').text()
                          hash.age = $(@).closest('.user').find('.user-age').text()
                          hash
                        .get()
    html = Mustache.to_html($('#hoge-tmpl').html(), container)
    $('#yey').append html

  $('#yey').on 'click', '.btn.delete-user', ->
    $(@).closest('tr').remove()

  $('#export').on 'click', (e) ->
    e.preventDefault
    message = $(@).data('message')
    if confirm(message)
      $form = $('#a-form')
      $form.attr('action', $(@).attr('href'))
      $form.attr('target', $(@).attr('target'))
      $form.submit()
    false
