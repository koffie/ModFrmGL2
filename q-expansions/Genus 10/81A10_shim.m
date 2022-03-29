
    /****************************************************
    Loading this file in magma loads the objects fs_81A10_shim 
    and X_81A10_shim. fs_81A10_shim is a list of power series which form 
    a basis for the space of cusp forms. X_81A10_shim is a 
    representation of the corresponding modular curve in 
    projective space
    *****************************************************/

              F := RationalField();     
              K := F;
              Kq<q> := PowerSeriesRing(K);
              fs_81A10_shim := [Kq | q - 7*q^19 + 2*q^28 + 11*q^37 - 8*q^64 - 
7*q^73 - 5*q^91 + 10*q^100 + 2*q^109 + 20*q^127 - 25*q^163 - 16*q^172 - 7*q^181 
+ 11*q^199 + 20*q^208 + 4*q^217 + O(q^220), q^2 - 2*q^11 - q^20 + q^29 + 2*q^38 
+ 4*q^47 - 2*q^56 + q^65 - 7*q^74 - 8*q^83 + 2*q^92 + 4*q^101 + 6*q^110 + 
6*q^119 + 7*q^128 + q^137 - 7*q^146 - 8*q^155 - 4*q^164 - 11*q^173 - 2*q^182 + 
10*q^191 + 2*q^200 - 4*q^209 + 11*q^218 + O(q^220), q^3 - 2*q^12 - q^21 + 5*q^39
+ 4*q^48 - 7*q^57 - 5*q^75 + 2*q^84 - 4*q^93 + 11*q^111 + 8*q^129 - 6*q^147 - 
10*q^156 - q^183 - 8*q^192 + 5*q^201 - 7*q^219 + O(q^220), q^4 - 10*q^22 + 
12*q^31 + 5*q^40 - 7*q^49 + 5*q^58 - 15*q^67 + 8*q^76 - 15*q^85 + 20*q^94 + 
9*q^103 - 18*q^112 - 2*q^121 + 5*q^130 + 21*q^139 - 19*q^148 + 33*q^157 - 
40*q^166 - 5*q^175 - 10*q^184 + 6*q^193 + 20*q^202 - 21*q^211 + O(q^220), q^5 - 
2*q^14 - 2*q^23 + 3*q^32 + 4*q^41 + 2*q^50 - 8*q^59 - 3*q^68 + 4*q^77 - 2*q^86 +
2*q^95 - q^104 + q^113 + 7*q^122 - 2*q^131 + 2*q^140 - 5*q^149 - 2*q^158 + 
10*q^167 - 10*q^176 - 7*q^185 - 2*q^194 - 2*q^203 + O(q^220), q^7 - 11*q^25 + 
12*q^34 + 16*q^43 - 18*q^52 - 11*q^61 - 8*q^70 + 31*q^79 + 8*q^88 - 29*q^97 - 
8*q^115 + 24*q^124 + 17*q^133 - 24*q^142 - 5*q^151 + 12*q^160 + 4*q^169 - 
12*q^178 - 24*q^187 + 16*q^196 + 16*q^205 + O(q^220), q^8 - 3*q^17 + q^26 + 
2*q^35 + 2*q^44 - 8*q^62 + 6*q^71 - 5*q^80 + 3*q^89 + 3*q^98 - q^116 - 7*q^125 +
10*q^134 - 2*q^143 + 2*q^152 - 4*q^161 + 9*q^170 - 12*q^179 - 4*q^188 + 3*q^197 
- 8*q^206 + 2*q^215 + O(q^220), q^10 - 3*q^19 + 6*q^37 - 2*q^46 - 2*q^55 - 
3*q^64 + 4*q^82 - q^91 + 4*q^100 - 3*q^109 - 8*q^118 + 6*q^127 + 3*q^136 + q^145
+ 4*q^154 - 3*q^163 - 6*q^172 - 3*q^181 + 2*q^190 - 3*q^199 + 5*q^208 - 4*q^217 
+ O(q^220), q^13 - 4*q^22 + 4*q^31 + 2*q^40 - 4*q^49 + 2*q^58 - 5*q^67 + 6*q^76 
- 6*q^85 + 8*q^94 + q^103 - 8*q^112 - 3*q^121 + 2*q^130 + 13*q^139 - 12*q^148 + 
16*q^157 - 16*q^166 - q^175 - 4*q^184 + 7*q^193 + 8*q^202 - 11*q^211 + O(q^220),
q^16 - 4*q^25 + 3*q^34 + 6*q^43 - 7*q^52 - 3*q^61 - 2*q^70 + 12*q^79 + 2*q^88 - 
12*q^97 - 2*q^115 + 8*q^124 + 6*q^133 - 6*q^142 - 6*q^151 + 3*q^160 + 4*q^169 - 
3*q^178 - 6*q^187 + 7*q^196 + 4*q^205 + O(q^220)] ;
              P_Q<[x]> := ProjectiveSpace(Rationals(), 9);
              X_81A10_shim := Curve(P_Q, [ PolynomialRing(RationalField(), 10) |
x[1]*x[3] - x[2]^2 - 2*x[5]*x[7],
x[1]*x[4] - x[2]*x[3] - 4*x[6]^2 + 19*x[8]*x[9] + 36*x[10]^2,
x[1]*x[5] - x[3]^2 - 2*x[6]*x[7] + 5*x[7]*x[10],
x[1]*x[6] - x[4]^2 - 6*x[8]*x[10] + 4*x[9]^2,
x[1]*x[7] - x[4]*x[5] + x[7]*x[8],
x[1]*x[8] - x[4]*x[6] + 3*x[8]^2 + 4*x[9]*x[10],
x[1]*x[9] - x[6]^2 + 4*x[8]*x[9] + 9*x[10]^2,
x[1]*x[10] - x[6]*x[8] + x[8]*x[10],
x[2]*x[4] - x[3]^2 - 2*x[6]*x[7] + 7*x[7]*x[10],
x[2]*x[5] - x[3]*x[4] + 2*x[7]^2,
x[2]*x[6] - x[4]*x[5],
x[2]*x[7] + x[3]*x[10] - x[5]^2,
x[2]*x[8] - x[5]*x[6] + 3*x[5]*x[10],
x[2]*x[9] - x[6]*x[7] + 3*x[7]*x[10],
x[2]*x[10] - x[7]*x[8],
x[3]*x[5] - x[4]^2 + 4*x[6]*x[8] - 13*x[8]*x[10] + 4*x[9]^2,
x[3]*x[6] - 2*x[3]*x[10] - x[5]^2,
x[3]*x[7] - x[4]*x[6] + 5*x[8]^2 + 3*x[9]*x[10],
x[3]*x[8] - x[5]*x[7],
x[3]*x[9] - x[7]^2,
x[4]*x[7] - x[5]*x[6] + 3*x[5]*x[10] - 2*x[7]*x[9],
x[4]*x[8] - x[6]^2 + 3*x[8]*x[9] + 9*x[10]^2,
x[4]*x[9] - x[6]*x[8] + 3*x[8]*x[10] - 2*x[9]^2,
x[4]*x[10] - x[8]^2 - 2*x[9]*x[10],
x[5]*x[8] - x[6]*x[7] + 2*x[7]*x[10],
x[5]*x[9] - x[7]*x[8],
x[6]*x[9] - x[8]^2 - 2*x[9]*x[10],
x[6]*x[10] - x[8]*x[9] - 3*x[10]^2
]);
