$(document).ready(function() {
  $('#checkbox').on('click', function(){
    $('input:checkbox').not(this).prop('checked', this.checked);
  });
  $('.btnNext').on('click', function() {
    var shopId = $('#shop-id').val();
    $.ajax({
      url : '/dashboard/shops/' + shopId + '/accepted_order_products',
      type: 'GET',
      dataType: 'json',
      success: function(data) {
        content = "<div class='panel panel-default' id='tabs'>"+
          "<div class='panel-body'> <div class='dropdown action'>"+
          "<button class='list btn btn-primary btn-action btnPrev step1'"+
          "id='tab-2' href='#step1' data-toggle='tab'>Back</button>"+
          "<a class='list btn btn-success btn-action pull-right'"+
          "href='/dashboard/shops/" + shopId +
          "/order_products'>Done</a></div></div></div>"+
          "<table class='table table-bordered' <thead><tr> <th>ID" +
          "</th> <th>Productname</th> <th>Quantity</th> <th>Price (VND)</th></tr>" +
          "</thead> <tbody>";
        var total = 0, price = 0;
        for (var i = 0; i < data.length; i++) {
          total += parseFloat(data[i].price)
          price = parseFloat(data[i].price).toFixed(2).replace(/./g, function(c, i, a) {
            return i && c !== "." && ((a.length - i) % 3 === 0) ? ',' + c : c;
          })
          var index = i + 1;
          var row = "<tr><td>" + index + " </td> <td> <a href=" +
            "/dashboard/shops/" + shopId + "/products/" + data[i].product_id +
            "?order_product_id="+
            data[i].id+">" + data[i].name  + "</a></td><td>" + data[i].quantity
            + "</td><td>" +
            price +"</td></tr>"
          content += row;
        }
        total = total.toFixed(2).replace(/./g, function(c, i, a) {
          return i && c !== "." && ((a.length - i) % 3 === 0) ? ',' + c : c;
        })
        var total2 = "Total: " + total.toString() + " VND";
        var row = "<tr><td>" + "" + " </td> <td> <a href=" +
          "/dashboard/shops/" + "" + "/products/" + "" +
          "?order_product_id="+
          ""+">" + ""  + "</a></td><td>" + ""
          + "</td><td><strong class='tdtd'>" +
          total2 +"</strong></td></tr>"
        content += row;
        content += '</tbody></table>'
        $('#step2').html(content);
      },
      error: function(error_message) {
        alert(error);
      }
    });
  });

  $('.status-order').change(function() {
    itemId = $(this).parent().parent().children()[0].value;
    var selectedValue = $( '#status-order-'+ itemId +' option:selected' ).text()
    var classes = ['label-info', 'label-warning', 'label-danger', 'label-primary'];
    var actions = ['pending', 'accepted', 'rejected', 'done'];
    var shopId = $('#shop-id').val();
    $.ajax({
      url : '/dashboard/shops/' + shopId + '/order_products/' + itemId,
      type: 'PUT',
      dataType: 'json',
      data: {
        order_product: {
          status: selectedValue
        }
      },
      success: function() {
        var klass = '.order-product-status-' + itemId + ' span';
        $(klass).text(selectedValue);
        var currentClass = $(klass).attr('class').split(' ')[1];
        $(klass).removeClass(currentClass).addClass(classes[actions.indexOf(selectedValue)]);
      },
      error: function(error_message) {
        alert(error);
      }
    });
  });

  $('.button').on('click', function() {
    var idOrders = [];
    var shopId = $('#shop-id').val();
    action = $(this).val();
    $('.orders-hidden').each(function (index, obj) {
      if ($(obj).find('input:checkbox').prop('checked')) {
        idOrders.push(($(obj).children()[0]).value);
      }
    });
    var idItems = [];
    var classes = ['label-info', 'label-warning', 'label-danger', 'label-primary'];
    var actions = ['pending', 'accepted', 'rejected', 'done'];
    for (i = 0; i < idOrders.length; i++) {
      $('#order-' + idOrders[i] + ' table tbody tr').each(function() {
        id = $(this).children()[0].value;
        if ($('#checkbox-' + id).is(':checked')) {
         idItems.push(id);
       }
     });
    }

    $.each(idOrders, function( index, value ) {
      $.ajax({
        type: 'PUT',
        url : '/dashboard/shops/' + shopId + '/orders/' + value,
        dataType: 'json',
        data: {
          order: {
            status: action
          }
        },
        success: function(data) {
          var klass = '#status-' + value + ' span';
          $(klass).text(action);
          var currentClass = $(klass).attr('class').split(' ')[1];
          $(klass).removeClass(currentClass).addClass(classes[actions.indexOf(action)]);
          if (action == 'rejected') {
            $('.step2-new').hide();
          }
          else{
            $('.step2-new').show();
          }
        },
        error: function(error_message) {
          alert('error ' + error_message);
        }
      });
    });
    $.each(idItems, function( index, value ) {
      $.ajax({
        type: 'PUT',
        url : '/dashboard/shops/' + shopId + '/order_products/' + value,
        dataType: 'json',
        data: {
          order_product: {
            status: action
          }
        },
        success: function(data) {
          var klass = '.order-product-status-' + value + ' span';
          $(klass).text(action);
          var currentClass = $(klass).attr('class').split(' ')[1];
          $(klass).removeClass(currentClass).addClass(classes[actions.indexOf(action)]);
        },
        error: function(error_message) {
          alert('error');
        }
      });
    });
  });

  $('.single-action').on('click', function() {
    var classes = ['label-info', 'label-warning', 'label-danger', 'label-primary'];
    var actions = ['pending', 'accepted', 'rejected', 'done'];
    action = $(this).val();
    parent = $(this).parent().parent();
    itemId =  parent.children()[0].value;
    var shopId = $('#shop-id').val();
    $.ajax({
      type: 'PUT',
      url : '/dashboard/shops/' + shopId + '/order_products/' + itemId,
      dataType: 'json',
      data: {
        order_product: {
          status: action
        }
      },
      success: function(data) {
        var klass = '.order-product-status-' + itemId + ' span';
        $(klass).text(action);
        $('#status-order-'+ itemId).prop('selectedIndex', actions.indexOf(action));
        var currentClass = $(klass).attr('class').split(' ')[1];
        $(klass).removeClass(currentClass).addClass(classes[actions.indexOf(action)]);
      },
      error: function(error_message) {
        alert('error ' + error_message);
      }
    });
  });
});

$(document).on('click', '.step2', function() {
  $('#stars').removeClass('btn-primary').addClass('btn-default');
  $('#favorites').removeClass('btn-default').addClass('btn-primary');
});

$(document).on('click', '.step1', function() {
  $('#favorites').removeClass('btn-primary').addClass('btn-default');
  $('#stars').removeClass('btn-default').addClass('btn-primary');
});

$(document).ready(function(){
  $('.step1').click();
});

$(document).ready(function() {
  $('#id_btn_done').click(function() {
   $('.done-action').hide();
  });
});

$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').focus()
});
