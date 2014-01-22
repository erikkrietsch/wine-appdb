google.load('visualization','1', {packages: ['corechart']});

var 
  chart = null,
  blankData = [],
  chartData = [];

var options = {
  width: 200, 
  height: 150, 
  pointSize: 3,
  legend: "none",
  series: [{
    dataOpacity: 1.0,
    color: "#A50D0D"
  },{
    dataOpacity: 0.7,
    color: "#3366CC"
  },{
    dataOpacity: 0.3,
    color: "#3366CC"
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

function getChartData(appId) { 
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
    chart = new google.visualization.ScatterChart(document.getElementById('vote_chart')); 
  }
  chart.draw(chartData.last(), options);
  
};