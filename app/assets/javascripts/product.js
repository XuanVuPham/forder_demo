$(document).ready(function() {
  $('.id_btn_active').on('click', function() {
    statusNow = $(this).val();
    btn = $(this);
    statusChange = (statusNow === 'active') ? 'inactive' : 'active';
    parent = $(this).parent(),
    productId =  parent.children()[0].value,
    $.ajax({
      type: 'PUT',
      url : '/dashboard/shops/' + $('.shop_id').val() + '/products/'+ productId,
      dataType: 'json',
       data: {
        product: {
          status: statusChange
        }
      },
      success: function(data) {
        btn.val(statusChange);
      },
      error: function(error_message) {
        alert('error ' + error_message);
      }
    });
  });
});
