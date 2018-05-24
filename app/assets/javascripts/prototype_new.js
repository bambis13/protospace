 $(function(){

  $('.main_image_file').change(function() {
    var fr = new FileReader();
    var main = $('#main_image_uploader img');
    fr.onload = function() {
      $(main).empty();
      $(main).parent().css('background', 'none');
      $(main).attr('src', fr.result);
    };
    fr.readAsDataURL(this.files[0]);
  });

   $('.sub_image_file').change(function() {
    var fr = new FileReader();
    var sub = $(this).parent();
    fr.onload = function() {
      $(sub).children('img').empty();
      $(sub).css('background', 'none');
      $(sub).children('img').attr('src', fr.result);
    };
    fr.readAsDataURL(this.files[0]);
  }); 
});



