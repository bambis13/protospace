 $(function(){

  $('.main_image_file').change(function() {
    var fr = new FileReader();
    fr.onload = function() {
      var img = $('<img>').attr('src', fr.result);
      $('#main_image_uploader').css('background', 'none');
      $('#main_image_uploader').append(img);
    };
    fr.readAsDataURL(this.files[0]);
  });

   $('.sub_image_file').change(function() {
    var fr = new FileReader();
    fr.onload = function() {
      var img = $('<img>').attr('src', fr.result);
      $('').append(img);
    };
    fr.readAsDataURL(this.files[0]);
  }); 
});


