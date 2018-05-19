$(function() {
 function buildHTML(prototype){
    html = `
            <div class='col-sm-4 col-md-3 proto-content'>
              <div class='thumbnail'>
                <a href="/prototypes/${prototype.id}"><img src="${prototype.image.url}" /></a>
              <div class='caption'>
                <h3>
                  ${prototype.title}
                </h3>
                <div class='proto-meta'>
                  <div class='proto-user'>
                    <a href="/users/${prototype.user.id}">${prototype.user}</a>
                  </div>
                  <div class='proto-posted'>
                    ${prototype.posted_date}
                  </div>
                </div>
              </div>
            </div>`
    return html;
  }

  $('.btn-popular').on('click', function(e){
    e.preventDefault();
    $.ajax({
      type: 'GET',
      url: '/prototypes/popular',
      dataType: 'json'
    })
    .done(function(data){
      $('#proto-list').empty();
      data.forEach(function(data){
        html = buildHTML(data);
        $('#proto-list').append(html);
      });

    })
    .fail(function(){
      alert('並び替えに失敗しました');
    })
  });


  $('.btn-newest').on('click', function(e){
    e.preventDefault();
    $.ajax({
      type: 'GET',
      url: '/prototypes/newest',
      dataType: 'json'
    })
    .done(function(data){
      $('#proto-list').empty();
      data.forEach(function(data){
        html = buildHTML(data);
        $('#proto-list').append(html);
      });
    })
    .fail(function(){
      alert('並び替えに失敗しました');
    })
  });
});
