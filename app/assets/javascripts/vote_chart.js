google.load('visualization','1', {packages: ['corechart']});

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
  var blank_table = new google.visualization.DataTable(data.blank_data);


  var data_table = new google.visualization.DataTable(data.live_data);
  
  var options = {
    width: 200, 
    height: 150, 
    // title: "Simplicity vs. Difficulty", 
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
      title: "Difficulty", 
      minValue: 0, 
      maxValue: 100,
      textPosition: "none"
    },
    vAxis: {
      title: "Quality", 
      minValue: 0, 
      maxValue: 100,
      textPosition: "none"
    }, 
    animation: {
      duration: 400, 
      easing: "out" 
    }
  };
  var chart = new google.visualization.ScatterChart(document.getElementById('vote_chart'));
  chart.draw(blank_table, options);
  setInterval(function(){chart.draw(data_table, options)}, 300);
};