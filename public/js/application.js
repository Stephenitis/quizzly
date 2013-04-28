$(document).ready(function() {
  $('#answer').hide();
  $('#show-answer-button').on('click', function(){
    $('#answer').show();
  });

  Morris.Donut({
    element: 'donut-example',
    data: [
    {label: "Correct", value: $('#correct').text()},
    {label: "Incorrect", value: $('#incorrect').text()}
    ],
    colors: ["#6dc066","red"]
  });


  var example = jQuery.parseJSON($('#data').attr('value'));
  Morris.Bar({
    element: 'line-example',
    data: example,
    xkey: 'attempts',
    ykeys: ['time'],
    labels: ['time'],
    postUnits: ' sec'

  });







});

