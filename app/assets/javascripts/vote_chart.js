google.load('visualization','1', {packages: ['corechart']});



var 
  chart = null,
  blankData = [],
  chartData = [];
  appId = -1;

var options = {
  width: 100, 
  height: 75, 
  pointSize: 3,
  legend: "none",
  chartArea: {left:0, top:0, width:"100%", height:"100%"},
  series: [{
    dataOpacity: 0.3,
    color: "#3366CC"
  },{
    dataOpacity: 0.7,
    color: "#3366CC"
  },{
    dataOpacity: 1.0,
    color: "#A50D0D"
  }], 
  hAxis: {
    // title: "Difficulty", 
    minValue: 0, 
    maxValue: 100,
    textPosition: "none"
  },
  vAxis: {
    // title: "Quality", 
    minValue: 0, 
    maxValue: 100,
    textPosition: "none"
  }
};

var ready = function() {
  fetchChartData();
  $('form#voteForm').bind('ajax:success', 
    function(evt, data, status, xhr){
      $alert = $('#votealert');
      $msg = $('div:first.message', $alert);
      $msg.text(data.message);
      $alert.show();

      fetchChartData();
      setInterval(function() { $alert.hide(); }, 3000);
    });
  $('#voteForm').ajaxError(function(xhr, status, error) {
    $('#votealert.message').text('Failed.');
  });

};

// $(document).on('page:load', function() { console.log("page:load fired"); ready(); } );
$(document).on('page:receive', function() {
  console.log('unloading chart...');
  // $(document).off('page:load');
  chart = null;
});

function fetchChartData() { 
  jQuery.ajax({
          url: "/apps/" + appId + "/votes/",
          type: "GET",
          dataType: "json",
          cached: false
        }).done(function(data, textStatus, jqXHR) { 
            console.log(data);
            drawChart(data);
          });
}

function drawChart(data) {
  blankData.push( new google.visualization.DataTable(data.blank_data) );
  chartData.push( new google.visualization.DataTable(data.live_data) );
  
  if (chart==null) { 
    chart = new google.visualization.ScatterChart(document.getElementById('vote-chart')); 
  }
  // console.log('drawing chart...')
  chart.draw(chartData.last(), options);
  blankData.pop();
  chartData.pop();
  chart = null;
  
};