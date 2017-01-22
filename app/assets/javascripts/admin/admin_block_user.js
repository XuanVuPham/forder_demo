$(document).ready(function() {
  $('.btn_block').on('click', function() {
    statusNow = $(this).val();
    btn = $(this);
    statusChange = (statusNow === 'blocked') ? 'active' : 'blocked';
    classCssNow = (statusNow === 'blocked') ? 'btn-danger' : 'btn-primary';
    classCssAfter = (statusChange === 'blocked') ? 'btn-danger' : 'btn-primary';
    parent = $(this).parent(),
    userId =  parent.children()[0].value,
    $.ajax({
      type: 'PUT',
      url : '/admin/users/' + userId,
      dataType: 'json',
       data: {
        user: {
          status: statusNow
        }
      },
      success: function(data) {
        btn.val(statusChange);
        $(btn).removeClass(classCssNow).addClass(classCssAfter);
        btn.closest('tr').find('.status').text(statusNow);
      },
      error: function(error_message) {
        alert('error ' + error_message);
      }
    });
  });
});
