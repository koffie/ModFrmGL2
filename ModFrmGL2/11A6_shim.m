
    /****************************************************
    Loading this file in magma loads the objects fs_11A6_shim 
    and X_11A6_shim. fs_11A6_shim is a list of power series which form 
    a basis for the space of cusp forms. X_11A6_shim is a 
    representation of the corresponding modular curve in 
    projective space
    *****************************************************/

              F := RationalField();     
              f<x> := Polynomial(F, [ RationalField() | -1, 1 ]);
              K<zeta> := ext<F|f>;
              Kq<q> := PowerSeriesRing(K);
              fs_11A6_shim := [Kq | q - q^9 - q^12 + q^14 + q^15 - q^16 + 2*q^20
- 2*q^23 - 2*q^25 - 3*q^26 + 2*q^27 + q^31 - q^36 + 2*q^37 + 2*q^38 - 3*q^42 + 
q^45 + q^47 - 4*q^49 + 2*q^53 + O(q^56), q - q^9 - q^12 + q^14 + q^15 - q^16 + 
2*q^20 - 2*q^23 - 2*q^25 - 3*q^26 + 2*q^27 + q^31 - q^36 + 2*q^37 + 2*q^38 - 
3*q^42 + q^45 + q^47 - 4*q^49 + 2*q^53 + O(q^56), q^2 - q^8 + q^10 - q^13 - q^17
- q^18 + 2*q^19 - 2*q^21 - 2*q^24 + 2*q^28 + 3*q^29 - q^32 + 2*q^39 - q^40 + 
q^41 + 2*q^43 - 4*q^50 - 4*q^51 - 3*q^52 + 2*q^54 + O(q^56), q^3 + q^5 + q^9 - 
q^12 - q^14 - q^16 - 2*q^20 + 3*q^23 - 2*q^25 + q^26 - 3*q^27 - 2*q^34 - q^36 - 
3*q^37 + 2*q^38 - q^42 - q^45 + 3*q^47 + q^49 + 2*q^53 + O(q^56), q^4 + q^5 - 
q^12 + q^14 - q^15 - 2*q^16 - q^20 + 2*q^23 - 2*q^25 - 2*q^26 + 3*q^31 + q^34 - 
2*q^36 - q^37 - q^42 - 2*q^45 + 5*q^47 + 2*q^48 + q^49 - 3*q^53 + O(q^56), q^6 -
q^7 - q^8 + q^13 - 2*q^17 + q^18 + 2*q^19 - q^21 - 2*q^24 + 3*q^29 + q^30 + 
3*q^32 - q^35 - q^40 - 3*q^41 - q^43 + q^46 - 3*q^51 + q^52 - 3*q^54 + O(q^56), 
q^11 - 2*q^22 - q^33 + 2*q^44 + q^55 + O(q^56)] ;
              P_Q<[x]> := ProjectiveSpace(Rationals(), 5);
              X_11A6_shim := Curve(P_Q, [ PolynomialRing(RationalField(), 6) |
x[1]*x[3] - x[2]^2 - 41*x[2]*x[6] - x[3]^2 - 4*x[3]*x[5] - 12*x[3]*x[6] + 
2*x[4]^2 - 8*x[4]*x[5] + 32*x[4]*x[6] - 15*x[5]^2 + 5*x[5]*x[6] - 20*x[6]^2,
x[1]*x[4] - x[2]*x[3] - 24*x[2]*x[6] - x[3]^2 + x[3]*x[4] - 3*x[3]*x[5] - 
8*x[3]*x[6] + x[4]^2 - 4*x[4]*x[5] + 20*x[4]*x[6] - 9*x[5]^2 + 2*x[5]*x[6] - 
11*x[6]^2,
x[1]*x[5] - 20*x[2]*x[6] - x[3]*x[4] - 2*x[3]*x[5] - 8*x[3]*x[6] + 2*x[4]^2 - 
3*x[4]*x[5] + 18*x[4]*x[6] - 8*x[5]^2 + 3*x[5]*x[6] - 2*x[6]^2,
x[1]*x[6] - 2*x[2]*x[6] - x[3]*x[6] + 2*x[4]*x[6] - x[5]^2,
x[2]*x[4] - 37*x[2]*x[6] - x[3]^2 - x[3]*x[4] - 5*x[3]*x[5] - 11*x[3]*x[6] + 
3*x[4]^2 - 6*x[4]*x[5] + 29*x[4]*x[6] - 14*x[5]^2 + 4*x[5]*x[6] - 8*x[6]^2,
x[2]*x[5] + 34*x[2]*x[6] + 3*x[3]*x[5] + 14*x[3]*x[6] - x[4]^2 + 5*x[4]*x[5] - 
31*x[4]*x[6] + 13*x[5]^2 - 3*x[5]*x[6] + 12*x[6]^2,
x[1]^2*x[3] - x[1]*x[2]^2 - x[2]^2*x[3] + x[3]^3 - 208*x[3]^2*x[6] - 
6*x[3]*x[4]^2 - 25*x[3]*x[4]*x[5] - 4943/22*x[3]*x[4]*x[6] - 10*x[3]*x[5]^2 - 
9213/22*x[3]*x[5]*x[6] + 9300/11*x[3]*x[6]^2 + 12*x[4]^3 - 23*x[4]^2*x[5] + 
5420/11*x[4]^2*x[6] - 92*x[4]*x[5]^2 + 1865/22*x[4]*x[5]*x[6] - 
11126/11*x[4]*x[6]^2 - 1877/22*x[5]^3 + 647/11*x[5]^2*x[6] + 1499/22*x[5]*x[6]^2
+ 8297/11*x[6]^3,
x[1]^2*x[4] - x[2]^3 - x[2]^2*x[3] + x[3]^3 - 33*x[3]^2*x[6] - 3*x[3]*x[4]^2 - 
7*x[3]*x[4]*x[5] - 5279/88*x[3]*x[4]*x[6] - 12*x[3]*x[5]^2 - 
5449/88*x[3]*x[5]*x[6] + 2781/22*x[3]*x[6]^2 + 3*x[4]^3 + 3*x[4]^2*x[5] + 
2529/22*x[4]^2*x[6] - 27*x[4]*x[5]^2 + 1511/88*x[4]*x[5]*x[6] - 
1704/11*x[4]*x[6]^2 - 1057/88*x[5]^3 + 413/44*x[5]^2*x[6] + 2015/88*x[5]*x[6]^2 
+ 12509/44*x[6]^3,
x[1]^2*x[5] - x[2]*x[3]^2 + x[3]^3 + 3*x[3]^2*x[4] - 154*x[3]^2*x[6] - 
6*x[3]*x[4]^2 - 18*x[3]*x[4]*x[5] - 4005/22*x[3]*x[4]*x[6] - 16*x[3]*x[5]^2 - 
6717/22*x[3]*x[5]*x[6] + 6747/11*x[3]*x[6]^2 + 7*x[4]^3 - 11*x[4]^2*x[5] + 
4292/11*x[4]^2*x[6] - 75*x[4]*x[5]^2 + 1261/22*x[4]*x[5]*x[6] - 
8111/11*x[4]*x[6]^2 - 1341/22*x[5]^3 + 478/11*x[5]^2*x[6] + 1571/22*x[5]*x[6]^2 
+ 7181/11*x[6]^3,
x[1]^2*x[6] - 5*x[3]^2*x[6] - x[3]*x[4]*x[5] - 173/22*x[3]*x[4]*x[6] - 
x[3]*x[5]^2 - 243/22*x[3]*x[5]*x[6] + 230/11*x[3]*x[6]^2 + 170/11*x[4]^2*x[6] - 
3*x[4]*x[5]^2 + 45/22*x[4]*x[5]*x[6] - 296/11*x[4]*x[6]^2 - 47/22*x[5]^3 + 
18/11*x[5]^2*x[6] + 105/22*x[5]*x[6]^2 + 347/11*x[6]^3,
x[1]*x[2]*x[3] - x[2]^3 - x[2]*x[3]^2 + 2*x[3]^2*x[4] + 68*x[3]^2*x[6] - 
2*x[3]*x[4]^2 + 6*x[3]*x[4]*x[5] + 5219/88*x[3]*x[4]*x[6] - 4*x[3]*x[5]^2 + 
12509/88*x[3]*x[5]*x[6] - 6445/22*x[3]*x[6]^2 - 2*x[4]^3 + 13*x[4]^2*x[5] - 
3041/22*x[4]^2*x[6] + 21*x[4]*x[5]^2 - 2147/88*x[4]*x[5]*x[6] + 
3811/11*x[4]*x[6]^2 + 2613/88*x[5]^3 - 817/44*x[5]^2*x[6] - 1387/88*x[5]*x[6]^2 
- 5809/44*x[6]^3,
x[1]*x[2]*x[4] - x[2]^2*x[3] - x[2]*x[3]^2 + x[3]^3 + 2*x[3]^2*x[4] - 
147*x[3]^2*x[6] - 5*x[3]*x[4]^2 - 18*x[3]*x[4]*x[5] - 1918/11*x[3]*x[4]*x[6] - 
14*x[3]*x[5]^2 - 3207/11*x[3]*x[5]*x[6] + 6467/11*x[3]*x[6]^2 + 7*x[4]^3 - 
11*x[4]^2*x[5] + 4097/11*x[4]^2*x[6] - 72*x[4]*x[5]^2 + 611/11*x[4]*x[5]*x[6] - 
7787/11*x[4]*x[6]^2 - 645/11*x[5]^3 + 458/11*x[5]^2*x[6] + 696/11*x[5]*x[6]^2 + 
6837/11*x[6]^3,
x[1]*x[2]*x[5] - x[3]^3 + x[3]^2*x[4] + 160*x[3]^2*x[6] + 3*x[3]*x[4]^2 + 
19*x[3]*x[4]*x[5] + 3829/22*x[3]*x[4]*x[6] + 11*x[3]*x[5]^2 + 
7069/22*x[3]*x[5]*x[6] - 7176/11*x[3]*x[6]^2 - 8*x[4]^3 + 17*x[4]^2*x[5] - 
4215/11*x[4]^2*x[6] + 71*x[4]*x[5]^2 - 1393/22*x[4]*x[5]*x[6] + 
8584/11*x[4]*x[6]^2 + 1429/22*x[5]^3 - 500/11*x[5]^2*x[6] - 1351/22*x[5]*x[6]^2 
- 6708/11*x[6]^3,
x[1]*x[2]*x[6] - 3*x[3]^2*x[6] + 9/44*x[3]*x[4]*x[6] + x[3]*x[5]^2 - 
245/44*x[3]*x[5]*x[6] + 125/11*x[3]*x[6]^2 - x[4]^2*x[5] + 24/11*x[4]^2*x[6] + 
3/44*x[4]*x[5]*x[6] - 158/11*x[4]*x[6]^2 - 53/44*x[5]^3 + 21/22*x[5]^2*x[6] - 
81/44*x[5]*x[6]^2 - 169/22*x[6]^3,
x[1]*x[3]^2 - x[2]^2*x[3] - x[3]^3 + 83*x[3]^2*x[6] + 2*x[3]*x[4]^2 + 
8*x[3]*x[4]*x[5] + 3665/44*x[3]*x[4]*x[6] + 5*x[3]*x[5]^2 + 
7087/44*x[3]*x[5]*x[6] - 3645/11*x[3]*x[6]^2 - 4*x[4]^3 + 8*x[4]^2*x[5] - 
2092/11*x[4]^2*x[6] + 35*x[4]*x[5]^2 - 1345/44*x[4]*x[5]*x[6] + 
4250/11*x[4]*x[6]^2 + 1439/44*x[5]^3 - 505/22*x[5]^2*x[6] - 1393/44*x[5]*x[6]^2 
- 6321/22*x[6]^3,
x[1]*x[3]*x[4] - x[2]*x[3]^2 - x[3]^3 + x[3]^2*x[4] + 70*x[3]^2*x[6] + 
x[3]*x[4]^2 + 8*x[3]*x[4]*x[5] + 898/11*x[3]*x[4]*x[6] + 6*x[3]*x[5]^2 + 
1534/11*x[3]*x[5]*x[6] - 3169/11*x[3]*x[6]^2 - 3*x[4]^3 + 6*x[4]^2*x[5] - 
1920/11*x[4]^2*x[6] + 33*x[4]*x[5]^2 - 291/11*x[4]*x[5]*x[6] + 
3741/11*x[4]*x[6]^2 + 312/11*x[5]^3 - 213/11*x[5]^2*x[6] - 327/11*x[5]*x[6]^2 - 
3096/11*x[6]^3,
x[1]*x[3]*x[5] - x[3]^2*x[4] + 40*x[3]^2*x[6] + 2*x[3]*x[4]^2 + 5*x[3]*x[4]*x[5]
+ 499/11*x[3]*x[4]*x[6] + 2*x[3]*x[5]^2 + 908/11*x[3]*x[5]*x[6] - 
1770/11*x[3]*x[6]^2 - 2*x[4]^3 + 4*x[4]^2*x[5] - 1072/11*x[4]^2*x[6] + 
18*x[4]*x[5]^2 - 171/11*x[4]*x[5]*x[6] + 2166/11*x[4]*x[6]^2 + 183/11*x[5]^3 - 
128/11*x[5]^2*x[6] - 179/11*x[5]*x[6]^2 - 1634/11*x[6]^3,
x[1]*x[3]*x[6] - 3*x[3]^2*x[6] - 107/22*x[3]*x[4]*x[6] - x[3]*x[5]^2 - 
133/22*x[3]*x[5]*x[6] + 142/11*x[3]*x[6]^2 + 104/11*x[4]^2*x[6] - 2*x[4]*x[5]^2 
+ 23/22*x[4]*x[5]*x[6] - 164/11*x[4]*x[6]^2 - 25/22*x[5]^3 + 7/11*x[5]^2*x[6] + 
39/22*x[5]*x[6]^2 + 215/11*x[6]^3,
x[1]*x[4]^2 - x[3]^3 - 2*x[3]^2*x[4] + 98*x[3]^2*x[6] + 4*x[3]*x[4]^2 + 
11*x[3]*x[4]*x[5] + 5285/44*x[3]*x[4]*x[6] + 11*x[3]*x[5]^2 + 
8483/44*x[3]*x[5]*x[6] - 4289/11*x[3]*x[6]^2 - 4*x[4]^3 + 6*x[4]^2*x[5] - 
2788/11*x[4]^2*x[6] + 49*x[4]*x[5]^2 - 1597/44*x[4]*x[5]*x[6] + 
5136/11*x[4]*x[6]^2 + 1711/44*x[5]^3 - 575/22*x[5]^2*x[6] - 2069/44*x[5]*x[6]^2 
- 9417/22*x[6]^3,
x[1]*x[4]*x[5] - 20*x[3]^2*x[6] - x[3]*x[4]^2 - 2*x[3]*x[4]*x[5] - 
431/22*x[3]*x[4]*x[6] - 905/22*x[3]*x[5]*x[6] + 910/11*x[3]*x[6]^2 + 2*x[4]^3 - 
3*x[4]^2*x[5] + 488/11*x[4]^2*x[6] - 8*x[4]*x[5]^2 + 201/22*x[4]*x[5]*x[6] - 
1042/11*x[4]*x[6]^2 - 185/22*x[5]^3 + 65/11*x[5]^2*x[6] + 95/22*x[5]*x[6]^2 + 
645/11*x[6]^3,
x[1]*x[4]*x[6] - 2*x[3]^2*x[6] - 95/44*x[3]*x[4]*x[6] - 181/44*x[3]*x[5]*x[6] + 
91/11*x[3]*x[6]^2 + 51/11*x[4]^2*x[6] - x[4]*x[5]^2 + 27/44*x[4]*x[5]*x[6] - 
102/11*x[4]*x[6]^2 - 37/44*x[5]^3 + 13/22*x[5]^2*x[6] + 19/44*x[5]*x[6]^2 + 
129/22*x[6]^3,
x[1]*x[5]^2 - x[3]*x[4]*x[5] - 85/11*x[3]*x[4]*x[6] - 2*x[3]*x[5]^2 - 
23/11*x[3]*x[5]*x[6] + 20/11*x[3]*x[6]^2 + 2*x[4]^2*x[5] + 120/11*x[4]^2*x[6] - 
3*x[4]*x[5]^2 + 23/11*x[4]*x[5]*x[6] - 20/11*x[4]*x[6]^2 - 3/11*x[5]^3 + 
3/11*x[5]^2*x[6] + 83/11*x[5]*x[6]^2 + 430/11*x[6]^3,
x[1]*x[5]*x[6] - 17/22*x[3]*x[4]*x[6] - 9/22*x[3]*x[5]*x[6] + 2/11*x[3]*x[6]^2 +
12/11*x[4]^2*x[6] + 9/22*x[4]*x[5]*x[6] - 2/11*x[4]*x[6]^2 - 5/22*x[5]^3 - 
3/11*x[5]^2*x[6] + 21/22*x[5]*x[6]^2 + 43/11*x[6]^3,
x[1]*x[6]^2 + 1/44*x[3]*x[4]*x[6] + 7/44*x[3]*x[5]*x[6] - 2/11*x[3]*x[6]^2 - 
1/11*x[4]^2*x[6] + 15/44*x[4]*x[5]*x[6] + 2/11*x[4]*x[6]^2 - 1/44*x[5]^3 - 
5/22*x[5]^2*x[6] - 9/44*x[5]*x[6]^2 + 13/22*x[6]^3,
x[2]^2*x[4] - x[2]*x[3]^2 - x[3]^3 + 2*x[3]^2*x[4] + 111*x[3]^2*x[6] + 
x[3]*x[4]^2 + 12*x[3]*x[4]*x[5] + 10331/88*x[3]*x[4]*x[6] + 6*x[3]*x[5]^2 + 
19693/88*x[3]*x[5]*x[6] - 10069/22*x[3]*x[6]^2 - 5*x[4]^3 + 14*x[4]^2*x[5] - 
5733/22*x[4]^2*x[6] + 48*x[4]*x[5]^2 - 3875/88*x[4]*x[5]*x[6] + 
6052/11*x[4]*x[6]^2 + 4013/88*x[5]^3 - 1385/44*x[5]^2*x[6] - 3395/88*x[5]*x[6]^2
- 17673/44*x[6]^3,
x[2]^2*x[5] - x[3]^2*x[4] + 6*x[3]^2*x[6] + 2*x[3]*x[4]^2 + x[3]*x[4]*x[5] + 
581/44*x[3]*x[4]*x[6] + x[3]*x[5]^2 + 547/44*x[3]*x[5]*x[6] - 227/11*x[3]*x[6]^2
- x[4]^3 - 262/11*x[4]^2*x[6] + 7*x[4]*x[5]^2 - 85/44*x[4]*x[5]*x[6] + 
304/11*x[4]*x[6]^2 + 79/44*x[5]^3 - 45/22*x[5]^2*x[6] + 51/44*x[5]*x[6]^2 - 
1247/22*x[6]^3,
x[2]^2*x[6] - 2*x[3]^2*x[6] - 469/88*x[3]*x[4]*x[6] - x[3]*x[5]^2 - 
467/88*x[3]*x[5]*x[6] + 179/22*x[3]*x[6]^2 + 205/22*x[4]^2*x[6] - 2*x[4]*x[5]^2 
+ 181/88*x[4]*x[5]*x[6] - 106/11*x[4]*x[6]^2 - 59/88*x[5]^3 - 9/44*x[5]^2*x[6] +
85/88*x[5]*x[6]^2 + 1207/44*x[6]^3,
x[2]*x[3]*x[4] - x[3]^3 - x[3]^2*x[4] + 122*x[3]^2*x[6] + 3*x[3]*x[4]^2 + 
14*x[3]*x[4]*x[5] + 6249/44*x[3]*x[4]*x[6] + 11*x[3]*x[5]^2 + 
10655/44*x[3]*x[5]*x[6] - 5381/11*x[3]*x[6]^2 - 5*x[4]^3 + 10*x[4]^2*x[5] - 
3356/11*x[4]^2*x[6] + 58*x[4]*x[5]^2 - 2009/44*x[4]*x[5]*x[6] + 
6481/11*x[4]*x[6]^2 + 2155/44*x[5]^3 - 731/22*x[5]^2*x[6] - 2297/44*x[5]*x[6]^2 
- 10965/22*x[6]^3,
x[2]*x[3]*x[5] - 54*x[3]^2*x[6] - x[3]*x[4]^2 - 7*x[3]*x[4]*x[5] - 
1283/22*x[3]*x[4]*x[6] - 2*x[3]*x[5]^2 - 2425/22*x[3]*x[5]*x[6] + 
2470/11*x[3]*x[6]^2 + 3*x[4]^3 - 6*x[4]^2*x[5] + 1400/11*x[4]^2*x[6] - 
23*x[4]*x[5]^2 + 467/22*x[4]*x[5]*x[6] - 2921/11*x[4]*x[6]^2 - 499/22*x[5]^3 + 
178/11*x[5]^2*x[6] + 459/22*x[5]*x[6]^2 + 2021/11*x[6]^3,
x[2]*x[3]*x[6] - x[3]^2*x[6] - 151/44*x[3]*x[4]*x[6] - 133/44*x[3]*x[5]*x[6] + 
71/11*x[3]*x[6]^2 + 52/11*x[4]^2*x[6] - x[4]*x[5]^2 + 23/44*x[4]*x[5]*x[6] - 
82/11*x[4]*x[6]^2 - 25/44*x[5]^3 + 7/22*x[5]^2*x[6] + 39/44*x[5]*x[6]^2 + 
215/22*x[6]^3,
x[2]*x[4]^2 - x[3]^2*x[4] - 37*x[3]^2*x[6] - x[3]*x[4]^2 - 5*x[3]*x[4]*x[5] - 
2855/88*x[3]*x[4]*x[6] - 6697/88*x[3]*x[5]*x[6] + 3367/22*x[3]*x[6]^2 + 3*x[4]^3
- 6*x[4]^2*x[5] + 1711/22*x[4]^2*x[6] - 14*x[4]*x[5]^2 + 1351/88*x[4]*x[5]*x[6] 
- 1975/11*x[4]*x[6]^2 - 1369/88*x[5]^3 + 481/44*x[5]^2*x[6] + 703/88*x[5]*x[6]^2
+ 4773/44*x[6]^3,
x[2]*x[4]*x[5] + 34*x[3]^2*x[6] + 3*x[3]*x[4]*x[5] + 1483/44*x[3]*x[4]*x[6] + 
3077/44*x[3]*x[5]*x[6] - 1547/11*x[3]*x[6]^2 - x[4]^3 + 5*x[4]^2*x[5] - 
834/11*x[4]^2*x[6] + 13*x[4]*x[5]^2 - 591/44*x[4]*x[5]*x[6] + 
1866/11*x[4]*x[6]^2 + 629/44*x[5]^3 - 221/22*x[5]^2*x[6] - 323/44*x[5]*x[6]^2 - 
2193/22*x[6]^3,
x[2]*x[4]*x[6] - x[3]^2*x[6] - 51/88*x[3]*x[4]*x[6] - 181/88*x[3]*x[5]*x[6] + 
91/22*x[3]*x[6]^2 + 29/22*x[4]^2*x[6] + 27/88*x[4]*x[5]*x[6] - 51/11*x[4]*x[6]^2
- 37/88*x[5]^3 + 13/44*x[5]^2*x[6] + 19/88*x[5]*x[6]^2 + 129/44*x[6]^3,
x[2]*x[5]^2 + 289/22*x[3]*x[4]*x[6] + 3*x[3]*x[5]^2 + 87/22*x[3]*x[5]*x[6] - 
34/11*x[3]*x[6]^2 - x[4]^2*x[5] - 204/11*x[4]^2*x[6] + 5*x[4]*x[5]^2 - 
87/22*x[4]*x[5]*x[6] + 34/11*x[4]*x[6]^2 - 3/22*x[5]^3 + 18/11*x[5]^2*x[6] - 
93/22*x[5]*x[6]^2 - 731/11*x[6]^3,
x[2]*x[5]*x[6] - 17/44*x[3]*x[4]*x[6] + 13/44*x[3]*x[5]*x[6] + 1/11*x[3]*x[6]^2 
+ 6/11*x[4]^2*x[6] - 35/44*x[4]*x[5]*x[6] - 1/11*x[4]*x[6]^2 + 17/44*x[5]^3 - 
3/22*x[5]^2*x[6] + 21/44*x[5]*x[6]^2 + 43/22*x[6]^3,
x[2]*x[6]^2 + 1/88*x[3]*x[4]*x[6] + 7/88*x[3]*x[5]*x[6] + 9/22*x[3]*x[6]^2 - 
1/22*x[4]^2*x[6] + 15/88*x[4]*x[5]*x[6] - 10/11*x[4]*x[6]^2 - 1/88*x[5]^3 + 
17/44*x[5]^2*x[6] - 9/88*x[5]*x[6]^2 + 13/44*x[6]^3,
x[3]^2*x[5] + 34*x[3]^2*x[6] + 4*x[3]*x[4]*x[5] + 48*x[3]*x[4]*x[6] + 
5*x[3]*x[5]^2 + 70*x[3]*x[5]*x[6] - 144*x[3]*x[6]^2 - x[4]^3 + 2*x[4]^2*x[5] - 
96*x[4]^2*x[6] + 19*x[4]*x[5]^2 - 13*x[4]*x[5]*x[6] + 173*x[4]*x[6]^2 + 
14*x[5]^3 - 9*x[5]^2*x[6] - 17*x[5]*x[6]^2 - 172*x[6]^3
]);
