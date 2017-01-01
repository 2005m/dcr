library(dcr)
data("morley")
mydcr <- dcr(morley)

pieChart <- dcrchart(type = "pieChart", id = "chart1", dimension = "Expt",
                    reduce = reduceCount(), width = 300, height = 300
                   )

barChart <- dcrchart(type="barChart", id="chart2", dimension = "Speed",
                    reduce = reduceCount(), width=300,height=300)

seriesChart <- dcrchart(type="seriesChart",id="chart3",dimension=c("Expt","Run"),
                   chart=dc_code("function(c){return dc.lineChart(c).interpolate('basis');}"),
                   reduce=reduceSum("Speed"),width=768,height=480,
                   seriesAccessor=dc_code("function(d){return 'Expt: ' + d.key[0];}"),
                   keyAccessor=dc_code("function(d) {return +d.key[1];}"),
                   valueAccessor=dc_code("function(d) {return +d.value - 500;}"),
                   legend=dc_code("dc.legend().x(350).y(350).itemHeight(13).gap(5).horizontal(1).legendWidth(140).itemWidth(70)")
                  )
obj <- mydcr + pieChart + barChart + seriesChart
obj

