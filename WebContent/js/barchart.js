			var chart2;
            

            var chartData2 = [
                {
                    "country": "기타",
                    "visits": 4025
                },
                {
                    "country": "China",
                    "visits": 1882
                },
                {
                    "country": "Japan",
                    "visits": 1809
                },
                {
                    "country": "Germany",
                    "visits": 1322
                },
                {
                    "country": "UK",
                    "visits": 1122
                },
                {
                    "country": "France",
                    "visits": 1114
                },
                {
                    "country": "India",
                    "visits": 984
                },
                {
                    "country": "Spain",
                    "visits": 711
                },
                {
                    "country": "Netherlands",
                    "visits": 665
                },
                {
                    "country": "Russia",
                    "visits": 580
                },
                {
                    "country": "South Korea",
                    "visits": 443
                },
                {
                    "country": "Canada",
                    "visits": 441
                },
                {
                    "country": "Brazil",
                    "visits": 395
                },
                {
                    "country": "Italy",
                    "visits": 386
                },
                {
                    "country": "Australia",
                    "visits": 384
                },
                {
                    "country": "Taiwan",
                    "visits": 338
                },
                {
                    "country": "Poland",
                    "visits": 328
                }
            ];


            AmCharts.ready(function () {
                // SERIAL CHART
                chart2 = new AmCharts.AmSerialChart();
                chart2.dataProvider = chartData2;
                chart2.categoryField = "country";
                chart2.startDuration = 1;

                // AXES
                // category
                var categoryAxis2 = chart2.categoryAxis;
                categoryAxis2.labelRotation = 90;
                categoryAxis2.gridPosition = "start";

                // value
                // in case you don't want to change default settings of value axis,
                // you don't need to create it, as one value axis is created automatically.

                // GRAPH
                var graph2 = new AmCharts.AmGraph();
                graph2.valueField = "visits";
                graph2.balloonText = "[[category]]: <b>[[value]]</b>";
                graph2.type = "column";
                graph2.lineAlpha = 0;
                graph2.fillAlphas = 0.8;
                chart2.addGraph(graph2);

                // CURSOR
                var chartCursor2 = new AmCharts.ChartCursor();
                chartCursor2.cursorAlpha = 0;
                chartCursor2.zoomable = false;
                chartCursor2.categoryBalloonEnabled = false;
                chart2.addChartCursor(chartCursor2);

                chart2.creditsPosition = "top-right";

                chart2.write("barchartdiv");
            });
            
            