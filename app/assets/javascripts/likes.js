$(function(){
  var heart = $("#like-button img");
  $("#like-button").on("click", function(e){
    e.preventDefault();
    $(this).prop('disabled', true )
    var likeSum = $("#like-sum")
    var likeId = $(this).data('id')
    var protoId = location.pathname.split('/')[2];
    like_function(protoId, likeId, $(this), heart, likeSum)
  });

  function like_function(protoId, likeId, button, heart, sum) {
    if (button.hasClass("decrement")){
        $.ajax({
          url: "/prototypes/" + protoId + "/likes/" + likeId,
          type: "delete",
          data: {prototype_id: protoId},
          dataType: "json"
        })
        .done(function(data){
          var likeCount = data.likes_count - 1
          button.removeClass("decrement").addClass("increment")
          heart.attr("src", "/assets/icon_heart.svg")
          sum.text(likeCount)
          $("#like-button").prop('disabled', false)
        })
        .fail(function(){
          alert('error!')
        })
      }else{
        $.ajax({
          url: "/prototypes/" + protoId+ "/likes",
          type: "post",
          data: {prototype_id: protoId},
          dataType: "json"
        })
        .done(function(data){
          var likeCount = data.likes_count + 1
          button.removeClass("increment").addClass("decrement").data('id', data.id)
          heart.attr("src", "/assets/heartbeat.svg")
          sum.text(likeCount)
          $("#like-button").prop('disabled', false)
        })
        .fail(function(data){
          alert('error!')
        })
      }
  }
})
//
