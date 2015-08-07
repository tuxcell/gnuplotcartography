# Please intall gnuplot before running this demo
# gnuplot homepage:
# http://http://www.gnuplot.info/
#
# from the prompt, run the demo:
# gnuplot demo.gnu

# note: hit the return key to see the next map, hit return when the prompt is active, not the graphics window!

# files included in this demo:
# demo.gnu			this file
# earth_dayWATER2deg.dat	"squarish" map of the world 2 deg. resolution
# earth_dayWATER2degS.dat	"squarish" map of the world 2 deg. resolution - for splot
# ne_110m_coastline.dat		map of the world from natural-earth-vector
# NewZealand.dat		map of New Zealand from R package maps
# NOAACoastline.dat		map of the world from NOAA coastline
# worldRmap.dat			map of the world from R package maps
# projections.gnu		gnuplot library for projections
# tissot.dat			Tissot's indicatrices
# world.dat			map of the world from the gnuplot examples
# worldmer15.dat		meridian lines 15 deg.
# worldmer20.dat		meridian lines 20 deg.
# worldmer.dat			meridian lines 10 deg.
# worldpar15.dat		parallel lines 15 deg.
# worldpar20.dat		parallel lines 20 deg.
# worldpar.dat			parallel lines 10 deg.
# worldmerS15.dat		meridian lines 15 deg. - for splot
# worldmerS20.dat		meridian lines 20 deg. - for splot
# worldparS15.dat		parallel lines 15 deg. - for splot
# worldparS20.dat		parallel lines 20 deg. - for splot

print "2D map"
#set term pngcairo;set output "GHCN1.png"
unset key
unset xtics
unset ytics
set size ratio -1
set cbrange [-4.3:8.1]
set xrange[-179:179]
set yrange[-89:89]
set title "November 2012 L-OTI(C) anomaly vs 1951-1980"
set palette defined ( -4.3 "#7f00ff", -4 "#7f00ff", -4 "#4094ff", -2 "#4094ff", -2 "#78ccff", -1 "#78ccff", -1 "#98ecfd", -.5 "#98ecfd", -.5 "#d8fdd8",  -.2 "#d8fdd8", -.2 "#fdfdfd", .2 "#fdfdfd", .2 "#fdfd4b", .5 "#fdfd4b", .5 "#fdcb00", 1 "#fdcb00", 1 "#fd7e00", 2 "#fd7e00", 2 "#fd0000", 4 "#fd0000", 4 "#7e0000", 8.1 "#7e0000", 8.2 "#9d9d9d")
set format "%g"
plot "GHCN_GISS_HR2SST_1200km_Anom11_2012_2012_1951_1980.txt" every ::2 u (int($3)):(int($4)):(($5>8 & $5<9999)?8:$5) w image, "worldRmap.dat" u 1:2 w l lc rgb "black" notit
pause -1  "Hit return to continue"

print "NASA’s polar map"
reset
set angles degrees
unset colorbox
unset border
unset xtics
unset ytics
unset ztics
set parametric
set mapping spherical
set yzeroaxis linetype 0 linewidth 1.000 
set urange [ -90.0000 : 90.0000 ] noreverse nowriteback
set vrange [ 0.00000 : 360.000 ] noreverse nowriteback
set hidden3d front offset 0 trianglepattern 3 undefined 1 altdiagonal bentover
set view equal xyz
set view 80,270,1,1
set palette defined ( -4.3 "#7f00ff", -4 "#7f00ff", -4 "#4094ff", -2 "#4094ff", -2 "#78ccff", -1 "#78ccff", -1 "#98ecfd", -.5 "#98ecfd", -.5 "#d8fdd8",  -.2 "#d8fdd8", -.2 "#fdfdfd", .2 "#fdfdfd", .2 "#fdfd4b", .5 "#fdfd4b", .5 "#fdcb00", 1 "#fdcb00", 1 "#fd7e00", 2 "#fd7e00", 2 "#fd0000", 4 "#fd0000", 4 "#7e0000", 8.1 "#7e0000", 8.2 "#9d9d9d")
set format "%g"
set cbrange [-4.3:8.1]
set isosamples 9
set pm3d corners2color c1
set multiplot layout 1,2
set view 1,1,2,2 #Northern hemisphere
splot "GHCN_GISS_HR2SST_1200km_Anom11_2012_2012_1951_1980matrixndx.dat" u ($2):(1+$1):(1):(($3>8 & $3<9999)?8:$3) w pm3d notit , cos(u)*cos(v),cos(u)*sin(v),sin(u) w l lc rgb "grey" notit,"worldRmap.dat" u 1:2:(1) w l lc rgb "black" notit
set view 183,180,2,2 #Southern hemisphere
splot "GHCN_GISS_HR2SST_1200km_Anom11_2012_2012_1951_1980matrixndx.dat" u ($2):(1+$1):(1):(($3>8 & $3<9999)?8:$3) w pm3d notit , cos(u)*cos(v),cos(u)*sin(v),sin(u) w l lc rgb "grey" notit,"worldRmap.dat" u 1:2:(1) w l lc rgb "black" notit
unset multiplot
pause -1  "Hit return to continue"

