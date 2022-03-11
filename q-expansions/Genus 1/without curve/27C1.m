
    /****************************************************
    Loading this file in magma loads the objects fs_27C1 
    and X_27C1. fs_27C1 is a list of power series which form 
    a basis for the space of cusp forms. X_27C1 is a 
    representation of the corresponding modular curve in 
    projective space
    *****************************************************/

              F := RationalField();     
              K := F;
              Kq<q> := PowerSeriesRing(K);
              fs_27C1 := [Kq | q - 2*q^4 - q^7 + 5*q^13 + 4*q^16 - 7*q^19 - 
5*q^25 + 2*q^28 - 4*q^31 + 11*q^37 + 8*q^43 - 6*q^49 - 10*q^52 - q^61 - 8*q^64 +
5*q^67 - 7*q^73 + 14*q^76 + 17*q^79 - 5*q^91 - 19*q^97 + 10*q^100 - 13*q^103 + 
2*q^109 - 4*q^112 - 11*q^121 + 8*q^124 + 20*q^127 + 7*q^133 + 23*q^139 - 
22*q^148 - 19*q^151 + 14*q^157 - 25*q^163 + 12*q^169 - 16*q^172 + 5*q^175 - 
7*q^181 + 23*q^193 + 12*q^196 + 11*q^199 + 20*q^208 - 13*q^211 + 4*q^217 - 
28*q^223 - 22*q^229 + 17*q^241 + 2*q^244 - 35*q^247 + 16*q^256 - 11*q^259 - 
10*q^268 + 29*q^271 + 26*q^277 + 32*q^283 - 17*q^289 + 14*q^292 - 8*q^301 - 
28*q^304 - 16*q^307 + 35*q^313 - 34*q^316 - 25*q^325 - q^331 + 5*q^337 + 
13*q^343 - 37*q^349 + 30*q^361 + 10*q^364 + 35*q^367 - 13*q^373 + 29*q^379 + 
38*q^388 - 34*q^397 - 20*q^400 - 20*q^403 - 31*q^409 + 26*q^412 - 19*q^421 + 
q^427 + 2*q^433 - 4*q^436 - 28*q^439 + 8*q^448 - 10*q^457 + 23*q^463 - 5*q^469 +
35*q^475 + 55*q^481 + 22*q^484 - 25*q^487 - 16*q^496 + 32*q^499 - 40*q^508 + 
7*q^511 - 43*q^523 - 23*q^529 - 14*q^532 + 29*q^541 - q^547 - 17*q^553 - 
46*q^556 + 40*q^559 - 31*q^571 + 11*q^577 + 28*q^589 + 44*q^592 + 26*q^601 + 
38*q^604 - 49*q^607 + 47*q^613 + 17*q^619 + 25*q^625 - 28*q^628 - 43*q^631 - 
30*q^637 - 40*q^643 + 50*q^652 - 49*q^661 - 37*q^673 - 24*q^676 + 19*q^679 + 
32*q^688 + 8*q^691 - 10*q^700 - 77*q^703 + 53*q^709 + 13*q^721 + 14*q^724 + 
44*q^727 + 50*q^733 - 16*q^739 + 41*q^751 + 29*q^757 - 2*q^763 - 49*q^769 - 
46*q^772 + 20*q^775 - 24*q^784 - 31*q^787 - 5*q^793 - 22*q^796 + 56*q^811 - 
56*q^817 + 5*q^823 - 7*q^829 - 40*q^832 - 29*q^841 + 26*q^844 + 11*q^847 + 
35*q^853 - 13*q^859 - 8*q^868 + 25*q^871 + 59*q^877 + 47*q^883 - 20*q^889 + 
56*q^892 - 19*q^907 + 44*q^916 - 52*q^919 - 55*q^925 + 42*q^931 - 61*q^937 - 
35*q^949 - 15*q^961 - 34*q^964 + 41*q^967 - 23*q^973 - 4*q^976 + 70*q^988 - 
61*q^991 - 10*q^997 - 43*q^1009 + 14*q^1021 - 32*q^1024 + 85*q^1027 + 53*q^1033 
+ 22*q^1036 + 59*q^1039 - 64*q^1051 + 19*q^1057 + 65*q^1063 + 62*q^1069 + 
20*q^1072 - 40*q^1075 - 58*q^1084 - 55*q^1087 - 22*q^1093 - 14*q^1099 - 
52*q^1108 + 65*q^1117 + 35*q^1123 - 67*q^1129 - 64*q^1132 + 25*q^1141 - 
44*q^1147 - 7*q^1153 + 34*q^1156 + 7*q^1159 - 28*q^1168 + 11*q^1171 - 12*q^1183 
+ 59*q^1201 + 16*q^1204 + 17*q^1213 + 56*q^1216 + 30*q^1225 + 32*q^1228 - 
19*q^1231 + 41*q^1237 + 53*q^1249 - 70*q^1252 - 95*q^1261 + 68*q^1264 + 7*q^1267
- 35*q^1273 - 43*q^1279 - 67*q^1291 - 25*q^1297 + 50*q^1300 - 55*q^1303 + 
71*q^1321 + 2*q^1324 - 4*q^1327 - 32*q^1333 - 65*q^1339 - 10*q^1348 - 23*q^1351 
+ 84*q^1369 - 26*q^1372 - 31*q^1381 + 49*q^1387 - 11*q^1393 + 74*q^1396 + 
68*q^1399 + 10*q^1417 + 20*q^1423 + 71*q^1429 - 60*q^1444 + 35*q^1447 - 
67*q^1453 - 20*q^1456 + 56*q^1459 - 70*q^1468 - 76*q^1471 + 13*q^1477 - 
37*q^1483 + 77*q^1489 + 26*q^1492 - 119*q^1501 - 58*q^1516 + 24*q^1519 + 
5*q^1525 - 7*q^1531 + 77*q^1543 + 11*q^1549 - 76*q^1552 + 28*q^1561 - 79*q^1567 
- 55*q^1573 + 32*q^1579 + 68*q^1588 + 88*q^1591 + 50*q^1597 + 40*q^1600 + 
22*q^1603 - 19*q^1609 + 40*q^1612 - 79*q^1621 + 80*q^1627 + 62*q^1636 - 
52*q^1648 + 100*q^1651 - 70*q^1657 - 73*q^1663 - 67*q^1669 - 25*q^1675 - 
41*q^1681 + 38*q^1684 - 17*q^1687 + 47*q^1693 - 64*q^1699 - 2*q^1708 - 40*q^1723
+ 35*q^1729 - 4*q^1732 - 49*q^1741 + 8*q^1744 - 61*q^1747 - 10*q^1753 + 
56*q^1756 - 31*q^1759 + 14*q^1777 + 83*q^1783 - 82*q^1789 - 16*q^1792 + 
74*q^1801 + 115*q^1807 - 66*q^1813 + 35*q^1825 + 20*q^1828 + 68*q^1831 + 
133*q^1843 + 21*q^1849 - 46*q^1852 - 37*q^1861 - 85*q^1867 + 65*q^1873 + 
10*q^1876 - 73*q^1879 + 4*q^1891 - 29*q^1897 - 70*q^1900 - 110*q^1924 + 
62*q^1933 - 44*q^1936 - 26*q^1939 + 50*q^1948 - q^1951 + 91*q^1957 - 95*q^1963 -
85*q^1975 - 32*q^1981 + 32*q^1984 + 89*q^1987 - 13*q^1993 - 64*q^1996 - 
52*q^1999 + 59*q^2011 - 34*q^2017 + 17*q^2023 + 77*q^2029 + 80*q^2032 + 
70*q^2041 - 14*q^2044 + 83*q^2053 - 14*q^2071 - 20*q^2077 + 23*q^2083 + 
38*q^2089 + 86*q^2092 - 48*q^2107 - 82*q^2113 + 46*q^2116 - 125*q^2119 + 
28*q^2128 - 91*q^2131 - 85*q^2137 + 92*q^2143 + 16*q^2149 + 29*q^2161 - 
58*q^2164 - 88*q^2179 + 2*q^2188 - 35*q^2191 - 5*q^2197 + 8*q^2203 - 47*q^2209 +
34*q^2212 + 53*q^2221 + 92*q^2224 - 80*q^2236 - 91*q^2239 - 16*q^2251 - 
11*q^2257 + 28*q^2263 + 83*q^2269 + 25*q^2275 + 86*q^2281 + 62*q^2284 + 
20*q^2287 - 37*q^2293 + 77*q^2299 - 22*q^2308 + 89*q^2311 + q^2317 + 74*q^2341 -
64*q^2347 - 35*q^2353 - 56*q^2356 - 5*q^2359 - 88*q^2368 + 41*q^2371 - 79*q^2377
- 28*q^2383 + 59*q^2389 + 29*q^2401 - 52*q^2404 - 140*q^2413 - 76*q^2416 + 
95*q^2425 + 98*q^2428 - q^2437 + 37*q^2443 - 68*q^2449 - 94*q^2452 + 11*q^2467 -
73*q^2473 - 34*q^2476 + 55*q^2479 - 50*q^2500 + 47*q^2503 + 115*q^2509 + 
56*q^2512 - 97*q^2521 + 86*q^2524 - 30*q^2527 + 83*q^2539 + 60*q^2548 - 
49*q^2551 + 101*q^2557 - 35*q^2569 + 80*q^2572 + 65*q^2575 + 55*q^2587 - 
25*q^2593 - 100*q^2608 + 13*q^2611 - 91*q^2617 - 8*q^2623 - 161*q^2641 + 
98*q^2644 + 29*q^2647 - 29*q^2653 - 103*q^2659 + 44*q^2671 - 31*q^2677 - 
97*q^2683 + 62*q^2689 + 74*q^2692 - 77*q^2701 + 48*q^2704 - 55*q^2707 - 
103*q^2713 - 38*q^2716 + 101*q^2719 - 10*q^2725 + 104*q^2731 - 65*q^2743 + 
14*q^2749 - 64*q^2752 - 16*q^2764 - 76*q^2767 + 34*q^2779 + 92*q^2791 + 
89*q^2797 + 20*q^2800 + 95*q^2803 - 53*q^2809 + 154*q^2812 + 20*q^2821 + 
98*q^2833 + O(q^2835)] ;
              P_Q<[x]> := ProjectiveSpace(Rationals(), 1);
              X_27C1 := Curve(P_Q, [ PolynomialRing(RationalField(), 2) | ]);
