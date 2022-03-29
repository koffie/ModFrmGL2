
    /****************************************************
    Loading this file in magma loads the objects fs_36Q10_shim 
    and X_36Q10_shim. fs_36Q10_shim is a list of power series which form 
    a basis for the space of cusp forms. X_36Q10_shim is a 
    representation of the corresponding modular curve in 
    projective space
    *****************************************************/

              F := RationalField();     
              K := F;
              Kq<q> := PowerSeriesRing(K);
              fs_36Q10_shim := [Kq | q - 5*q^25 - 4*q^31 + 8*q^43 + 7*q^49 - 
16*q^91 + 2*q^109 - 11*q^121 + 20*q^127 - 10*q^133 + 14*q^157 + 13*q^169 + 
O(q^220), q - 5*q^25 - 4*q^31 + 8*q^43 + 7*q^49 - 16*q^91 + 2*q^109 - 11*q^121 +
20*q^127 - 10*q^133 + 14*q^157 + 13*q^169 + O(q^220), q^2 - q^14 - 2*q^20 - q^26
+ 2*q^32 - q^38 + 2*q^44 + q^50 + 2*q^62 + 5*q^74 - 2*q^80 - 4*q^86 + 4*q^92 - 
6*q^98 - 6*q^104 - 6*q^110 - 4*q^116 + 5*q^122 - 2*q^128 + 11*q^134 + 2*q^140 - 
7*q^146 + 6*q^152 + 11*q^158 + 4*q^164 + 2*q^176 + q^182 - 4*q^188 - 7*q^194 + 
6*q^200 - 7*q^206 - 6*q^212 + 2*q^218 + O(q^220), q^3 - 4*q^21 + 2*q^39 + 8*q^57
- 5*q^75 - 4*q^93 - 10*q^111 + 8*q^129 + 9*q^147 + 14*q^183 - 16*q^201 - 
10*q^219 + O(q^220), q^4 - 2*q^16 - q^28 + 5*q^52 + 4*q^64 - 7*q^76 - 5*q^100 + 
2*q^112 - 4*q^124 + 11*q^148 + 8*q^172 - 6*q^196 - 10*q^208 + O(q^220), q^5 - 
q^11 - 2*q^23 + 2*q^29 - q^35 - 2*q^41 + 2*q^47 + 3*q^53 + 4*q^59 - 4*q^65 + 
q^77 - q^83 - 6*q^89 + 2*q^95 - q^101 + 3*q^107 - 2*q^113 - q^125 - 5*q^131 + 
2*q^137 + 4*q^143 + q^149 + 5*q^155 + 2*q^161 - 2*q^167 + 5*q^173 - 3*q^179 + 
2*q^185 - 4*q^191 + 3*q^197 - 2*q^203 - 2*q^209 - 10*q^215 + O(q^220), q^7 - 
3*q^25 - 3*q^31 - 2*q^37 + 6*q^43 + 7*q^49 + 3*q^55 - 4*q^61 - 4*q^67 + 5*q^73 -
6*q^79 - 10*q^91 + 3*q^97 + 2*q^103 + 6*q^115 - 3*q^121 + 9*q^127 - 4*q^133 - 
2*q^139 - 6*q^145 - q^151 + 6*q^157 - 2*q^163 + 6*q^169 - 2*q^175 + 4*q^181 - 
7*q^193 + 3*q^199 + 6*q^205 + 12*q^211 - q^217 + O(q^220), q^8 - q^20 - 3*q^26 -
q^32 + 3*q^38 + q^44 + 3*q^50 - q^56 + 3*q^62 - 3*q^74 - q^80 - 6*q^86 + 2*q^92 
+ 2*q^104 - 3*q^110 - 2*q^116 + 3*q^122 + 3*q^128 + 3*q^134 + q^140 - 4*q^152 - 
3*q^158 + 2*q^164 + q^176 + 3*q^182 - 2*q^188 + 6*q^194 - 2*q^200 + 3*q^206 - 
3*q^212 + O(q^220), q^10 - q^16 - q^22 + q^40 - 2*q^46 + 3*q^52 + 2*q^58 + q^64 
- q^70 - 3*q^76 - 2*q^82 - q^88 + 2*q^94 - 3*q^100 + 3*q^106 + q^112 + 4*q^118 -
3*q^124 - 4*q^130 + 3*q^148 + q^154 + q^160 - q^166 + 6*q^172 - 6*q^178 - 
2*q^184 + 2*q^190 - q^202 - 2*q^208 + 3*q^214 + O(q^220), q^13 - 2*q^25 - 2*q^31
- q^37 + 4*q^43 + 3*q^49 + 2*q^55 - q^61 - 4*q^67 + q^73 - 2*q^79 - 4*q^91 + 
q^97 + 2*q^103 + 4*q^115 - 2*q^121 + 6*q^127 - 3*q^133 - 4*q^145 - 4*q^151 + 
4*q^157 - 4*q^163 + q^169 + 2*q^175 + 5*q^181 - q^193 + 4*q^205 + 4*q^211 + 
2*q^217 + O(q^220), q^19 - q^25 - q^31 - 2*q^37 + 2*q^43 + 3*q^49 + q^55 - 
3*q^67 + q^73 - 3*q^79 - 3*q^91 + 3*q^97 + 3*q^103 + 2*q^115 - q^121 + 3*q^127 -
4*q^133 - 3*q^139 - 2*q^145 + 2*q^157 + q^163 + q^175 + 4*q^181 - 3*q^193 - 
2*q^199 + 2*q^205 + 3*q^211 + q^217 + O(q^220)] ;
              P_Q<[x]> := ProjectiveSpace(Rationals(), 9);
              X_36Q10_shim := Curve(P_Q, [ PolynomialRing(RationalField(), 10) |
x[1]*x[3] - x[2]^2 - 2*x[7]^2,
x[1]*x[4] - x[2]*x[3] + x[6]*x[8] - 5*x[8]*x[9] + x[8]*x[10],
x[1]*x[5] - x[3]^2 + x[5]*x[6] - 5*x[5]*x[10] + x[7]*x[8],
x[1]*x[6] - x[4]^2 - 4*x[8]^2 - 5*x[9]^2 + 6*x[9]*x[10],
x[1]*x[7] - x[4]*x[5] - x[6]*x[7] - x[7]*x[9] + 2*x[7]*x[10],
x[1]*x[8] - x[4]*x[6] + x[6]*x[8] - 2*x[8]*x[10],
x[1]*x[9] - x[6]^2 + 2*x[9]^2 - 4*x[9]*x[10] + 4*x[10]^2,
x[1]*x[10] - x[8]^2 - x[9]^2,
x[2]*x[4] - x[3]^2 - 3*x[5]*x[10] + 3*x[7]*x[8],
x[2]*x[5] - x[3]*x[4] + x[5]*x[7],
x[2]*x[6] - x[4]*x[5] - x[6]*x[7] - x[7]*x[9] + 4*x[7]*x[10],
x[2]*x[7] + 3*x[3]*x[10] - x[5]^2 - 2*x[7]^2,
x[2]*x[8] - x[5]*x[6] + 2*x[5]*x[10],
x[2]*x[9] - x[6]*x[7] + 2*x[7]*x[10],
x[2]*x[10] - x[7]*x[9] + x[7]*x[10],
x[3]*x[5] - x[4]^2 + x[6]^2 - 4*x[8]^2 - 2*x[9]^2 - 2*x[9]*x[10] + 5*x[10]^2,
x[3]*x[6] + x[3]*x[10] - x[5]^2 - 2*x[7]^2,
x[3]*x[7] - x[4]*x[6] - x[8]*x[9] + 3*x[8]*x[10],
x[3]*x[8] - x[5]*x[7],
x[3]*x[9] - x[7]^2,
x[4]*x[7] - x[5]*x[6] + 2*x[5]*x[10] - x[7]*x[8],
x[4]*x[8] - x[6]^2 + x[8]^2 + 5*x[9]^2 - 7*x[9]*x[10] + 4*x[10]^2,
x[4]*x[9] - x[6]*x[8] - x[8]*x[9] + 2*x[8]*x[10],
x[4]*x[10] - x[8]*x[9],
x[5]*x[8] - x[6]*x[7] + 2*x[7]*x[9] - x[7]*x[10],
x[5]*x[9] - x[7]*x[8],
x[6]*x[9] - x[8]^2 - 2*x[9]^2 + x[9]*x[10],
x[6]*x[10] - x[9]^2 + x[9]*x[10] - 2*x[10]^2
]);
