$(document).on('ready page:load', $(function(){
  $('.dropdown-toggle').dropdown();
  $url = $('#users_search_form').attr('action');
  $('#users-search-form').user_search_box({
    url: $('#users_search_form').attr('action'),
    param: 'search',
    dom_id: '#users_search_dom',
    loading_css: '#livesearch_loading'
  });
}));
