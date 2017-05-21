$ ->
  $.fn.extend
    massCheckable: (options) ->
      options = $.extend({
        checkable_class: 'mass-checkable'
      }, options)

      checkboxes = $(".#{options.checkable_class}[type='checkbox']")
      $(checkboxes[0]).on 'click', ->
        if $(@).is ':checked'
          checkboxes.filter(':not(:checked)').prop 'checked', true
        else
          checkboxes.filter(':checked').prop 'checked', false
