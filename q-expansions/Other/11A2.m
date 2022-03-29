
    /****************************************************
    Loading this file in magma loads the objects fs_11A2 
    and X_11A2. fs_11A2 is a list of power series which form 
    a basis for the space of cusp forms. X_11A2 is a 
    representation of the corresponding modular curve in 
    projective space
    *****************************************************/

              F := RationalField();     
              f<x> := Polynomial(F, [ RationalField() | 1, 3, -3, -4, 1, 1 ]);
              K<zeta> := ext<F|f>;
              Kq<q> := PowerSeriesRing(K);
              fs_11A2 := [Kq | q - 2*q^2 - q^3 + 2*q^4 + q^5 + 2*q^6 - 2*q^7 - 
2*q^9 - 2*q^10 - 10*q^11 - 2*q^12 + 4*q^13 + 4*q^14 - q^15 - 4*q^16 - 2*q^17 + 
4*q^18 + 2*q^20 + 2*q^21 + 20*q^22 - q^23 - 4*q^25 - 8*q^26 + 5*q^27 - 4*q^28 + 
2*q^30 + 7*q^31 + 8*q^32 + 10*q^33 + 4*q^34 - 2*q^35 - 4*q^36 + 3*q^37 - 4*q^39 
- 8*q^41 - 4*q^42 - 6*q^43 - 20*q^44 - 2*q^45 + 2*q^46 + 8*q^47 + 4*q^48 - 
3*q^49 + 8*q^50 + 2*q^51 + 8*q^52 - 6*q^53 - 10*q^54 - 10*q^55 + 5*q^59 - 2*q^60
+ 12*q^61 - 14*q^62 + 4*q^63 - 8*q^64 + 4*q^65 - 20*q^66 - 7*q^67 - 4*q^68 + 
q^69 + 4*q^70 - 3*q^71 + 4*q^73 - 6*q^74 + 4*q^75 + 20*q^77 + 8*q^78 - 10*q^79 -
4*q^80 + q^81 + 16*q^82 - 6*q^83 + 4*q^84 - 2*q^85 + 12*q^86 + 15*q^89 + 4*q^90 
- 8*q^91 - 2*q^92 - 7*q^93 - 16*q^94 - 8*q^96 - 7*q^97 + 6*q^98 + 20*q^99 - 
8*q^100 + 2*q^101 - 4*q^102 - 16*q^103 + 2*q^105 + 12*q^106 + 18*q^107 + 
10*q^108 + 10*q^109 + 20*q^110 - 3*q^111 + 8*q^112 + 9*q^113 - q^115 - 8*q^117 -
10*q^118 + 4*q^119 - 10*q^121 - 24*q^122 + 8*q^123 + 14*q^124 - 9*q^125 - 
8*q^126 + 8*q^127 + 6*q^129 - 8*q^130 - 18*q^131 + 20*q^132 + 14*q^134 + 5*q^135
- 7*q^137 - 2*q^138 + 10*q^139 - 4*q^140 - 8*q^141 + 6*q^142 - 40*q^143 + 
8*q^144 - 8*q^146 + 3*q^147 + 6*q^148 - 10*q^149 - 8*q^150 + 2*q^151 + 4*q^153 -
40*q^154 + 7*q^155 - 8*q^156 - 7*q^157 + 20*q^158 + 6*q^159 + 8*q^160 + 2*q^161 
- 2*q^162 + 4*q^163 - 16*q^164 + 10*q^165 + 12*q^166 - 12*q^167 + 3*q^169 + 
4*q^170 - 12*q^172 - 6*q^173 + 8*q^175 + 40*q^176 - 5*q^177 - 30*q^178 - 
15*q^179 - 4*q^180 + 7*q^181 + 16*q^182 - 12*q^183 + 3*q^185 + 14*q^186 + 
20*q^187 + 16*q^188 - 10*q^189 + 17*q^191 + 8*q^192 + 4*q^193 + 14*q^194 - 
4*q^195 - 6*q^196 - 2*q^197 - 40*q^198 + 7*q^201 - 4*q^202 + 4*q^204 - 8*q^205 +
32*q^206 + 2*q^207 - 16*q^208 - 4*q^210 + 12*q^211 - 12*q^212 + 3*q^213 - 
36*q^214 - 6*q^215 - 14*q^217 - 20*q^218 - 4*q^219 - 20*q^220 - 8*q^221 + 
6*q^222 + 19*q^223 - 16*q^224 + 8*q^225 - 18*q^226 + 18*q^227 + 15*q^229 + 
2*q^230 - 20*q^231 + 24*q^233 + 16*q^234 + 8*q^235 + 10*q^236 + 10*q^237 - 
8*q^238 - 30*q^239 + 4*q^240 - 8*q^241 + 20*q^242 - 16*q^243 + 24*q^244 - 
3*q^245 - 16*q^246 + 6*q^249 + 18*q^250 - 23*q^251 + 8*q^252 + 10*q^253 - 
16*q^254 + 2*q^255 + 16*q^256 - 2*q^257 - 12*q^258 - 6*q^259 + 8*q^260 + 
36*q^262 + 14*q^263 - 6*q^265 - 15*q^267 - 14*q^268 + 10*q^269 - 10*q^270 - 
28*q^271 + 8*q^272 + 8*q^273 + 14*q^274 + 40*q^275 + 2*q^276 - 2*q^277 - 
20*q^278 - 14*q^279 - 18*q^281 + 16*q^282 + 4*q^283 - 6*q^284 + 80*q^286 + 
16*q^287 - 16*q^288 - 13*q^289 + 7*q^291 + 8*q^292 + 24*q^293 - 6*q^294 + 
5*q^295 - 50*q^297 + 20*q^298 - 4*q^299 + 8*q^300 + 12*q^301 - 4*q^302 - 2*q^303
+ 12*q^305 - 8*q^306 + 8*q^307 + 40*q^308 + 16*q^309 - 14*q^310 + 12*q^311 - 
q^313 + 14*q^314 + 4*q^315 - 20*q^316 + 13*q^317 - 12*q^318 - 8*q^320 - 18*q^321
- 4*q^322 + 2*q^324 - 16*q^325 - 8*q^326 - 10*q^327 - 16*q^329 - 20*q^330 + 
7*q^331 - 12*q^332 - 6*q^333 + 24*q^334 - 7*q^335 - 8*q^336 - 22*q^337 - 6*q^338
- 9*q^339 - 4*q^340 - 70*q^341 + 20*q^343 + q^345 + 12*q^346 + 28*q^347 + 
30*q^349 - 16*q^350 + 20*q^351 - 80*q^352 - 21*q^353 + 10*q^354 - 3*q^355 + 
30*q^356 - 4*q^357 + 30*q^358 - 20*q^359 - 19*q^361 - 14*q^362 + 10*q^363 - 
16*q^364 + 4*q^365 + 24*q^366 - 17*q^367 + 4*q^368 + 16*q^369 - 6*q^370 + 
12*q^371 - 14*q^372 - 26*q^373 - 40*q^374 + 9*q^375 + 20*q^378 - 5*q^379 - 
8*q^381 - 34*q^382 - q^383 + 20*q^385 - 8*q^386 + 12*q^387 - 14*q^388 - 15*q^389
+ 8*q^390 + 2*q^391 + 18*q^393 + 4*q^394 - 10*q^395 + 40*q^396 - 2*q^397 + 
16*q^400 + 2*q^401 - 14*q^402 + 28*q^403 + 4*q^404 + q^405 - 30*q^407 - 30*q^409
+ 16*q^410 + 7*q^411 - 32*q^412 - 10*q^413 - 4*q^414 - 6*q^415 + 32*q^416 - 
10*q^417 + 20*q^419 + 4*q^420 + 22*q^421 - 24*q^422 - 16*q^423 + 8*q^425 - 
6*q^426 - 24*q^427 + 36*q^428 + 40*q^429 + 12*q^430 - 18*q^431 - 20*q^432 - 
11*q^433 + 28*q^434 + 20*q^436 + 8*q^438 + 40*q^439 + 6*q^441 + 16*q^442 - 
11*q^443 - 6*q^444 + 15*q^445 - 38*q^446 + 10*q^447 + 16*q^448 + 35*q^449 - 
16*q^450 + 80*q^451 + 18*q^452 - 2*q^453 - 36*q^454 - 8*q^455 - 12*q^457 - 
30*q^458 - 10*q^459 - 2*q^460 + 12*q^461 + 40*q^462 - 11*q^463 - 7*q^465 - 
48*q^466 - 27*q^467 - 16*q^468 + 14*q^469 - 16*q^470 + 7*q^471 + 60*q^473 - 
20*q^474 + 8*q^476 + 12*q^477 + 60*q^478 + 20*q^479 - 8*q^480 + 12*q^481 + 
16*q^482 - 2*q^483 - 20*q^484 - 7*q^485 + 32*q^486 + 23*q^487 - 4*q^489 + 
6*q^490 - 8*q^491 + 16*q^492 + 20*q^495 - 28*q^496 + 6*q^497 - 12*q^498 + 
20*q^499 - 18*q^500 + 12*q^501 + 46*q^502 - 26*q^503 + 2*q^505 - 20*q^506 - 
3*q^507 + 16*q^508 + 15*q^509 - 4*q^510 - 8*q^511 - 32*q^512 + 4*q^514 - 
16*q^515 + 12*q^516 - 80*q^517 + 12*q^518 + 6*q^519 - 3*q^521 - 16*q^523 - 
36*q^524 - 8*q^525 - 28*q^526 - 14*q^527 - 40*q^528 - 22*q^529 + 12*q^530 - 
10*q^531 - 32*q^533 + 30*q^534 + 18*q^535 + 15*q^537 - 20*q^538 + 30*q^539 + 
10*q^540 - 8*q^541 + 56*q^542 - 7*q^543 - 16*q^544 + 10*q^545 - 16*q^546 + 
8*q^547 - 14*q^548 - 24*q^549 + O(q^550), q - 2*q^2 - q^3 + 2*q^4 + q^5 + 2*q^6 
- 2*q^7 - 2*q^9 - 2*q^10 - 10*q^11 - 2*q^12 + 4*q^13 + 4*q^14 - q^15 - 4*q^16 - 
2*q^17 + 4*q^18 + 2*q^20 + 2*q^21 + 20*q^22 - q^23 - 4*q^25 - 8*q^26 + 5*q^27 - 
4*q^28 + 2*q^30 + 7*q^31 + 8*q^32 + 10*q^33 + 4*q^34 - 2*q^35 - 4*q^36 + 3*q^37 
- 4*q^39 - 8*q^41 - 4*q^42 - 6*q^43 - 20*q^44 - 2*q^45 + 2*q^46 + 8*q^47 + 
4*q^48 - 3*q^49 + 8*q^50 + 2*q^51 + 8*q^52 - 6*q^53 - 10*q^54 - 10*q^55 + 5*q^59
- 2*q^60 + 12*q^61 - 14*q^62 + 4*q^63 - 8*q^64 + 4*q^65 - 20*q^66 - 7*q^67 - 
4*q^68 + q^69 + 4*q^70 - 3*q^71 + 4*q^73 - 6*q^74 + 4*q^75 + 20*q^77 + 8*q^78 - 
10*q^79 - 4*q^80 + q^81 + 16*q^82 - 6*q^83 + 4*q^84 - 2*q^85 + 12*q^86 + 15*q^89
+ 4*q^90 - 8*q^91 - 2*q^92 - 7*q^93 - 16*q^94 - 8*q^96 - 7*q^97 + 6*q^98 + 
20*q^99 - 8*q^100 + 2*q^101 - 4*q^102 - 16*q^103 + 2*q^105 + 12*q^106 + 18*q^107
+ 10*q^108 + 10*q^109 + 20*q^110 - 3*q^111 + 8*q^112 + 9*q^113 - q^115 - 8*q^117
- 10*q^118 + 4*q^119 - 10*q^121 - 24*q^122 + 8*q^123 + 14*q^124 - 9*q^125 - 
8*q^126 + 8*q^127 + 6*q^129 - 8*q^130 - 18*q^131 + 20*q^132 + 14*q^134 + 5*q^135
- 7*q^137 - 2*q^138 + 10*q^139 - 4*q^140 - 8*q^141 + 6*q^142 - 40*q^143 + 
8*q^144 - 8*q^146 + 3*q^147 + 6*q^148 - 10*q^149 - 8*q^150 + 2*q^151 + 4*q^153 -
40*q^154 + 7*q^155 - 8*q^156 - 7*q^157 + 20*q^158 + 6*q^159 + 8*q^160 + 2*q^161 
- 2*q^162 + 4*q^163 - 16*q^164 + 10*q^165 + 12*q^166 - 12*q^167 + 3*q^169 + 
4*q^170 - 12*q^172 - 6*q^173 + 8*q^175 + 40*q^176 - 5*q^177 - 30*q^178 - 
15*q^179 - 4*q^180 + 7*q^181 + 16*q^182 - 12*q^183 + 3*q^185 + 14*q^186 + 
20*q^187 + 16*q^188 - 10*q^189 + 17*q^191 + 8*q^192 + 4*q^193 + 14*q^194 - 
4*q^195 - 6*q^196 - 2*q^197 - 40*q^198 + 7*q^201 - 4*q^202 + 4*q^204 - 8*q^205 +
32*q^206 + 2*q^207 - 16*q^208 - 4*q^210 + 12*q^211 - 12*q^212 + 3*q^213 - 
36*q^214 - 6*q^215 - 14*q^217 - 20*q^218 - 4*q^219 - 20*q^220 - 8*q^221 + 
6*q^222 + 19*q^223 - 16*q^224 + 8*q^225 - 18*q^226 + 18*q^227 + 15*q^229 + 
2*q^230 - 20*q^231 + 24*q^233 + 16*q^234 + 8*q^235 + 10*q^236 + 10*q^237 - 
8*q^238 - 30*q^239 + 4*q^240 - 8*q^241 + 20*q^242 - 16*q^243 + 24*q^244 - 
3*q^245 - 16*q^246 + 6*q^249 + 18*q^250 - 23*q^251 + 8*q^252 + 10*q^253 - 
16*q^254 + 2*q^255 + 16*q^256 - 2*q^257 - 12*q^258 - 6*q^259 + 8*q^260 + 
36*q^262 + 14*q^263 - 6*q^265 - 15*q^267 - 14*q^268 + 10*q^269 - 10*q^270 - 
28*q^271 + 8*q^272 + 8*q^273 + 14*q^274 + 40*q^275 + 2*q^276 - 2*q^277 - 
20*q^278 - 14*q^279 - 18*q^281 + 16*q^282 + 4*q^283 - 6*q^284 + 80*q^286 + 
16*q^287 - 16*q^288 - 13*q^289 + 7*q^291 + 8*q^292 + 24*q^293 - 6*q^294 + 
5*q^295 - 50*q^297 + 20*q^298 - 4*q^299 + 8*q^300 + 12*q^301 - 4*q^302 - 2*q^303
+ 12*q^305 - 8*q^306 + 8*q^307 + 40*q^308 + 16*q^309 - 14*q^310 + 12*q^311 - 
q^313 + 14*q^314 + 4*q^315 - 20*q^316 + 13*q^317 - 12*q^318 - 8*q^320 - 18*q^321
- 4*q^322 + 2*q^324 - 16*q^325 - 8*q^326 - 10*q^327 - 16*q^329 - 20*q^330 + 
7*q^331 - 12*q^332 - 6*q^333 + 24*q^334 - 7*q^335 - 8*q^336 - 22*q^337 - 6*q^338
- 9*q^339 - 4*q^340 - 70*q^341 + 20*q^343 + q^345 + 12*q^346 + 28*q^347 + 
30*q^349 - 16*q^350 + 20*q^351 - 80*q^352 - 21*q^353 + 10*q^354 - 3*q^355 + 
30*q^356 - 4*q^357 + 30*q^358 - 20*q^359 - 19*q^361 - 14*q^362 + 10*q^363 - 
16*q^364 + 4*q^365 + 24*q^366 - 17*q^367 + 4*q^368 + 16*q^369 - 6*q^370 + 
12*q^371 - 14*q^372 - 26*q^373 - 40*q^374 + 9*q^375 + 20*q^378 - 5*q^379 - 
8*q^381 - 34*q^382 - q^383 + 20*q^385 - 8*q^386 + 12*q^387 - 14*q^388 - 15*q^389
+ 8*q^390 + 2*q^391 + 18*q^393 + 4*q^394 - 10*q^395 + 40*q^396 - 2*q^397 + 
16*q^400 + 2*q^401 - 14*q^402 + 28*q^403 + 4*q^404 + q^405 - 30*q^407 - 30*q^409
+ 16*q^410 + 7*q^411 - 32*q^412 - 10*q^413 - 4*q^414 - 6*q^415 + 32*q^416 - 
10*q^417 + 20*q^419 + 4*q^420 + 22*q^421 - 24*q^422 - 16*q^423 + 8*q^425 - 
6*q^426 - 24*q^427 + 36*q^428 + 40*q^429 + 12*q^430 - 18*q^431 - 20*q^432 - 
11*q^433 + 28*q^434 + 20*q^436 + 8*q^438 + 40*q^439 + 6*q^441 + 16*q^442 - 
11*q^443 - 6*q^444 + 15*q^445 - 38*q^446 + 10*q^447 + 16*q^448 + 35*q^449 - 
16*q^450 + 80*q^451 + 18*q^452 - 2*q^453 - 36*q^454 - 8*q^455 - 12*q^457 - 
30*q^458 - 10*q^459 - 2*q^460 + 12*q^461 + 40*q^462 - 11*q^463 - 7*q^465 - 
48*q^466 - 27*q^467 - 16*q^468 + 14*q^469 - 16*q^470 + 7*q^471 + 60*q^473 - 
20*q^474 + 8*q^476 + 12*q^477 + 60*q^478 + 20*q^479 - 8*q^480 + 12*q^481 + 
16*q^482 - 2*q^483 - 20*q^484 - 7*q^485 + 32*q^486 + 23*q^487 - 4*q^489 + 
6*q^490 - 8*q^491 + 16*q^492 + 20*q^495 - 28*q^496 + 6*q^497 - 12*q^498 + 
20*q^499 - 18*q^500 + 12*q^501 + 46*q^502 - 26*q^503 + 2*q^505 - 20*q^506 - 
3*q^507 + 16*q^508 + 15*q^509 - 4*q^510 - 8*q^511 - 32*q^512 + 4*q^514 - 
16*q^515 + 12*q^516 - 80*q^517 + 12*q^518 + 6*q^519 - 3*q^521 - 16*q^523 - 
36*q^524 - 8*q^525 - 28*q^526 - 14*q^527 - 40*q^528 - 22*q^529 + 12*q^530 - 
10*q^531 - 32*q^533 + 30*q^534 + 18*q^535 + 15*q^537 - 20*q^538 + 30*q^539 + 
10*q^540 - 8*q^541 + 56*q^542 - 7*q^543 - 16*q^544 + 10*q^545 - 16*q^546 + 
8*q^547 - 14*q^548 - 24*q^549 + O(q^550), q - q^3 - 2*q^4 - 3*q^5 - 2*q^9 + 
2*q^12 + 3*q^15 + 4*q^16 + 6*q^20 - 9*q^23 + 4*q^25 + 5*q^27 - 5*q^31 + 4*q^36 +
7*q^37 + 6*q^45 - 12*q^47 - 4*q^48 - 7*q^49 + 6*q^53 - 15*q^59 - 6*q^60 - 8*q^64
+ 13*q^67 + 9*q^69 - 3*q^71 - 4*q^75 - 12*q^80 + q^81 - 9*q^89 + 18*q^92 + 
5*q^93 + 17*q^97 - 8*q^100 - 4*q^103 - 10*q^108 - 7*q^111 + 21*q^113 + 27*q^115 
+ 10*q^124 + 3*q^125 - 15*q^135 - 3*q^137 + 12*q^141 - 8*q^144 + 7*q^147 - 
14*q^148 + 15*q^155 - 23*q^157 - 6*q^159 - 16*q^163 - 13*q^169 + 15*q^177 + 
21*q^179 - 12*q^180 - 25*q^181 - 21*q^185 + 24*q^188 - 15*q^191 + 8*q^192 + 
14*q^196 - 20*q^199 - 13*q^201 + 18*q^207 - 12*q^212 + 3*q^213 - q^223 - 8*q^225
- 5*q^229 + 36*q^235 + 30*q^236 + 12*q^240 - 16*q^243 + 21*q^245 - 27*q^251 + 
16*q^256 + 18*q^257 - 18*q^265 + 9*q^267 - 26*q^268 + 30*q^269 - 18*q^276 + 
10*q^279 + 6*q^284 - 17*q^289 - 17*q^291 + 45*q^295 + 8*q^300 + 4*q^309 - 
12*q^311 + 19*q^313 - 27*q^317 + 24*q^320 - 2*q^324 + 35*q^331 - 14*q^333 - 
39*q^335 - 21*q^339 - 27*q^345 - 9*q^353 + 9*q^355 + 18*q^356 - 19*q^361 - 
37*q^367 - 36*q^368 - 10*q^372 - 3*q^375 - 25*q^379 + 39*q^383 - 34*q^388 - 
15*q^389 + 2*q^397 + 16*q^400 + 30*q^401 - 3*q^405 + 3*q^411 + 8*q^412 + 
24*q^419 + 10*q^421 + 24*q^423 + 20*q^432 + 29*q^433 + 14*q^441 + 21*q^443 + 
14*q^444 + 27*q^445 + 39*q^449 - 42*q^452 - 54*q^460 - 31*q^463 - 15*q^465 - 
3*q^467 + 23*q^471 - 12*q^477 - 51*q^485 + 43*q^487 + 16*q^489 - 20*q^496 + 
40*q^499 - 6*q^500 + 13*q^507 - 45*q^509 + 12*q^515 - 15*q^521 + 58*q^529 + 
30*q^531 - 21*q^537 + 30*q^540 + 25*q^543 + 6*q^548 + O(q^550)] ;
              P_Q<[x]> := ProjectiveSpace(Rationals(), 1);
              X_11A2 := Curve(P_Q, [ PolynomialRing(ext<K|Polynomial(K, [1, 3, 
-3, -4, 1, 1])> where K is RationalField(), 2) |
0
]);
