$(function() {
  $('.btn-popular').on('click', function(e){
    e.preventDefault();

  });


  $('.btn-newest').on('click', function(e){
    e.preventDefault();
    $.ajax({
      type: 'GET',
      url: location.href,
      dataType: 'json'
    })
    .done(function(data){
      console.log(data);
    })
    .fail(function(){
      alert('並び替えに失敗しました');
    })
  });
});
