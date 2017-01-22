function updateShopRequest(button, message, shop_id, click_status){
  $('.modal-message').html(message);
  var button_press = {approve: 'Approve', reject: 'Reject'};
  var shop_status = {active: 1, reject: 3};
  var status;
  var alertClass;
  if(click_status === 1){
    status = shop_status.active;
    alertClass = 'alert-success';
  }
  else if(click_status === 3){
    status = shop_status.reject;
    alertClass = 'alert-warning';
  }
  // status = shop_status.active;
  $('.shop-request-modal').modal('show');
  $('.modal-backdrop').css('z-index', -1);
  $('.btn-ok').on('click', function(){
    $.ajax({
      type: 'post',
      url: '/admin/shop_requests/' + shop_id,
      dataType: 'json',
      data: {
        shop_request: {
          status: status
        },
        _method: 'patch'
      },
      success: function(response){
        if(response.is_success === true){
          var tr = $(button).closest('tr');
          $('.shop-request-modal').modal('hide');
          setTimeout(function(){
            $(tr).fadeOut();
            $('.alert').addClass(alertClass).html(response.message);
          }, 300);
        }
        else {
          $('.shop-request-modal').modal('hide');
          $('.alert').addClass('alert-danger').html(response.message);
        }
      },
      error: function(error_message){
        alert('error ' + error_message);
      }
    });
  });
}
