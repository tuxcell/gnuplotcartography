# Please intall gnuplot before running this demo
# gnuplot homepage:
# http://http://www.gnuplot.info/
#
# from the prompt, run the demo:
# gnuplot demo1.gnu

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

load "projections.gnu"

print "Map from gnuplot examples"
#set terminal png;set output "map.png"
unset key
unset xtics
unset ytics
set xrange[-179:179]
set yrange[-89:89]
plot "world.dat" w l lc rgb "black"
pause -1  "Hit return to continue"

print "Map from R package maps"
#set terminal png;set output "worldRmap.png"
unset key
unset xtics
unset ytics
set xrange[-179:179]
set yrange[-89:89]
plot "worldRmap.dat" w l lc rgb "black"
pause -1  "Hit return to continue"

print "Map from NOAA coastline"
#set terminal png;set output "worldNOAACmap.png"
unset key
unset xtics
unset ytics
set xrange[-179:179]
set yrange[-89:89]
plot "NOAACoastline.dat" w l lc rgb "black"
pause -1  "Hit return to continue"

print "Map from natural-earth-vector"
#set terminal png;set output "worldNEmap.png"
unset key
unset xtics
unset ytics
set xrange[-179:179]
set yrange[-89:89]
plot "ne_110m_coastline.dat" w l lc rgb "black"
pause -1  "Hit return to continue"

print "\"squarish\" map"
#set terminal png;set output "worldNEmap.png"
unset key
unset xtics
unset ytics
set xrange[-179:179]
set yrange[-89:89]
plot "earth_dayWATER2deg.dat" w l lc rgb "black"
pause -1  "Hit return to continue"


load "projections.gnu"
p=MercatorInit(0)
set title p offset 0,-2
set size ratio -1
plot "ne_110m_coastline.dat" using (MercatorYC($2,$1)):(MercatorXC($2,$1)) notit w l ls 1, \
"worldmer15.dat" using (MercatorYC($2,$1)):(MercatorXC($2,$1)) notit w l ls 2, \
"worldpar15.dat" using (MercatorYC($2,$1)):(MercatorXC($2,$1)) notit w l ls 3, \
"tissot.dat" using (MercatorYC($2,$1)):(MercatorXC($2,$1)) notit w l ls 5
pause -1  "Hit return to continue"

p=OrtographicInit(0,0,90,90)
set title p
set size ratio -1
plot "ne_110m_coastline.dat" using (OrtographicYC($2,$1)):(OrtographicXC($2,$1)) notit w l ls 1, \
"worldmer15.dat" using (OrtographicYC($2,$1)):(OrtographicXC($2,$1)) notit w l ls 2, \
"worldpar15.dat" using (OrtographicYC($2,$1)):(OrtographicXC($2,$1)) notit w l ls 3, \
"tissot.dat" using (OrtographicYC($2,$1)):(OrtographicXC($2,$1)) notit w l ls 5
pause -1  "Hit return to continue"

p=EstereoAzimutalInit(0,0)
set title p
set size ratio -1
plot "ne_110m_coastline.dat" using (EstereoAzimutalYC($2,$1)):(EstereoAzimutalXC($2,$1)) notit w l ls 1, \
"worldmer15.dat" using (EstereoAzimutalYC($2,$1)):(EstereoAzimutalXC($2,$1)) notit w l ls 2, \
"worldpar15.dat" using (EstereoAzimutalYC($2,$1)):(EstereoAzimutalXC($2,$1)) notit w l ls 3, \
"tissot.dat" using (EstereoAzimutalYC($2,$1)):(EstereoAzimutalXC($2,$1)) notit w l ls 5
pause -1  "Hit return to continue"

p=PlateCarreeInit(0)
set title p
set size ratio -1
plot "ne_110m_coastline.dat" using (PlateCarreeYC($2,$1)):(PlateCarreeXC($2,$1)) notit w l ls 1, \
"worldmer15.dat" using (PlateCarreeYC($2,$1)):(PlateCarreeXC($2,$1)) notit w l ls 2, \
"worldpar15.dat" using (PlateCarreeYC($2,$1)):(PlateCarreeXC($2,$1)) notit w l ls 3, \
"tissot.dat" using (PlateCarreeYC($2,$1)):(PlateCarreeXC($2,$1)) notit w l ls 5
pause -1  "Hit return to continue"

p=LambertInit(0)
set title p
set size ratio -1
plot "ne_110m_coastline.dat" using (LambertYC($2,$1)):(LambertXC($2,$1)) notit w l ls 1, \
"worldmer15.dat" using (LambertYC($2,$1)):(LambertXC($2,$1)) notit w l ls 2, \
"worldpar15.dat" using (LambertYC($2,$1)):(LambertXC($2,$1)) notit w l ls 3, \
"tissot.dat" using (LambertYC($2,$1)):(LambertXC($2,$1)) notit w l ls 5
pause -1  "Hit return to continue"

p=SansonFlamsteedInit(0)
set title p
set size ratio -1
plot "ne_110m_coastline.dat" using (SansonFlamsteedYC($2,$1)):(SansonFlamsteedXC($2,$1)) notit w l ls 1, \
"worldmer15.dat" using (SansonFlamsteedYC($2,$1)):(SansonFlamsteedXC($2,$1)) notit w l ls 2, \
"worldpar15.dat" using (SansonFlamsteedYC($2,$1)):(SansonFlamsteedXC($2,$1)) notit w l ls 3, \
"tissot.dat" using (SansonFlamsteedYC($2,$1)):(SansonFlamsteedXC($2,$1)) notit w l ls 5
pause -1  "Hit return to continue"

