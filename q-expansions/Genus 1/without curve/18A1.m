
    /****************************************************
    Loading this file in magma loads the objects fs_18A1 
    and X_18A1. fs_18A1 is a list of power series which form 
    a basis for the space of cusp forms. X_18A1 is a 
    representation of the corresponding modular curve in 
    projective space
    *****************************************************/

              F := RationalField();     
              f<x> := Polynomial(F, [ RationalField() | -1, -3, 0, 1 ]);
              K<zeta> := ext<F|f>;
              Kq<q> := PowerSeriesRing(K);
              fs_18A1 := [Kq | q + 3*q^5 + 2*q^7 - 6*q^11 + 5*q^13 - 3*q^17 + 
2*q^19 + 6*q^23 + 4*q^25 + 3*q^29 - 4*q^31 + 6*q^35 + 5*q^37 - 6*q^41 - 10*q^43 
- 3*q^49 - 6*q^53 - 18*q^55 - 12*q^59 + 5*q^61 + 15*q^65 + 2*q^67 + 6*q^71 - 
q^73 - 12*q^77 - 10*q^79 - 9*q^85 - 3*q^89 + 10*q^91 + 6*q^95 - 10*q^97 + 
6*q^101 - 16*q^103 + 12*q^107 - 7*q^109 + 9*q^113 + 18*q^115 - 6*q^119 + 
25*q^121 - 3*q^125 + 2*q^127 - 6*q^131 + 4*q^133 - 15*q^137 + 8*q^139 - 30*q^143
+ 9*q^145 + 15*q^149 - 4*q^151 - 12*q^155 + 5*q^157 + 12*q^161 - 4*q^163 + 
18*q^167 + 12*q^169 - 9*q^173 + 8*q^175 + 12*q^179 + 14*q^181 + 15*q^185 + 
18*q^187 + 6*q^191 - 25*q^193 + 15*q^197 + 20*q^199 + 6*q^203 - 18*q^205 - 
12*q^209 + 14*q^211 - 30*q^215 - 8*q^217 - 15*q^221 - 10*q^223 + 18*q^227 + 
5*q^229 - 15*q^233 + 11*q^241 - 9*q^245 + 10*q^247 + 30*q^251 - 36*q^253 - 
27*q^257 + 10*q^259 + 24*q^263 - 18*q^265 + 3*q^269 - 10*q^271 - 24*q^275 - 
10*q^277 - 15*q^281 - 4*q^283 - 12*q^287 - 8*q^289 + 15*q^293 - 36*q^295 + 
30*q^299 - 20*q^301 + 15*q^305 + 20*q^307 - 24*q^311 - 25*q^313 + 15*q^317 - 
18*q^319 - 6*q^323 + O(q^324)] ;
              P_Q<[x]> := ProjectiveSpace(Rationals(), 1);
              X_18A1 := Curve(P_Q, [ PolynomialRing(ext<K|Polynomial(K, [-1, -3,
0, 1])> where K is RationalField(), 2) | ]);
