$('body').on 'click', '.btn-cancel', (event) ->
  event.preventDefault()
  $(@).closest('form').remove()
