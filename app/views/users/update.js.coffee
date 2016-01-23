$('.simple_form, .alert').remove()
row = $('#user_<%= @user.id %>')
row.replaceWith '<%= render @user %>'
$('#user_<%= @user.id %>').effect 'highlight'
$('<div>')
  .addClass('alert alert-success')
  .text('User updated')
  .insertAfter('.header-users')
