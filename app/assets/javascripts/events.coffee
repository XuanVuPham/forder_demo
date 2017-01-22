$(document).ready ->
  $('#notifications-dropdown').click ->
    $('#notification_count').fadeOut 'slow'
    $('.mark-read').click ->
      $.ajax
        type: 'PUT'
        url: '/events/' + $(this).data('id')
        dataType: 'json'
