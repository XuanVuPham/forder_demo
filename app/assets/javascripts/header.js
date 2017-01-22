$(document).on("ready page:load", $(function () {
  $('.dropdown-toggle').dropdown();
  $('#live-search-form').searchbox({
    url: '/search/',
    param: 'search',
    dom_id: '#livesearch',
    loading_css: '#livesearch_loading'
  });
}));

$(document).ready(function(){
  $('.languages li').click(function(e) {
    window.location = '/set_language/update?locale=' + $(this).attr('data-lang');
  });
});
