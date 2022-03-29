
    /****************************************************
    Loading this file in magma loads the objects fs_46A10_shim 
    and X_46A10_shim. fs_46A10_shim is a list of power series which form 
    a basis for the space of cusp forms. X_46A10_shim is a 
    representation of the corresponding modular curve in 
    projective space
    *****************************************************/

              F := RationalField();     
              K := F;
              Kq<q> := PowerSeriesRing(K);
              fs_46A10_shim := [Kq | q - q^13 - 2*q^17 + 2*q^21 - q^25 - 4*q^27 
- 3*q^29 + 2*q^31 + 4*q^37 + 2*q^39 + q^41 + 4*q^43 - 4*q^45 + 6*q^47 + q^49 - 
4*q^51 + 2*q^53 + 2*q^57 - 4*q^59 + 6*q^61 - 4*q^63 + 4*q^67 - q^69 - 6*q^71 - 
q^73 - 4*q^77 - 8*q^79 + q^81 + 4*q^83 - 4*q^85 + 2*q^87 + 4*q^91 + q^93 - 
2*q^97 + 2*q^101 - 4*q^105 - 4*q^107 - 8*q^109 + 4*q^111 + 6*q^113 - 2*q^117 - 
8*q^119 - 7*q^121 + 8*q^123 + 4*q^125 + 2*q^127 + 8*q^129 + 12*q^131 + 4*q^133 +
4*q^135 - 8*q^137 + O(q^138), q - q^13 - 2*q^17 + 2*q^21 - q^25 - 4*q^27 - 
3*q^29 + 2*q^31 + 4*q^37 + 2*q^39 + q^41 + 4*q^43 - 4*q^45 + 6*q^47 + q^49 - 
4*q^51 + 2*q^53 + 2*q^57 - 4*q^59 + 6*q^61 - 4*q^63 + 4*q^67 - q^69 - 6*q^71 - 
q^73 - 4*q^77 - 8*q^79 + q^81 + 4*q^83 - 4*q^85 + 2*q^87 + 4*q^91 + q^93 - 
2*q^97 + 2*q^101 - 4*q^105 - 4*q^107 - 8*q^109 + 4*q^111 + 6*q^113 - 2*q^117 - 
8*q^119 - 7*q^121 + 8*q^123 + 4*q^125 + 2*q^127 + 8*q^129 + 12*q^131 + 4*q^133 +
4*q^135 - 8*q^137 + O(q^138), q^2 - 3*q^12 - q^16 + q^18 + 2*q^20 - 2*q^22 + 
q^24 + 2*q^26 + 4*q^28 - 4*q^30 - 2*q^32 + 2*q^34 + q^36 - 2*q^38 - 4*q^42 - 
4*q^44 + q^46 + 6*q^48 + 3*q^50 + q^52 - 2*q^56 - 2*q^58 + 2*q^60 + 4*q^64 + 
4*q^66 - 2*q^68 - q^72 - 6*q^80 + 2*q^82 - 4*q^84 + 2*q^86 + 2*q^88 - 4*q^90 - 
3*q^96 + q^98 - 8*q^100 + 4*q^102 - q^104 - 4*q^106 + 3*q^108 - 6*q^112 - q^116 
+ 4*q^118 + 9*q^124 + 4*q^126 + 5*q^128 - 4*q^130 + 10*q^132 - 6*q^134 + 
O(q^138), q^3 - 2*q^11 + 4*q^13 - 6*q^15 + 4*q^17 - 2*q^19 - 8*q^21 + q^23 + 
6*q^25 + 5*q^27 + 2*q^29 - 3*q^31 + 4*q^33 - 2*q^35 - 4*q^37 - 3*q^39 + 4*q^41 -
7*q^47 - 2*q^49 + 12*q^51 - 8*q^53 + 2*q^55 - 4*q^57 + 8*q^59 - 4*q^61 + 12*q^63
- 8*q^65 - 14*q^67 + 2*q^69 + 15*q^71 + 14*q^73 + 9*q^75 - 2*q^77 + 6*q^79 - 
10*q^81 - 12*q^83 - 6*q^85 - 7*q^87 - 8*q^89 - 4*q^91 - 16*q^93 + 12*q^97 - 
8*q^99 - 6*q^101 + 8*q^103 + 10*q^105 - 2*q^107 + 8*q^109 + 2*q^111 + 4*q^113 + 
14*q^117 + 10*q^119 + 6*q^121 - 3*q^123 - 4*q^125 - 9*q^127 - 12*q^129 + 3*q^131
- 4*q^133 - 2*q^135 + 12*q^137 + O(q^138), q^4 - q^12 - q^16 - 2*q^24 + 2*q^28 -
q^32 + 2*q^36 + 2*q^40 - 4*q^44 + 3*q^48 + 3*q^52 + 2*q^56 - 4*q^60 + 2*q^68 - 
2*q^76 - 2*q^80 - 6*q^84 - 2*q^88 + q^92 + 5*q^96 - q^100 + q^108 - 4*q^112 - 
3*q^116 + 2*q^120 + 3*q^124 + 5*q^128 + 8*q^132 - 2*q^136 + O(q^138), q^5 - 
2*q^11 + 3*q^13 - 4*q^15 + 3*q^17 - 2*q^19 - 7*q^21 + q^23 + 5*q^25 + 5*q^27 + 
2*q^29 - q^31 + 5*q^33 - 3*q^35 - 5*q^37 - 4*q^39 + 2*q^41 - 7*q^47 + q^49 + 
8*q^51 - 6*q^53 + q^55 - 2*q^57 + 10*q^59 - 8*q^61 + 12*q^63 - 5*q^65 - 12*q^67 
+ q^69 + 14*q^71 + 11*q^73 + 7*q^75 - 5*q^77 + 2*q^79 - 7*q^81 - 8*q^83 - 3*q^85
- 3*q^87 - 8*q^89 - 13*q^93 - 2*q^95 + 13*q^97 - 8*q^99 - 5*q^101 + 2*q^103 + 
5*q^105 + 2*q^107 + 8*q^109 - q^113 + q^115 + 11*q^117 + 11*q^119 + 9*q^121 - 
3*q^123 - 2*q^125 - 5*q^127 - 10*q^129 + 3*q^131 - 4*q^133 - 2*q^135 + 6*q^137 +
O(q^138), q^6 + q^12 - 2*q^14 + q^16 - q^18 - 2*q^20 + 2*q^22 - 3*q^24 - q^26 + 
q^36 + 4*q^40 + 2*q^42 + 4*q^50 + q^52 - q^54 + 2*q^56 + q^58 - 2*q^60 - 3*q^62 
- 4*q^64 - 4*q^66 + 2*q^68 - 4*q^70 - q^72 + 3*q^78 - 2*q^80 + 3*q^82 + 2*q^86 -
2*q^88 - 4*q^90 + q^94 + 3*q^96 + 2*q^102 - q^104 - 2*q^106 - q^108 + 4*q^110 + 
2*q^112 - 2*q^114 - q^116 + 4*q^120 + 2*q^122 - 3*q^124 + 3*q^128 - 4*q^130 - 
2*q^132 - 2*q^134 - 4*q^136 + O(q^138), q^7 - q^11 + q^13 - q^15 - 2*q^21 - q^25
+ q^27 + q^31 + 2*q^33 + q^35 - 2*q^39 + 2*q^45 - q^47 - q^49 + q^51 - q^55 + 
2*q^63 - q^67 + 2*q^71 + q^73 + q^75 - q^77 - 3*q^81 - 3*q^83 + q^85 - q^87 - 
2*q^89 - q^91 - 3*q^93 + 2*q^97 - 2*q^99 + q^101 + q^103 + q^105 + 2*q^107 + 
q^111 + 4*q^113 + 3*q^117 + q^119 + 3*q^121 - q^123 - 4*q^125 - q^127 - 2*q^129 
+ 3*q^131 - 2*q^133 - q^135 - 2*q^137 + O(q^138), q^8 - 2*q^12 - q^16 + 2*q^20 +
q^24 + 2*q^28 - 2*q^32 - 2*q^40 - 2*q^44 + q^48 + 2*q^60 + 3*q^64 - 2*q^68 + 
2*q^72 - 2*q^84 - 2*q^88 - 4*q^100 + 3*q^104 + 2*q^108 - 2*q^112 - 6*q^120 + 
6*q^124 + q^128 + 6*q^132 + 4*q^136 + O(q^138), q^9 - 2*q^11 + 3*q^13 - 4*q^15 +
4*q^17 - 2*q^19 - 6*q^21 + q^23 + 4*q^25 + 4*q^27 + q^29 - 2*q^31 + 4*q^33 - 
4*q^37 - 2*q^39 + q^41 - 2*q^43 - 6*q^47 + 8*q^51 - 6*q^53 - 2*q^57 + 8*q^59 - 
6*q^61 + 8*q^63 - 4*q^65 - 10*q^67 + q^69 + 14*q^71 + 11*q^73 + 8*q^75 - 4*q^77 
+ 4*q^79 - 8*q^81 - 10*q^83 - 4*q^85 - 2*q^87 - 6*q^89 - 13*q^93 + 12*q^97 - 
6*q^99 - 4*q^101 + 4*q^103 + 4*q^105 + 2*q^107 + 8*q^109 + 8*q^117 + 8*q^119 + 
8*q^121 - 4*q^125 - 10*q^127 - 8*q^129 - 4*q^133 + 6*q^137 + O(q^138), q^10 + 
q^12 - q^14 - q^18 - 2*q^20 + q^22 - q^24 - q^26 + q^30 + q^32 - q^34 + q^36 + 
2*q^40 + q^42 - q^48 + 2*q^50 + q^52 + q^58 - 2*q^60 - 2*q^64 - q^66 + 2*q^68 - 
4*q^70 - q^72 - q^74 + q^82 + 2*q^86 - 2*q^90 + 2*q^96 + 2*q^98 - q^102 - q^104 
- q^108 + 2*q^110 + 2*q^112 - q^116 + 2*q^118 + 2*q^120 - 2*q^122 - 3*q^124 + 
2*q^126 - q^130 - 2*q^132 - q^134 - 2*q^136 + O(q^138)] ;
              P_Q<[x]> := ProjectiveSpace(Rationals(), 9);
              X_46A10_shim := Curve(P_Q, [ PolynomialRing(RationalField(), 10) |
x[1]*x[3] - x[2]^2 + 2*x[3]*x[9] - 6*x[7]^2 + 2*x[7]*x[9] - x[8]^2 - 
4*x[8]*x[10] - 2*x[9]^2 + 2*x[10]^2,
x[1]*x[4] - x[2]*x[3] + x[2]*x[9] + x[4]*x[9] - x[5]*x[6] + x[6]*x[9] - 
x[7]*x[8] - 2*x[7]*x[10],
x[1]*x[5] - x[3]^2 + 3*x[3]*x[9] + x[5]*x[9] - x[6]^2 - 2*x[7]^2 + 2*x[7]*x[9] +
3*x[8]^2 - 3*x[9]^2 + 6*x[10]^2,
x[1]*x[6] - x[3]*x[4] + x[4]*x[9] - 2*x[6]*x[7] + x[6]*x[9],
x[1]*x[7] - x[4]^2 + x[6]^2 - x[7]^2 + x[7]*x[9] - 2*x[8]^2 - 2*x[8]*x[10] - 
3*x[10]^2,
x[1]*x[8] - x[4]*x[5] + x[4]*x[9] + x[6]*x[7] + x[8]*x[9],
x[1]*x[9] + x[3]*x[9] - x[5]^2 + 2*x[5]*x[9] + x[6]^2 - 3*x[7]^2 + 2*x[7]*x[9] -
x[8]^2 - 2*x[8]*x[10] - 2*x[9]^2,
x[1]*x[10] - x[5]*x[6] - x[6]*x[7] + x[6]*x[9] + x[9]*x[10],
x[2]*x[4] - x[3]^2 + 2*x[3]*x[9] - 2*x[6]^2 + x[7]^2 + 5*x[8]^2 + 4*x[8]*x[10] -
x[9]^2 + 7*x[10]^2,
x[2]*x[5] - x[2]*x[9] - x[3]*x[4] + x[4]*x[9] + x[5]*x[6] - x[6]*x[7] - 
x[6]*x[9] + 2*x[7]*x[10],
x[2]*x[6] - x[4]^2 - x[7]^2 + x[10]^2,
x[2]*x[7] - x[4]*x[5] + x[4]*x[9] - x[7]*x[8],
x[2]*x[8] - x[5]^2 + 2*x[5]*x[9] + 2*x[8]*x[10] - x[9]^2 + x[10]^2,
x[2]*x[10] - x[6]^2 - x[7]^2 + x[8]^2 + 3*x[10]^2,
x[3]*x[5] - x[3]*x[9] - x[4]^2 - x[5]*x[9] + x[6]^2 + x[7]^2 - 2*x[8]^2 - 
2*x[8]*x[10] + x[9]^2 - 3*x[10]^2,
x[3]*x[6] - x[4]*x[5] + x[4]*x[9] - x[6]*x[7] - x[6]*x[9],
x[3]*x[7] - x[5]^2 + 2*x[5]*x[9] - x[7]^2 - x[7]*x[9] - x[9]^2,
x[3]*x[8] - x[5]*x[6] + x[6]*x[9] + x[7]*x[8] + 2*x[7]*x[10] - x[8]*x[9],
x[3]*x[10] - x[6]*x[7] - x[7]*x[8] - x[9]*x[10],
x[4]*x[6] - x[5]^2 + 2*x[5]*x[9] - 2*x[7]^2 - x[8]^2 - x[9]^2 - x[10]^2,
x[4]*x[7] - x[5]*x[6] + x[6]*x[9],
x[4]*x[8] - x[6]^2 + 2*x[8]^2 + 2*x[8]*x[10] + 4*x[10]^2,
x[4]*x[10] - x[7]^2 - x[8]^2 - x[8]*x[10] - x[10]^2,
x[5]*x[7] - x[6]^2 - x[7]*x[9] + 2*x[8]^2 + x[8]*x[10] + 3*x[10]^2,
x[5]*x[8] - x[6]*x[7] + 2*x[7]*x[10] - x[8]*x[9],
x[5]*x[10] - x[7]*x[8] - x[7]*x[10] - x[9]*x[10],
x[6]*x[8] - x[7]^2 + x[10]^2,
x[6]*x[10] - x[8]^2 - x[8]*x[10] - 2*x[10]^2
]);
