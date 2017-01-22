(($) ->
  $.searchbox = {}
  $.extend true, $.searchbox,
    settings:
      url: 'search'
      param: 'search'
      dom_id: '#livesearch'
      minChars: 2
      loading_css: '#livesearch_loading'
      del_id: '#livesearch_del'
    loading: ->
      $($.searchbox.settings.loading_css).show()

    idle: ->
      $($.searchbox.settings.loading_css).hide()

    start: ->
      $.searchbox.loading()
      $(document).trigger 'before.searchbox'

    stop: ->
      $.searchbox.idle()
      $(document).trigger 'after.searchbox'

    kill: ->
      $($.searchbox.settings.dom_id).fadeOut 50
      $($.searchbox.settings.dom_id).html ''
      $($.searchbox.settings.del_id).fadeOut 100

    reset: ->
      $($.searchbox.settings.dom_id).html ''
      $($.searchbox.settings.dom_id).fadeOut 50
      $('#SearchSearch').val ''
      $($.searchbox.settings.del_id).fadeOut 100

    process: (terms) ->
      if /\S/.test(terms)
        $.ajax
          type: 'GET'
          url: $.searchbox.settings.url
          data: search: terms.trim()
          dataType: 'text'
          complete: (data) ->
            $($.searchbox.settings.del_id).fadeIn 50
            $($.searchbox.settings.dom_id).html data.responseText
            if !$($.searchbox.settings.dom_id).is(':empty')
              $($.searchbox.settings.dom_id).fadeIn 100
            $.searchbox.stop()

         false
      else
        $.searchbox.kill()

  $.fn.searchbox = (config) ->
    settings = $.extend(true, $.searchbox.settings, config or {})
    $(document).trigger 'init.searchbox'
    $.searchbox.idle()
    @each ->
      $input = $(this)
      $input.keyup ->
        if $input.val() != @previousValue
          if /\S/.test($input.val().trim()) and $input.val().trim().length > $.searchbox.settings.minChars
            $.searchbox.start()
            $.searchbox.process $input.val()
          else
            $.searchbox.kill()
          @previousValue = $input.val()
) jQuery
