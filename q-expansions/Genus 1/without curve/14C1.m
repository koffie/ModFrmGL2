
    /****************************************************
    Loading this file in magma loads the objects fs_14C1 
    and X_14C1. fs_14C1 is a list of power series which form 
    a basis for the space of cusp forms. X_14C1 is a 
    representation of the corresponding modular curve in 
    projective space
    *****************************************************/

              F := RationalField();     
              K := F;
              Kq<q> := PowerSeriesRing(K);
              fs_14C1 := [Kq | q - q^2 - 2*q^3 + q^4 + 2*q^6 + q^7 - q^8 + q^9 -
2*q^12 - 4*q^13 - q^14 + q^16 + 6*q^17 - q^18 + 2*q^19 - 2*q^21 + 2*q^24 - 
5*q^25 + 4*q^26 + 4*q^27 + q^28 - 6*q^29 - 4*q^31 - q^32 - 6*q^34 + q^36 + 
2*q^37 - 2*q^38 + 8*q^39 + 6*q^41 + 2*q^42 + 8*q^43 - 12*q^47 - 2*q^48 + q^49 + 
5*q^50 - 12*q^51 - 4*q^52 + 6*q^53 - 4*q^54 - q^56 - 4*q^57 + 6*q^58 - 6*q^59 + 
8*q^61 + 4*q^62 + q^63 + q^64 - 4*q^67 + 6*q^68 - q^72 + 2*q^73 - 2*q^74 + 
10*q^75 + 2*q^76 - 8*q^78 + 8*q^79 - 11*q^81 - 6*q^82 - 6*q^83 - 2*q^84 - 8*q^86
+ 12*q^87 - 6*q^89 - 4*q^91 + 8*q^93 + 12*q^94 + 2*q^96 - 10*q^97 - q^98 - 
5*q^100 + 12*q^102 - 4*q^103 + 4*q^104 - 6*q^106 + 12*q^107 + 4*q^108 + 2*q^109 
- 4*q^111 + q^112 + 6*q^113 + 4*q^114 - 6*q^116 - 4*q^117 + 6*q^118 + 6*q^119 - 
11*q^121 - 8*q^122 - 12*q^123 - 4*q^124 - q^126 - 16*q^127 - q^128 - 16*q^129 + 
18*q^131 + 2*q^133 + 4*q^134 - 6*q^136 + 18*q^137 + 14*q^139 + 24*q^141 + q^144 
- 2*q^146 - 2*q^147 + 2*q^148 - 18*q^149 - 10*q^150 + 8*q^151 - 2*q^152 + 
6*q^153 + 8*q^156 - 4*q^157 - 8*q^158 - 12*q^159 + 11*q^162 - 16*q^163 + 6*q^164
+ 6*q^166 - 12*q^167 + 2*q^168 + 3*q^169 + 2*q^171 + 8*q^172 - 12*q^173 - 
12*q^174 - 5*q^175 + 12*q^177 + 6*q^178 - 12*q^179 + 20*q^181 + 4*q^182 - 
16*q^183 - 8*q^186 - 12*q^188 + 4*q^189 + 24*q^191 - 2*q^192 + 14*q^193 + 
10*q^194 + q^196 - 18*q^197 + 20*q^199 + 5*q^200 + 8*q^201 - 6*q^203 - 12*q^204 
+ 4*q^206 - 4*q^208 - 4*q^211 + 6*q^212 - 12*q^214 - 4*q^216 - 4*q^217 - 2*q^218
- 4*q^219 - 24*q^221 + 4*q^222 + 8*q^223 - q^224 - 5*q^225 - 6*q^226 + 18*q^227 
- 4*q^228 - 4*q^229 + 6*q^232 - 6*q^233 + 4*q^234 - 6*q^236 - 16*q^237 - 6*q^238
+ 24*q^239 - 10*q^241 + 11*q^242 + 10*q^243 + 8*q^244 + 12*q^246 - 8*q^247 + 
4*q^248 + 12*q^249 - 18*q^251 + q^252 + 16*q^254 + q^256 + 18*q^257 + 16*q^258 +
2*q^259 - 6*q^261 - 18*q^262 - 2*q^266 + 12*q^267 - 4*q^268 - 12*q^269 - 
16*q^271 + 6*q^272 + 8*q^273 - 18*q^274 - 10*q^277 - 14*q^278 - 4*q^279 - 
6*q^281 - 24*q^282 - 22*q^283 + 6*q^287 - q^288 + 19*q^289 + 20*q^291 + 2*q^292 
+ 24*q^293 + 2*q^294 - 2*q^296 + 18*q^298 + 10*q^300 + 8*q^301 - 8*q^302 + 
2*q^304 - 6*q^306 + 2*q^307 + 8*q^309 - 24*q^311 - 8*q^312 - 10*q^313 + 4*q^314 
+ 8*q^316 + 6*q^317 + 12*q^318 - 24*q^321 + O(q^322)] ;
              P_Q<[x]> := ProjectiveSpace(Rationals(), 1);
              X_14C1 := Curve(P_Q, [ PolynomialRing(RationalField(), 2) | ]);
