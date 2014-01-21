google.load('visualization','1', {packages: ['corechart']});

var 
  chart = null,
  blank_table = null,
  data_table = null;

function getChartData(appId) { 
  jQuery.get(
          "/apps/" + appId + "/votes/",
          function(data, textStatus, jqXHR) { 
            console.log(data);
            drawChart(data);
          },
          "json"
        );
}

function drawChart(data) {
  if (blank_table == null) { 
    blank_table = new google.visualization.DataTable(data.blank_data);
  }
  if (data_table == null) {
    data_table = new google.visualization.DataTable(data.live_data);
  } else {
    data_table.removeRows(0, data_table.getNumberOfRows());
    data_table = new google.visualization.DataTable(data.live_data);
  }
  
  var options = {
    width: 200, 
    height: 150, 
    pointSize: 5,
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
    }, 
    animation: {
      duration: 400, 
      easing: "out" 
    }
  };
  if (chart==null) { 
    chart = new google.visualization.ScatterChart(document.getElementById('vote_chart')); 
    chart.draw(blank_table, options);
    setInterval(function(){chart.draw(data_table, options)}, 300);
  } else { 
    console.debug("chart is not null");
  }
  
};