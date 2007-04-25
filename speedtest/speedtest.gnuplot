#!/usr/bin/env gnuplot

set terminal pdf
set output 'speedtest.pdf'

### 1st Plot

set title "Speed Test Multiset - Insertion Only (16000-4096000 Items)"
set key top left
set logscale x
set xrange [10000:5000000]
set xlabel "Inserts"
set ylabel "Seconds"
set format x "%.0f"

plot "speed-insert.txt" using 1:2 title "std::multiset" with linespoints pointtype 2, \
     "speed-insert.txt" using 1:3 title "btree_multiset<4>" with linespoints pointtype 3,  \
     "speed-insert.txt" using 1:31 title "btree_multiset<32>" with linespoints pointtype 4,  \
     "speed-insert.txt" using 1:63 title "btree_multiset<64>" with linespoints pointtype 5, \
     "speed-insert.txt" using 1:129 title "btree_multiset<128>" with linespoints pointtype 6, \
     "speed-insert.txt" using 1:201 title "btree_multiset<200>" with linespoints pointtype 7	

### 2nd Plot

set title "Speed Test Multiset - Insertion Only (125-8000 Items)"

set xrange [100:10000]

replot

### 3rd Plot

set title "Speed Test - Insertion Only - Plotted by Leaf/Inner Slots in B+ Tree"

set key top right
set autoscale x
set xlabel "Leaf/Inner Slots"
unset logscale x
unset logscale y

plot "speed-insert.trt" using ($0 + 4):14 title "1024000 Inserts" with lines, \
     "speed-insert.trt" using ($0 + 4):15 title "2048000 Inserts" with lines, \
     "speed-insert.trt" using ($0 + 4):16 title "4096000 Inserts" with lines

### 1st Plot

set title "Speed Test Multiset - Insert/Find/Erase (16000-4096000 Items)"
set key top left
set logscale x
set xrange [10000:5000000]
set xlabel "Data Pairs"
set ylabel "Seconds"
set format x "%.0f"

plot "speed-all.txt" using 1:2 title "std::multiset" with linespoints pointtype 2, \
     "speed-all.txt" using 1:3 title "btree_multiset<4>" with linespoints pointtype 3,  \
     "speed-all.txt" using 1:31 title "btree_multiset<32>" with linespoints pointtype 4,  \
     "speed-all.txt" using 1:63 title "btree_multiset<64>" with linespoints pointtype 5, \
     "speed-all.txt" using 1:129 title "btree_multiset<128>" with linespoints pointtype 6, \
     "speed-all.txt" using 1:201 title "btree_multiset<200>" with linespoints pointtype 7	

### 2nd Plot

set title "Speed Test Multiset - Insert/Find/Erase (125-8000 Items)"

set xrange [100:10000]

replot

### 3rd Plot

set title "Speed Test - Insert/Find/Erase - Plotted by Leaf/Inner Slots in B+ Tree"

set key top right
set autoscale x
set xlabel "Leaf/Inner Slots"
unset logscale x
unset logscale y

plot "speed-all.trt" using ($0 + 4):14 title "1024000 Data Pairs" with lines, \
     "speed-all.trt" using ($0 + 4):15 title "2048000 Data Pairs" with lines, \
     "speed-all.trt" using ($0 + 4):16 title "4096000 Data Pairs" with lines

