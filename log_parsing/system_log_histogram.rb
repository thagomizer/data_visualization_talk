require 'pp'
require 'rubygems'
require 'json'

ARGV.each do |path|
  counts = Hash.new 0

  File.foreach path do |line|
    counts[$1] += 1 if line =~ /^\w{3} \d{2} [\d:]{8} \S+ (\S+)\[\d+\]/
  end

  counts = counts.sort_by { |k, v| -v }.first(10)

  puts <<-"EOM"
  <html>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <script src="http://code.highcharts.com/highcharts.js"></script>
  <script>
  $(function () {
    $('#my-chart').highcharts({
      chart: {
        type: 'column'
      },
      title: {
        text: "SysLog"
      },
      legend: {
        enabled: false
      },
      yAxis: {
        type: 'logarithmic',
        title: ''
      },
      xAxis: {
        categories: #{counts.map(&:first).to_json},
        labels: {
          style: {
            font: '16px Helvetica',
          },
          rotation: -45,
          align: 'right'
        }
      },
      series: [{
        data: #{counts.map(&:last).to_json}
      }]
    });
  });
  </script>

  <div id="my-chart"/>
  </html>
  EOM
end
