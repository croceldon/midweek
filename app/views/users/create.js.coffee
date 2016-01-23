$('#new_user, .alert').remove()
$('<%=j render @user %>').prependTo('.table-users tbody')
$('tbody tr:first-child').effect 'highlight'
$('<div>')
  .addClass('alert alert-success')
  .text('User created')
  .insertAfter '.header-users'
