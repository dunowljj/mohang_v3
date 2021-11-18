//첫번재 그래프 
google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Expenses', 'Profit'],//하나씩 추가하면 그래프 생성됨. 
          ['2014', 400, 200],
          ['2015',  460, 250],
          ['2016', 1120, 300],
          ['2017', 540, 350]
        ]);

        var options = {
          chart: {
            title: 'Company Performance',
            subtitle: 'Sales, Expenses, and Profit: 2014-2017',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
//첫번째 그래프 완료