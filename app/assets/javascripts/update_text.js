$(document).ready(function(){

alert("Press A to swipe left, and D to swipe right")

$('.fadein').hide();
$('.fadein').fadeIn(400);

$("#btn_rs").hide();


document.onkeypress=function(e){

    if(e.keyCode == 97){
      event.preventDefault();
      $.ajax({
        url: '/random_swipe/update_text',
        type:'GET',
        dataType:'JSON',
        error: function (xhr, ajaxOptions, thrownError) {
             //alert(xhr.responseText);
             alert("Oops! Something went wrong! Please try again.")
         },

        success: function(data){

          d = data
          name = d[0]
          price = d[1]
          type = d[2]
          dist = d[3]
          url = d[5]

          console.log(url)


          $('.fadein').hide();
          $('#rest_name').text(name)
          $('#type').text(type)
          $('#pricing').text("Pricing: " + price)
          $('#dist').text("Distance: " + dist + " Miles")
          $("#img").attr('src', url);
          document.getElementById('img').height = 267;
          document.getElementById('img').width = 400;
          $('.fadein').fadeIn(600);
        }
      })
    }

    if(e.keyCode == 100){
      $("#btn_rs").click();
    }
}


$('#new').click(function(){

  event.preventDefault();
  $.ajax({
    url: '/random_swipe/update_text',
    type:'GET',
    dataType:'JSON',
    error: function (xhr, ajaxOptions, thrownError) {
         //alert(xhr.responseText);
         alert("Oops! Something went wrong! Please try again.")
     },

    success: function(data){




      d = data
      name = d[0]
      price = d[1]
      type = d[2]
      dist = d[3]
      url = d[5]

      console.log(url)


      $('.fadein').hide();
      $('#rest_name').text(name)
      $('#type').text(type)
      $('#pricing').text("Pricing: " + price)
      $('#dist').text("Distance: " + dist + " Miles")
      $("#img").attr('src', url);
      document.getElementById('img').height = 267;
      document.getElementById('img').width = 400;
      $('.fadein').fadeIn(600);
    }
  })

})
})





















/*
  $('#change_name').click(function(){
    event.preventDefault();

    function get_index(){
      $.ajax({
        url: '/random_swipe/get_index',
        error: function (xhr, ajaxOptions, thrownError) {
             alert(xhr.responseText);
         },

        success: function(data){
          return data
        }
      })
    }

    get_index()
    rest_index = gon.rest_index
    alert(gon.rest_index)
    alert(rest_index)


    $('#rest_name').text(gon.vl.groups[0].items[rest_index].venue.name)





    dist = $.ajax({
      url: '/random_swipe/find_distance',
      error: function (xhr, ajaxOptions, thrownError) {
           alert(xhr.responseText);
       },

      success: function(){
        console.log("Successful Ajax Pull")

      }
    })


})
*/
