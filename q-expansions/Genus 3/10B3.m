
    /****************************************************
    Loading this file in magma loads the objects fs_10B3 
    and X_10B3. fs_10B3 is a list of power series which form 
    a basis for the space of cusp forms. X_10B3 is a 
    representation of the corresponding modular curve in 
    projective space
    *****************************************************/

              F := RationalField();     
              f<x> := Polynomial(F, [ RationalField() | -1, -1, 1 ]);
              K<zeta> := ext<F|f>;
              Kq<q> := PowerSeriesRing(K);
              fs_10B3 := [Kq | q - 2*q^3 - 6*q^5 + 2*q^7 + q^9 + 2*q^13 + 
12*q^15 - 6*q^17 - 4*q^19 - 4*q^21 + 6*q^23 + 6*q^25 + 4*q^27 + 6*q^29 - 4*q^31 
- 12*q^35 + 2*q^37 - 4*q^39 + 6*q^41 - 10*q^43 - 6*q^45 - 6*q^47 - 3*q^49 + 
12*q^51 - 6*q^53 + 8*q^57 + 12*q^59 + 2*q^61 + 2*q^63 - 12*q^65 + 2*q^67 - 
12*q^69 - 12*q^71 + 2*q^73 - 12*q^75 + 8*q^79 - 11*q^81 + 6*q^83 + 36*q^85 - 
12*q^87 - 6*q^89 + 4*q^91 + 8*q^93 + 24*q^95 + 2*q^97 + 6*q^101 + 14*q^103 + 
24*q^105 - 6*q^107 + 2*q^109 - 4*q^111 - 6*q^113 - 36*q^115 + 2*q^117 - 12*q^119
- 11*q^121 - 12*q^123 - 6*q^125 + 2*q^127 + 20*q^129 - 8*q^133 - 24*q^135 + 
18*q^137 - 4*q^139 + 12*q^141 - 36*q^145 + 6*q^147 - 6*q^149 + 20*q^151 - 
6*q^153 + 24*q^155 - 22*q^157 + 12*q^159 + 12*q^161 - 10*q^163 + 18*q^167 - 
9*q^169 - 4*q^171 - 6*q^173 + 12*q^175 - 24*q^177 - 12*q^179 - 10*q^181 - 
4*q^183 - 12*q^185 + 8*q^189 - 12*q^191 + 26*q^193 + 24*q^195 + 18*q^197 + 
8*q^199 - 4*q^201 + 12*q^203 - 36*q^205 + 6*q^207 - 16*q^211 + 24*q^213 + 
60*q^215 - 8*q^217 - 4*q^219 - 12*q^221 - 10*q^223 + 6*q^225 - 6*q^227 + 
14*q^229 - 6*q^233 + 36*q^235 - 16*q^237 - 24*q^239 + 14*q^241 + 10*q^243 + 
18*q^245 - 8*q^247 - 12*q^249 - 72*q^255 - 6*q^257 + 4*q^259 + 6*q^261 - 
18*q^263 + 36*q^265 + 12*q^267 + 18*q^269 + 20*q^271 - 8*q^273 + 26*q^277 - 
4*q^279 + 6*q^281 + 14*q^283 - 48*q^285 + 12*q^287 + 19*q^289 - 4*q^291 - 
30*q^293 - 72*q^295 + 12*q^299 - 20*q^301 - 12*q^303 - 12*q^305 + 2*q^307 - 
28*q^309 + 12*q^311 - 22*q^313 - 12*q^315 - 6*q^317 + 12*q^321 + 24*q^323 + 
12*q^325 - 4*q^327 - 12*q^329 + 8*q^331 + 2*q^333 - 12*q^335 + 2*q^337 + 
12*q^339 - 20*q^343 + 72*q^345 - 30*q^347 - 10*q^349 + O(q^350), q + 2*q^5 + q^9
- 4*q^15 - 4*q^19 - 4*q^21 - 2*q^25 + 6*q^29 - 4*q^31 + 4*q^35 - 4*q^39 + 6*q^41
+ 2*q^45 - 3*q^49 + 12*q^51 + 12*q^59 + 2*q^61 + 4*q^65 - 12*q^69 - 12*q^71 + 
4*q^75 + 8*q^79 - 11*q^81 - 12*q^85 - 6*q^89 + 4*q^91 - 8*q^95 + 6*q^101 - 
8*q^105 + 2*q^109 - 4*q^111 + 12*q^115 - 12*q^119 - 11*q^121 + 2*q^125 + 
20*q^129 + 8*q^135 - 4*q^139 + 12*q^141 + 12*q^145 - 6*q^149 + 20*q^151 - 
8*q^155 + 12*q^159 + 12*q^161 - 9*q^169 - 4*q^171 - 4*q^175 - 12*q^179 - 
10*q^181 + 4*q^185 + 8*q^189 - 12*q^191 - 8*q^195 + 8*q^199 - 4*q^201 + 12*q^205
- 16*q^211 - 20*q^215 - 4*q^219 - 12*q^221 - 2*q^225 + 14*q^229 - 12*q^235 - 
24*q^239 + 14*q^241 - 6*q^245 - 12*q^249 + 24*q^255 + 4*q^259 + 6*q^261 - 
12*q^265 + 18*q^269 + 20*q^271 - 4*q^279 + 6*q^281 + 16*q^285 + 19*q^289 - 
4*q^291 + 24*q^295 + 12*q^299 - 20*q^301 + 4*q^305 - 28*q^309 + 12*q^311 + 
4*q^315 + 12*q^321 - 4*q^325 - 12*q^329 + 8*q^331 + 4*q^335 + 12*q^339 - 
24*q^345 - 10*q^349 + O(q^350), q^3 - q^5 - q^7 - q^13 + 2*q^15 + 3*q^17 - 
3*q^23 + q^25 - 2*q^27 - 2*q^35 - q^37 + 5*q^43 - q^45 + 3*q^47 + 3*q^53 - 
4*q^57 - q^63 - 2*q^65 - q^67 - q^73 - 2*q^75 - 3*q^83 + 6*q^85 + 6*q^87 - 
4*q^93 + 4*q^95 - q^97 - 7*q^103 + 4*q^105 + 3*q^107 + 3*q^113 - 6*q^115 - q^117
+ 6*q^123 - q^125 - q^127 + 4*q^133 - 4*q^135 - 9*q^137 - 6*q^145 - 3*q^147 + 
3*q^153 + 4*q^155 + 11*q^157 + 5*q^163 - 9*q^167 + 3*q^173 + 2*q^175 + 12*q^177 
+ 2*q^183 - 2*q^185 - 13*q^193 + 4*q^195 - 9*q^197 - 6*q^203 - 6*q^205 - 3*q^207
- 12*q^213 + 10*q^215 + 4*q^217 + 5*q^223 + q^225 + 3*q^227 + 3*q^233 + 6*q^235 
+ 8*q^237 - 5*q^243 + 3*q^245 + 4*q^247 - 12*q^255 + 3*q^257 + 9*q^263 + 6*q^265
- 6*q^267 + 4*q^273 - 13*q^277 - 7*q^283 - 8*q^285 - 6*q^287 + 15*q^293 - 
12*q^295 + 6*q^303 - 2*q^305 - q^307 + 11*q^313 - 2*q^315 + 3*q^317 - 12*q^323 +
2*q^325 + 2*q^327 - q^333 - 2*q^335 - q^337 + 10*q^343 + 12*q^345 + 15*q^347 + 
O(q^350)] ;
              P_Q<[x]> := ProjectiveSpace(Rationals(), 2);
              X_10B3 := Curve(P_Q, [ PolynomialRing(ext<K|Polynomial(K, [-1, -1,
1])> where K is RationalField(), 3) |
x[1]^2 - x[2]^2 + 4*x[2]*x[3] + 16*x[3]^2
]);
