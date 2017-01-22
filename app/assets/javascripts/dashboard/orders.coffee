ready = ->
  $('body').on 'change', '.status-order', ->
    url = $(this).val()
    $.update url

  $.update = (url, data, callback, type) ->
    if $.isFunction(data)
      type = type or callback
      callback = data
      data = {}
    $.ajax
      url: url
      type: 'PUT'
      success: callback
      data: data
      contentType: type
  $('body').on 'click', '#create_order', ->
    $(".create_order").toggle 500

$(document).ready(ready)
$(document).on('page:load', ready)