reset
print "2D map squarish with smoothing"
unset xtics
unset ytics
unset ztics
set size ratio -1
set view map
set yzeroaxis linetype 0 linewidth 1.000 
set urange [ -90.0000 : 90.0000 ] noreverse nowriteback
set vrange [ -180.0000 : 180.0000 ] noreverse nowriteback
set palette defined ( -4.3 "#7f00ff", -4 "#7f00ff", -4 "#4094ff", -2 "#4094ff", -2 "#78ccff", -1 "#78ccff", -1 "#98ecfd", -.5 "#98ecfd", -.5 "#d8fdd8",  -.2 "#d8fdd8", -.2 "#fdfdfd", .2 "#fdfdfd", .2 "#fdfd4b", .5 "#fdfd4b", .5 "#fdcb00", 1 "#fdcb00", 1 "#fd7e00", 2 "#fd7e00", 2 "#fd0000", 4 "#fd0000", 4 "#7e0000", 8.1 "#7e0000", 8.2 "#9d9d9d")
set format "%g"
set cbrange [-4.3:8.1]
set isosamples 9
set pm3d interpolate 0,10
splot  "GHCN_GISS_HR2SST_1200km_Anom11_2012_2012_1951_1980matrixndx.dat" u ($2+1):($1+1):(0):(($3>8 & $3<9999)?8:$3) w pm3d notit,\
"earth_dayWATER2degS.dat" u 1:2:(0)  w l lw 0.5 lc rgb "black" notit
pause -1  "Hit return to continue"

reset
print "2D map squarish"
unset key
unset xtics
unset ytics
set size ratio -1
set cbrange [-4.3:8.1]
set xrange[-179:179]
set yrange[-89:89]
set palette defined ( -4.3 "#7f00ff", -4 "#7f00ff", -4 "#4094ff", -2 "#4094ff", -2 "#78ccff", -1 "#78ccff", -1 "#98ecfd", -.5 "#98ecfd", -.5 "#d8fdd8",  -.2 "#d8fdd8", -.2 "#fdfdfd", .2 "#fdfdfd", .2 "#fdfd4b", .5 "#fdfd4b", .5 "#fdcb00", 1 "#fdcb00", 1 "#fd7e00", 2 "#fd7e00", 2 "#fd0000", 4 "#fd0000", 4 "#7e0000", 8.1 "#7e0000", 8.2 "#9d9d9d")
set format "%g"
plot "GHCN_GISS_HR2SST_1200km_Anom11_2012_2012_1951_1980.txt" every ::2 u (int($3)):(int($4)):(($5>8 & $5<9999)?8:$5) w image,"earth_dayWATER2deg.dat" w l lw 0.5 lc rgb "black" notit
pause -1  "Hit return to continue"

reset
print "use a palette in a file"
unset key
unset xtics
unset ytics
set size ratio -1
set cbrange [-4.3:8.1]
set xrange[-179:179]
set yrange[-89:89]
set palette file "anomaly.pal"
set format "%g"
plot "GHCN_GISS_HR2SST_1200km_Anom11_2012_2012_1951_1980.txt" every ::2 u 3:4:(($5>999)?0:$5) w image,"earth_dayWATER2deg.dat" w l lw 0.5 lc rgb "black" notit,\
"GHCN_GISS_HR2SST_1200km_Anom11_2012_2012_1951_1980matrixndx.dat" every ::2 u 3:4:(.62):(.62):(.62):(($5<999)?0:150) w rgba notit
pause -1  "Hit return to continue"

reset
print "Winkel tripel projection"
load "projections.gnu"
set size ratio -1
p=WinkeltripelInit(1)
set title "Temperature anomalies December 2012\\n1981-2010 base period"
set cbrange [-4.3:8.1]
set xrange[-179:179]
set yrange[-89:89]
set pm3d map
splot "GHCN_GISS_HR2SST_1200km_Anom11_2012_2012_1951_1980matrixndx.dat" using (WinkeltripelYC($1,$2)):(WinkeltripelXC($1,$2)):(($2>167 | $2<-167 | $1>85 | $1<-75 )?0/0:1)  w p pt 7 ps 1 lc rgb "grey" notit
set palette model RGB file "anomaly.pal" u 1:2:3
set format "%g"
replot "GHCN_GISS_HR2SST_1200km_Anom11_2012_2012_1951_1980matrixndx.dat" using (WinkeltripelYC($1,$2)):(WinkeltripelXC($1,$2)):(1):(($3<9999)?$3:0/0) w pm3d notit ,"earth_dayWATER2degS.dat" using (WinkeltripelYC($2,$1)):(WinkeltripelXC($2,$1)):(1) w l lw 0.5 lc rgb "black" notit
#set term pngcairo;set output "GHCN7.png";replot
pause -1  "Hit return to continue"

reset
print "Robinson projection"
load "projections.gnu"
set size ratio -1
p=RobinsonInit(60)
set title "Temperature anomalies December 2012\\n1981-2010 base period"
set cbrange [-4.3:8.1]
set xrange[-179:179]
set yrange[-89:89]
set pm3d map
splot "GHCN_GISS_HR2SST_1200km_Anom11_2012_2012_1951_1980matrixndx.dat" using (RobinsonYC($1,$2)):(RobinsonXC($1,$2)):(($2>170 | $2<-170 | $1>85 | $1<-84 )?0/0:1)  w p pt 7 ps 1 lc rgb "grey" notit
set palette model RGB file "anomaly.pal" u 1:2:3
set format "%g"
replot "GHCN_GISS_HR2SST_1200km_Anom11_2012_2012_1951_1980matrixndx.dat" using (RobinsonYC($1,$2)):(RobinsonXC($1,$2)):(1):(($3<9999)?$3:0/0) w pm3d notit ,"earth_dayWATER2degS.dat" using (RobinsonYC($2,$1)):(RobinsonXC($2,$1)):(1) w l lw 0.5 lc rgb "black" notit
#set term pngcairo;set output "GHCN7.png";replot
pause -1  "Hit return to continue"