p=AlbersConicalInit(-20,0)
set title p
set size ratio -1
plot "ne_110m_coastline.dat" using (AlbersConicalYC($2,$1)):(AlbersConicalXC($2,$1)) notit w l ls 1, \
"worldmer15.dat" using (AlbersConicalYC($2,$1)):(AlbersConicalXC($2,$1)) notit w l ls 2, \
"worldpar15.dat" using (AlbersConicalYC($2,$1)):(AlbersConicalXC($2,$1)) notit w l ls 3, \
"tissot.dat" using (AlbersConicalYC($2,$1)):(AlbersConicalXC($2,$1)) notit w l ls 5
pause -1  "Hit return to continue"

p=EckertIInit(12)
set title p
set size ratio -1
plot "ne_110m_coastline.dat" using (EckertIYC($2,$1)):(EckertIXC($2,$1)) notit w l ls 1, \
"worldmer15.dat" using (EckertIYC($2,$1)):(EckertIXC($2,$1)) notit w l ls 2, \
"worldpar15.dat" using (EckertIYC($2,$1)):(EckertIXC($2,$1)) notit w l ls 3, \
"tissot.dat" using (EckertIYC($2,$1)):(EckertIXC($2,$1)) notit w l ls 5
pause -1  "Hit return to continue"

p=HammerWagnerInit(12)
set title p
set size ratio -1
plot "ne_110m_coastline.dat" using (HammerWagnerYC($2,$1)):(HammerWagnerXC($2,$1)) notit w l ls 1, \
"worldmer15.dat" using (HammerWagnerYC($2,$1)):(HammerWagnerXC($2,$1)) notit w l ls 2, \
"worldpar15.dat" using (HammerWagnerYC($2,$1)):(HammerWagnerXC($2,$1)) notit w l ls 3, \
"tissot.dat" using (HammerWagnerYC($2,$1)):(HammerWagnerXC($2,$1)) notit w l ls 5
pause -1  "Hit return to continue"

p=WernersEquivalentInit(0,300)
set title p
set size ratio -1
set xrange [-w: w]
set yrange [-h-600: h]
ap=7
plot "ne_110m_coastline.dat" using (WernersEquivalentYC($2,$1)):(WernersEquivalentXC($2,$1)) notit w l ls 1, \
"worldmer15.dat" using (WernersEquivalentYC($2,$1)):(WernersEquivalentXC($2,$1)) notit w l ls 2, \
"worldpar15.dat" using (WernersEquivalentYC($2,$1)):(WernersEquivalentXC($2,$1)) notit w l ls 3, \
"tissot.dat" using (WernersEquivalentYC($2,$1)):(WernersEquivalentXC($2,$1)) notit w l ls 5
pause -1  "Hit return to continue"

load "projections.gnu"
p=NaturalEarthInit(15)
set title p
set size ratio -1
plot "ne_110m_coastline.dat" using (NaturalEarthYC($2,$1)):(NaturalEarthXC($2,$1)) notit w l ls 1, \
"worldmer15.dat" using (NaturalEarthYC($2,$1)):(NaturalEarthXC($2,$1)) notit w l ls 2, \
"worldpar15.dat" using (NaturalEarthYC($2,$1)):(NaturalEarthXC($2,$1)) notit w l ls 3, \
"tissot.dat" using (NaturalEarthYC($2,$1)):(NaturalEarthXC($2,$1)) notit w l ls 5
pause -1  "Hit return to continue"

p=AitoffInit(.2)
set title p
set size ratio -1
plot "ne_110m_coastline.dat" using (AitoffYC($2,$1)):(AitoffXC($2,$1)) notit w l ls 1, \
"worldmer15.dat" using (AitoffYC($2,$1)):(AitoffXC($2,$1)) notit w l ls 2, \
"worldpar15.dat" using (AitoffYC($2,$1)):(AitoffXC($2,$1)) notit w l ls 3, \
"tissot.dat" using (AitoffYC($2,$1)):(AitoffXC($2,$1)) notit w l ls 5
pause -1  "Hit return to continue"

p=WinkeltripelInit(.2)
set title p
set size ratio -1
plot "ne_110m_coastline.dat" using (WinkeltripelYC($2,$1)):(WinkeltripelXC($2,$1)) notit w l ls 1, \
"worldmer15.dat" using (WinkeltripelYC($2,$1)):(WinkeltripelXC($2,$1)) notit w l ls 2, \
"worldpar15.dat" using (WinkeltripelYC($2,$1)):(WinkeltripelXC($2,$1)) notit w l ls 3, \
"tissot.dat" using (WinkeltripelYC($2,$1)):(WinkeltripelXC($2,$1)) notit w l ls 5
pause -1  "Hit return to continue"

p=RobinsonInit(15)
set title p
set size ratio -1
plot "ne_110m_coastline.dat" using (RobinsonYC($2,$1)):(RobinsonXC($2,$1)) notit w l ls 1, \
"worldmer15.dat" using (RobinsonYC($2,$1)):(RobinsonXC($2,$1)) notit w l ls 2, \
"worldpar15.dat" using (RobinsonYC($2,$1)):(RobinsonXC($2,$1)) notit w l ls 3, \
"tissot.dat" using (RobinsonYC($2,$1)):(RobinsonXC($2,$1)) notit w l ls 5
pause -1  "Hit return to continue"



