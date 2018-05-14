$(function(){
  var $heart = $("#like-button img");
  $("#like-button").on("click", function(e){
    e.preventDefault();
    var $likeSum = $("#like-sum")
    console.log(this)
    like_function(data-id, $(this), $heart, $likeSum)
    console.log(1)
  });

  function like_function(id, button, heart, sum) {
    if (button.hasClass("decrement")){
        $.ajax({
          url: "/likes/" + id,
          type: "delete",
          data: {prototype_id: id, dataType: "json"}
        })
        .done(function(data){
        button.removeClass("decrement").addClass("increment")
        heart.attr("src", "/assets/icon_heart.svg")
        sum.text(data["count"])
        })
      }else{
        $.ajax({
          url: "/likes",
          type: "post",
          data: {prototype_id: id, dataType: "json"}
        })
        .done(function(data){
        button.removeClass("increment").addClass("decrement")
        heart.attr("src", "/assets/icon_heart_red.svg")
        sum.text(data["count"])
        })
      }
  }
})
//
