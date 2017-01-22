$(document).ready(function() {
  $(".upload_img").change(function(){
    load_img(this, "avatar");
  });
  function load_img(input, klass) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.' + klass).attr('src', e.target.result);}
    reader.readAsDataURL(input.files[0]);
    }
  }
  $(".upload_img_cover").change(function(){
    load_img(this, "avatar_cover");
  });

  $(".change-picture").change(function(){
    load_img(this, "avatar");
  });
});
