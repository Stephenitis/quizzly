



$(document).ready(function() {
  $('#answer').hide();
  $('#show-answer-button').on('click', function(){
    $('#answer').show();
  });



$(".game_deck_board").on('click','a',function(e){
  e.preventDefault();
  $('.appendafterthis').removeClass('.appendafterthis');
  ($(this)).addClass("appendafterthis");
  $.ajax({
    url: '/deck/1',
    type: 'get'}).done(function(data) {
      $('.appendafterthis').append(data);
    });
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
