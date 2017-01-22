(($) ->
  $.user_search_box = {}
  $.extend true, $.user_search_box,
    settings:
      url: '/users'
      param: 'search'
      dom_id: '#livesearch'
      minChars: 2
      loading_css: '#livesearch_loading'
      del_id: '#livesearch_del'
    loading: ->
      $($.user_search_box.settings.loading_css).show()

    idle: ->
      $($.user_search_box.settings.loading_css).hide()

    start: ->
      $.user_search_box.loading()
      $(document).trigger 'before.user_search_box'

    stop: ->
      $.user_search_box.idle()
      $(document).trigger 'after.user_search_box'

    kill: ->
      $($.user_search_box.settings.dom_id).fadeOut 50
      $($.user_search_box.settings.dom_id).html ''
      $($.user_search_box.settings.del_id).fadeOut 100

    reset: ->
      $($.user_search_box.settings.dom_id).html ''
      $($.user_search_box.settings.dom_id).fadeOut 50
      $('#SearchSearch').val ''
      $($.user_search_box.settings.del_id).fadeOut 100

    process: (terms) ->
      if /\S/.test(terms)
        $.ajax
          type: 'GET'
          url: $.user_search_box.settings.url
          data: search: terms.trim()
          dataType: 'text'
          complete: (data) ->
            $($.user_search_box.settings.del_id).fadeIn 50
            $($.user_search_box.settings.dom_id).html data.responseText
            if !$($.user_search_box.settings.dom_id).is(':empty')
              $($.user_search_box.settings.dom_id).fadeIn 100
            $.user_search_box.stop()

         false
      else
        $.user_search_box.kill()

  $.fn.user_search_box = (config) ->
    settings = $.extend(true, $.user_search_box.settings, config or {})
    $(document).trigger 'init.user_search_box'
    $.user_search_box.idle()
    @each ->
      $input = $(this)
      $input.keyup ->
        if $input.val() != @previousValue
          if /\S/.test($input.val().trim()) and $input.val().trim().length > $.user_search_box.settings.minChars
            $.user_search_box.start()
            $.user_search_box.process $input.val()
          else
            $.user_search_box.kill()
          @previousValue = $input.val()
) jQuery
