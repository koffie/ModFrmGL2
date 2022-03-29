
    /****************************************************
    Loading this file in magma loads the objects fs_20E3 
    and X_20E3. fs_20E3 is a list of power series which form 
    a basis for the space of cusp forms. X_20E3 is a 
    representation of the corresponding modular curve in 
    projective space
    *****************************************************/

              F := RationalField();     
              f<x> := Polynomial(F, [ RationalField() | 5, 0, -5, 0, 1 ]);
              K<zeta> := ext<F|f>;
              Kq<q> := PowerSeriesRing(K);
              fs_20E3 := [Kq | 1/3*(-zeta^2 + 3)*q^4 + 1/3*(zeta^2 - 2)*q^8 + 
1/3*(-zeta^2 + 2)*q^12 + 1/3*(-zeta^2 + 3)*q^16 + 1/3*(zeta^2 - 3)*q^24 + 
1/3*(-2*zeta^2 + 4)*q^28 + 1/3*(zeta^2 - 2)*q^32 + 1/3*(2*zeta^2 - 6)*q^36 + 
(zeta^2 - 3)*q^44 + 1/3*(-zeta^2 + 2)*q^48 + 1/3*(4*zeta^2 - 8)*q^52 + 
1/3*(2*zeta^2 - 6)*q^56 + 1/3*(-zeta^2 + 3)*q^64 + (zeta^2 - 2)*q^68 + 
1/3*(-2*zeta^2 + 4)*q^72 + 1/3*(-5*zeta^2 + 15)*q^76 + 1/3*(-2*zeta^2 + 6)*q^84 
+ (-zeta^2 + 2)*q^88 + (-2*zeta^2 + 4)*q^92 + 1/3*(zeta^2 - 3)*q^96 + 
1/3*(-4*zeta^2 + 12)*q^104 + 1/3*(5*zeta^2 - 10)*q^108 + 1/3*(-2*zeta^2 + 
4)*q^112 + 1/3*(-2*zeta^2 + 6)*q^124 + 1/3*(zeta^2 - 2)*q^128 + (zeta^2 - 
2)*q^132 + (-zeta^2 + 3)*q^136 + 1/3*(2*zeta^2 - 6)*q^144 + 1/3*(-2*zeta^2 + 
4)*q^148 + 1/3*(5*zeta^2 - 10)*q^152 + 1/3*(4*zeta^2 - 12)*q^156 + (zeta^2 - 
3)*q^164 + 1/3*(2*zeta^2 - 4)*q^168 + 1/3*(4*zeta^2 - 8)*q^172 + (zeta^2 - 
3)*q^176 + (2*zeta^2 - 6)*q^184 + (-4*zeta^2 + 8)*q^188 + 1/3*(-zeta^2 + 
2)*q^192 + (zeta^2 - 3)*q^196 + (zeta^2 - 3)*q^204 + 1/3*(4*zeta^2 - 8)*q^208 + 
(-2*zeta^2 + 4)*q^212 + 1/3*(-5*zeta^2 + 15)*q^216 + 1/3*(2*zeta^2 - 6)*q^224 + 
1/3*(-5*zeta^2 + 10)*q^228 + 1/3*(-2*zeta^2 + 6)*q^244 + 1/3*(2*zeta^2 - 
4)*q^248 + 1/3*(4*zeta^2 - 8)*q^252 + 1/3*(-zeta^2 + 3)*q^256 + (-zeta^2 + 
3)*q^264 + 1/3*(13*zeta^2 - 26)*q^268 + (zeta^2 - 2)*q^272 + (-2*zeta^2 + 
6)*q^276 + (-4*zeta^2 + 12)*q^284 + 1/3*(-2*zeta^2 + 4)*q^288 + 1/3*(-11*zeta^2 
+ 22)*q^292 + 1/3*(2*zeta^2 - 6)*q^296 + 1/3*(-5*zeta^2 + 15)*q^304 + (2*zeta^2 
- 4)*q^308 + 1/3*(-4*zeta^2 + 8)*q^312 + 1/3*(10*zeta^2 - 30)*q^316 + 
1/3*(-zeta^2 + 3)*q^324 + (-zeta^2 + 2)*q^328 + (3*zeta^2 - 6)*q^332 + 
1/3*(-2*zeta^2 + 6)*q^336 + 1/3*(-4*zeta^2 + 12)*q^344 + (-zeta^2 + 2)*q^352 + 
(-5*zeta^2 + 15)*q^356 + 1/3*(8*zeta^2 - 24)*q^364 + (-2*zeta^2 + 4)*q^368 + 
1/3*(-2*zeta^2 + 4)*q^372 + (4*zeta^2 - 12)*q^376 + 1/3*(zeta^2 - 3)*q^384 + 
1/3*(-2*zeta^2 + 4)*q^388 + (-zeta^2 + 2)*q^392 + (-2*zeta^2 + 6)*q^396 + 
(6*zeta^2 - 18)*q^404 + (-zeta^2 + 2)*q^408 + 1/3*(4*zeta^2 - 8)*q^412 + 
1/3*(-4*zeta^2 + 12)*q^416 + (2*zeta^2 - 6)*q^424 + (zeta^2 - 2)*q^428 + 
1/3*(5*zeta^2 - 10)*q^432 + 1/3*(10*zeta^2 - 30)*q^436 + 1/3*(-2*zeta^2 + 
6)*q^444 + 1/3*(-2*zeta^2 + 4)*q^448 + (3*zeta^2 - 6)*q^452 + 1/3*(5*zeta^2 - 
15)*q^456 + 1/3*(-8*zeta^2 + 16)*q^468 + (2*zeta^2 - 6)*q^476 + 1/3*(2*zeta^2 - 
6)*q^484 + 1/3*(2*zeta^2 - 4)*q^488 + (zeta^2 - 2)*q^492 + 1/3*(-2*zeta^2 + 
6)*q^496 + 1/3*(-4*zeta^2 + 12)*q^504 + 1/3*(-2*zeta^2 + 4)*q^508 + 1/3*(zeta^2 
- 2)*q^512 + 1/3*(4*zeta^2 - 12)*q^516 + (-4*zeta^2 + 12)*q^524 + (zeta^2 - 
2)*q^528 + 1/3*(-10*zeta^2 + 20)*q^532 + 1/3*(-13*zeta^2 + 39)*q^536 + (-zeta^2 
+ 3)*q^544 + (zeta^2 - 2)*q^548 + (2*zeta^2 - 4)*q^552 + 1/3*(-5*zeta^2 + 
15)*q^556 + (-4*zeta^2 + 12)*q^564 + (4*zeta^2 - 8)*q^568 + (-4*zeta^2 + 
8)*q^572 + 1/3*(2*zeta^2 - 6)*q^576 + 1/3*(11*zeta^2 - 33)*q^584 + (zeta^2 - 
2)*q^588 + 1/3*(-2*zeta^2 + 4)*q^592 + 1/3*(-2*zeta^2 + 6)*q^604 + 1/3*(5*zeta^2
- 10)*q^608 + (-2*zeta^2 + 4)*q^612 + (-2*zeta^2 + 6)*q^616 + 1/3*(4*zeta^2 - 
12)*q^624 + 1/3*(-2*zeta^2 + 4)*q^628 + 1/3*(-10*zeta^2 + 20)*q^632 + (-2*zeta^2
+ 6)*q^636 + (-4*zeta^2 + 12)*q^644 + 1/3*(zeta^2 - 2)*q^648 + 1/3*(-11*zeta^2 +
22)*q^652 + (zeta^2 - 3)*q^656 + (-3*zeta^2 + 9)*q^664 + (-4*zeta^2 + 8)*q^668 +
1/3*(2*zeta^2 - 4)*q^672 + (-zeta^2 + 3)*q^676 + 1/3*(10*zeta^2 - 30)*q^684 + 
1/3*(4*zeta^2 - 8)*q^688 + (8*zeta^2 - 16)*q^692 + (zeta^2 - 3)*q^704 + 
(5*zeta^2 - 10)*q^712 + (5*zeta^2 - 15)*q^716 + 1/3*(-2*zeta^2 + 6)*q^724 + 
1/3*(-8*zeta^2 + 16)*q^728 + 1/3*(-2*zeta^2 + 4)*q^732 + (2*zeta^2 - 6)*q^736 + 
1/3*(2*zeta^2 - 6)*q^744 + (-3*zeta^2 + 6)*q^748 + (-4*zeta^2 + 8)*q^752 + 
1/3*(10*zeta^2 - 30)*q^756 + O(q^760), 1/2*(-zeta^2 + 2)*q^4 + (-zeta^2 + 
3)*q^12 + 3/2*q^20 + (zeta^2 - 3)*q^28 + 1/2*(-zeta^2 + 2)*q^36 + (zeta^2 - 
3)*q^52 - 3*q^60 + (-3*zeta^2 + 9)*q^68 + (2*zeta^2 - 4)*q^76 + (2*zeta^2 - 
4)*q^84 + (3*zeta^2 - 9)*q^92 - 3/2*q^100 + (2*zeta^2 - 6)*q^108 + (-3*zeta^2 + 
6)*q^116 + (2*zeta^2 - 4)*q^124 + 3*q^140 + (zeta^2 - 3)*q^148 + (2*zeta^2 - 
4)*q^156 + (-3*zeta^2 + 6)*q^164 + (-5*zeta^2 + 15)*q^172 + 3/2*q^180 + 
(-3*zeta^2 + 9)*q^188 + 1/2*(3*zeta^2 - 6)*q^196 + (-6*zeta^2 + 12)*q^204 + 
(-3*zeta^2 + 9)*q^212 + (4*zeta^2 - 12)*q^228 + (-6*zeta^2 + 12)*q^236 + 
(-zeta^2 + 2)*q^244 + (zeta^2 - 3)*q^252 + 3*q^260 + (zeta^2 - 3)*q^268 + 
(6*zeta^2 - 12)*q^276 + (6*zeta^2 - 12)*q^284 + (zeta^2 - 3)*q^292 + 3*q^300 + 
(-4*zeta^2 + 8)*q^316 + 1/2*(11*zeta^2 - 22)*q^324 + (3*zeta^2 - 9)*q^332 - 
9*q^340 + (-6*zeta^2 + 18)*q^348 + (3*zeta^2 - 6)*q^356 + (-2*zeta^2 + 4)*q^364 
+ (4*zeta^2 - 12)*q^372 - 6*q^380 + (zeta^2 - 3)*q^388 + (-3*zeta^2 + 6)*q^404 +
(7*zeta^2 - 21)*q^412 - 6*q^420 + (-3*zeta^2 + 9)*q^428 + (-zeta^2 + 2)*q^436 + 
(2*zeta^2 - 4)*q^444 + (-3*zeta^2 + 9)*q^452 + 9*q^460 + (zeta^2 - 3)*q^468 + 
(6*zeta^2 - 12)*q^476 + 1/2*(11*zeta^2 - 22)*q^484 + (-6*zeta^2 + 18)*q^492 + 
3/2*q^500 + (zeta^2 - 3)*q^508 + (-10*zeta^2 + 20)*q^516 + (-4*zeta^2 + 
12)*q^532 + 6*q^540 + (9*zeta^2 - 27)*q^548 + (2*zeta^2 - 4)*q^556 + (-6*zeta^2 
+ 12)*q^564 + 9*q^580 + (3*zeta^2 - 9)*q^588 + (3*zeta^2 - 6)*q^596 + 
(-10*zeta^2 + 20)*q^604 + (-3*zeta^2 + 9)*q^612 - 6*q^620 + (-11*zeta^2 + 
33)*q^628 + (-6*zeta^2 + 12)*q^636 + (-6*zeta^2 + 12)*q^644 + (-5*zeta^2 + 
15)*q^652 + (9*zeta^2 - 27)*q^668 + 1/2*(9*zeta^2 - 18)*q^676 + (2*zeta^2 - 
4)*q^684 + (-3*zeta^2 + 9)*q^692 - 3*q^700 + (-12*zeta^2 + 36)*q^708 + (6*zeta^2
- 12)*q^716 + (5*zeta^2 - 10)*q^724 + (-2*zeta^2 + 6)*q^732 + 3*q^740 + 
(-4*zeta^2 + 8)*q^756 + O(q^760), 1/5*(-zeta^2 + 5)*q^4 + 3/5*zeta^2*q^8 + 
1/5*zeta^2*q^12 + 1/5*(3*zeta^2 - 15)*q^16 + 1/5*(-3*zeta^2 + 15)*q^24 + 
2/5*zeta^2*q^28 + 3/5*zeta^2*q^32 + 1/5*(2*zeta^2 - 10)*q^36 + 1/5*(3*zeta^2 - 
15)*q^44 - 3/5*zeta^2*q^48 - 4/5*zeta^2*q^52 + 1/5*(-6*zeta^2 + 30)*q^56 + 
1/5*(3*zeta^2 - 15)*q^64 - 3/5*zeta^2*q^68 - 6/5*zeta^2*q^72 + (-zeta^2 + 
5)*q^76 + 1/5*(-2*zeta^2 + 10)*q^84 - 9/5*zeta^2*q^88 + 6/5*zeta^2*q^92 + 
1/5*(-3*zeta^2 + 15)*q^96 + 1/5*(12*zeta^2 - 60)*q^104 - zeta^2*q^108 - 
6/5*zeta^2*q^112 + 1/5*(-2*zeta^2 + 10)*q^124 + 3/5*zeta^2*q^128 - 
3/5*zeta^2*q^132 + 1/5*(9*zeta^2 - 45)*q^136 + 1/5*(-6*zeta^2 + 30)*q^144 + 
2/5*zeta^2*q^148 + 3*zeta^2*q^152 + 1/5*(4*zeta^2 - 20)*q^156 + 1/5*(3*zeta^2 - 
15)*q^164 + 6/5*zeta^2*q^168 - 4/5*zeta^2*q^172 + 1/5*(-9*zeta^2 + 45)*q^176 + 
1/5*(-18*zeta^2 + 90)*q^184 + 12/5*zeta^2*q^188 - 3/5*zeta^2*q^192 + 
1/5*(3*zeta^2 - 15)*q^196 + 1/5*(3*zeta^2 - 15)*q^204 + 12/5*zeta^2*q^208 + 
6/5*zeta^2*q^212 + (3*zeta^2 - 15)*q^216 + 1/5*(-6*zeta^2 + 30)*q^224 + 
zeta^2*q^228 + 1/5*(-2*zeta^2 + 10)*q^244 + 6/5*zeta^2*q^248 - 4/5*zeta^2*q^252 
+ 1/5*(3*zeta^2 - 15)*q^256 + 1/5*(9*zeta^2 - 45)*q^264 - 13/5*zeta^2*q^268 + 
9/5*zeta^2*q^272 + 1/5*(-6*zeta^2 + 30)*q^276 + 1/5*(-12*zeta^2 + 60)*q^284 - 
6/5*zeta^2*q^288 + 11/5*zeta^2*q^292 + 1/5*(-6*zeta^2 + 30)*q^296 + (3*zeta^2 - 
15)*q^304 - 6/5*zeta^2*q^308 - 12/5*zeta^2*q^312 + (2*zeta^2 - 10)*q^316 + 
1/5*(-zeta^2 + 5)*q^324 - 9/5*zeta^2*q^328 - 9/5*zeta^2*q^332 + 1/5*(6*zeta^2 - 
30)*q^336 + 1/5*(12*zeta^2 - 60)*q^344 - 9/5*zeta^2*q^352 + (-3*zeta^2 + 
15)*q^356 + 1/5*(8*zeta^2 - 40)*q^364 - 18/5*zeta^2*q^368 + 2/5*zeta^2*q^372 + 
1/5*(-36*zeta^2 + 180)*q^376 + 1/5*(-3*zeta^2 + 15)*q^384 + 2/5*zeta^2*q^388 - 
9/5*zeta^2*q^392 + 1/5*(-6*zeta^2 + 30)*q^396 + 1/5*(18*zeta^2 - 90)*q^404 - 
9/5*zeta^2*q^408 - 4/5*zeta^2*q^412 + 1/5*(12*zeta^2 - 60)*q^416 + 
1/5*(-18*zeta^2 + 90)*q^424 - 3/5*zeta^2*q^428 + 3*zeta^2*q^432 + (2*zeta^2 - 
10)*q^436 + 1/5*(-2*zeta^2 + 10)*q^444 - 6/5*zeta^2*q^448 - 9/5*zeta^2*q^452 + 
(-3*zeta^2 + 15)*q^456 + 8/5*zeta^2*q^468 + 1/5*(6*zeta^2 - 30)*q^476 + 
1/5*(2*zeta^2 - 10)*q^484 + 6/5*zeta^2*q^488 - 3/5*zeta^2*q^492 + 1/5*(6*zeta^2 
- 30)*q^496 + 1/5*(12*zeta^2 - 60)*q^504 + 2/5*zeta^2*q^508 + 3/5*zeta^2*q^512 +
1/5*(4*zeta^2 - 20)*q^516 + 1/5*(-12*zeta^2 + 60)*q^524 + 9/5*zeta^2*q^528 + 
2*zeta^2*q^532 + 1/5*(39*zeta^2 - 195)*q^536 + 1/5*(9*zeta^2 - 45)*q^544 - 
3/5*zeta^2*q^548 + 18/5*zeta^2*q^552 + (-zeta^2 + 5)*q^556 + 1/5*(-12*zeta^2 + 
60)*q^564 + 36/5*zeta^2*q^568 + 12/5*zeta^2*q^572 + 1/5*(-6*zeta^2 + 30)*q^576 +
1/5*(-33*zeta^2 + 165)*q^584 - 3/5*zeta^2*q^588 - 6/5*zeta^2*q^592 + 
1/5*(-2*zeta^2 + 10)*q^604 + 3*zeta^2*q^608 + 6/5*zeta^2*q^612 + 1/5*(18*zeta^2 
- 90)*q^616 + 1/5*(-12*zeta^2 + 60)*q^624 + 2/5*zeta^2*q^628 - 6*zeta^2*q^632 + 
1/5*(-6*zeta^2 + 30)*q^636 + 1/5*(-12*zeta^2 + 60)*q^644 + 3/5*zeta^2*q^648 + 
11/5*zeta^2*q^652 + 1/5*(-9*zeta^2 + 45)*q^656 + 1/5*(27*zeta^2 - 135)*q^664 + 
12/5*zeta^2*q^668 + 6/5*zeta^2*q^672 + 1/5*(-3*zeta^2 + 15)*q^676 + (2*zeta^2 - 
10)*q^684 + 12/5*zeta^2*q^688 - 24/5*zeta^2*q^692 + 1/5*(-9*zeta^2 + 45)*q^704 +
9*zeta^2*q^712 + (3*zeta^2 - 15)*q^716 + 1/5*(-2*zeta^2 + 10)*q^724 - 
24/5*zeta^2*q^728 + 2/5*zeta^2*q^732 + 1/5*(-18*zeta^2 + 90)*q^736 + 
1/5*(-6*zeta^2 + 30)*q^744 + 9/5*zeta^2*q^748 - 36/5*zeta^2*q^752 + (2*zeta^2 - 
10)*q^756 + O(q^760)] ;
              P_Q<[x]> := ProjectiveSpace(Rationals(), 2);
              X_20E3 := Curve(P_Q, [ PolynomialRing(RationalField(), 3) |
x[1]^4 + 16/9*x[1]^2*x[2]^2 - 100/27*x[1]^2*x[2]*x[3] + 10/27*x[1]^2*x[3]^2 - 
512/2187*x[2]^4 + 80/243*x[2]^2*x[3]^2 + 500/2187*x[2]*x[3]^3 + 25/729*x[3]^4
]);
