#new
$('.btn-new-user').on 'ajax:success', (event, data) ->
  $('#new_user').remove()
  $(data).insertAfter('.header-users')

#delete
$('body').on 'ajax:success', '.table-users .btn-danger', ->
  $(@).closest('tr').fadeOut ->
    $('<div>').addClass('alert alert-success')
      .text('User deleted')
      .insertAfter('.header-users')

#edit
$('body').on 'ajax:success', '.btn-edit-user', (event, data) ->
  $(data).insertAfter($(@).closest('tr'))
