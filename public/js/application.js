

// $(".game_deck_board").on('click','a',function(e){
//   e.preventDefault();
//   $.ajax({
//     url: '/deck/1',
//     type: 'get'}).done(function(data) {
//       $(this).append(data);
//     });
// });

// $(document).on('submit', '.create-card', function(e){
//   e.preventDefault();
//   console.log($(this).serialize());
//   $.ajax({
//       type: "POST",
//       url: "/card/new",
//       data: $(".newcard").serialize()
//     }).done(function(data){
//       alert(data);
//     });
//     return false;
//   });


$(document).ready(function() {
  $('#answer').hide();
  $('#show-answer-button').on('click', function(){
    $('#answer').show();
  });

  // $(".create-card").on('click', function(e){
  //   alert(e);
  //   e.preventDefault();
  //   $.ajax({
  //     type: "POST",
  //     url: "/card/new",
  //     data: $("form").serialize()
  //   }).done(function(data){
  //     alert(data);
  //   });
  //   return false;
  // });

  // $(".page-header").on('click', "#add-card", function(e){
  //   e.preventDefault();

  //   $.ajax({
  //     url:("/card/1/new")
  //   }).done(function (data){
  //     $('#test').append(data)
  //   })
  //   return false;

  // });

  $(".game_deck_board").magnificPopup({
    delegate: 'a',
    type: 'ajax'
  });





  if (typeof $('#data').attr('value') === 'undefined')
  {
  } else
  {
    var example = jQuery.parseJSON($('#data').attr('value'));
    Morris.Donut({
      element: 'donut-example',
      data: [
      {label: "Correct", value: $('#correct').text()},
      {label: "Incorrect", value: $('#incorrect').text()}],
      colors: ["#6dc066","red"]
    });
    Morris.Bar({
      element: 'line-example',
      data: example,
      xkey: 'attempts',
      ykeys: ['time'],
      labels: ['time'],
      postUnits: ' sec'});
  }




  if (typeof $('#percentage_data').attr('value') === 'undefined')
  {}
else
{
  var percentage_data = jQuery.parseJSON($('#percentage_data').attr('value'));
  Morris.Bar({

    element: 'bar-example',
    data: percentage_data,
    xkey: 'game_id',
    ykeys: ['percentage'],
    labels: ['time'],
    postUnits: ' %'
  });
}



});
