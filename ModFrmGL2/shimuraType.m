AttachSpec("ModFrmGL2.spec");

// dir := GetCurrentDirectory();
// ChangeDirectory("/Users/eranassaf/Dropbox\ \(Dartmouth\ College\)\
// /Research/ModularSymbols/csg24.dat/");
// load "csg10-lev168.dat";
// This doesn't work at the college - too many open files.
// TODO - change these terrible loads to an import...
// load "csg15-lev240.dat";
// ChangeDirectory(dir);

import "/Users/eranassaf/Dropbox\ \(Dartmouth\ College\)/Research/ModularSymbols/csg24.dat/csg15-lev240.dat" : L15_240;

import "congruence.m" : LoadGroups, qExpansionBasisShimura;
import "congruence.m" : LoadGroupsByGenus;
import "congruence.m" : write_qexps;

grps := LoadGroups(L15_240);
grps_by_genus := LoadGroupsByGenus(L15_240);

degs := [1..5];

genera := [d*(d+1) div 2 : d in degs];

grps_g := AssociativeArray();

for g in genera do
    grps_g[g] := [grps[name] : name in grps_by_genus[g]];
end for;
/*
grps_g[3] := [grps[name] : name in grps_by_genus[3]];
grps_g[6] := [grps[name] : name in grps_by_genus[6]];
grps_g[10] := [grps[name] : name in grps_by_genus[10]];
grps_g[15] := [grps[name] : name in grps_by_genus[15]];
*/

// groups of Shimura type for these genera
shim := AssociativeArray();

shim[1] := [ Strings() | "6F1", "7B1", "8F1", "8K1", "9C1", "9H1", "10G1", "10K1", "11A1", 
"11D1", "12P1", "12S1", "12V1", "14C1", "14H1", "15C1", "15G1", "15I1", "16E1", 
"16M1", "17A1", "17B1", "17C1", "18J1", "19A1", "19B1", "20D1", "20H1", "21B1", 
"21F1", "24G1", "24J1", "27A1", "27C1", "32A1", "32E1", "36C1", "49A1" ];
shim[3] := [ Strings() | "7A3", "8A3", "12O3", "12K3", "15E3", "16H3", "20J3", "20S3", 
"21D3", "24V3", "24X3", "24Y3", "30K3", "32J3", "33C3", "34C3", "35A3", "36K3", "39A3", 
"40F3", "41A3", "43A3", "45D3", "48J3", "49A3", "64B3" ];
shim[6] :=  [ "11A6", "22C6", "31A6", "31B6",
            "58A6", "71A6", "79A6", "121A6" ];
shim[10] :=  [ "9A10", "18E10", "18M10", "26D10", "27B10", "28D10", "36Q10",
             "37A10", "38A10", "46A10", "54A10", "54I10", "81A10", "86A10"
             , "92A10", "108F10", "127A10" ];
shim[15] := [  "35C15", "40W15", "40X15", "43A15", "51A15", "60AC15", "60AD15", 
	     "67A15", "68D15", "80R15", "80T15", "85A15", "85B15", "102C15", "110A15", 
	     "136D15", "141A15", "153A15", "155A15", "161A15", "175A15", "179A15",
	     "193A15" ];

filtered := AssociativeArray();

filtered[1] := [ "6A1", "6B1", "6C1", "6D1", "6E1", "6F1", "7A1", "7B1", "7C1", 
"8A1", "8B1", "8C1", "8F1", "8G1", "8I1", "8K1", "9A1", "9C1", "9D1", "9E1", 
"9G1", "9H1", "10A1", "10B1", "10C1", "10D1", "10E1", "10F1", "10G1", "10H1", 
"10I1", "10K1", "11A1", "11B1", "11C1", "11D1", "12B1", "12C1", "12F1", "12J1", 
"12K1", "12L1", "12M1", "12P1", "12S1", "12T1", "12V1", "14C1", "14E1", "14G1", 
"14H1", "15A1", "15B1", "15C1", "15D1", "15E1", "15F1", "15G1", "15H1", "15I1", 
"16A1", "16B1", "16C1", "16D1", "16E1", "16F1", "16G1", "16H1", "16I1", "16J1", 
"16M1", "17A1", "17B1", "17C1", "18A1", "18C1", "18E1", "18F1", "18G1", "18H1", 
"18I1", "18J1", "19A1", "19B1", "20D1", "20E1", "20H1", "20I1", "21B1", "21E1", 
"21F1", "24C1", "24D1", "24E1", "24G1", "24H1", "24J1", "26A1", "26B1", "27A1", 
"27B1", "27C1", "30C1", "30D1", "32A1", "32E1", "36C1", "49A1" ];

filtered[3] := ["7A3", "8B3", "8A3", "9A3", "10B3", "10C3", "10A3", "12P3", 
"12F3", "12G3", "12D3", "12E3", "12A3", "12N3", "12O3", "12L3", "12J3", "12K3", 
"12I3", "13B3", "13C3", "13A3", "14D3", "14C3", "14A3", "15H3", "15F3", "15G3", 
"15E3", "15B3", "15C3", "15A3", "16R3", "16S3", "16F3", "16D3", "16E3", "16B3", 
"16C3", "16A3", "16N3", "16O3", "16L3", "16J3", "16K3", "16H3", "16I3", "18A3", 
"18J3", "18K3", "18H3", "18I3", "18F3", "18G3", "18D3", "20F3", "20G3", "20E3", 
"20A3", "20L3", "20J3", "20K3", "20H3", "20I3", "20T3", "20R3", "20S3", "20P3", 
"21D3", "21C3", "21A3", "24B3", "24C3", "24A3", "24N3", "24O3", "24L3", "24K3", 
"24H3", "24I3", "24V3", "24W3", "24U3", "24P3", "24Q3", "24Z3", "24X3", "24Y3", 
"24AC3", "24AA3", "26A3", "27C3", "27A3", "28C3", "30F3", "30G3", "30D3", 
"30B3", "30A3", "30J3", "30K3", "30H3", "30I3", "32C3", "32A3", "32N3", "32O3", 
"32L3", "32M3", "32J3", "32K3", "32P3", "32B3", "33C3", "33A3", "34B3", "34C3", 
"34A3", "35A3", "36G3", "36D3", "36E3", "36A3", "36J3", "36K3", "36I3", "39A3", 
"40F3", "40G3", "40D3", "40E3", "40C3", "40J3", "40H3", "41A3", "42D3", "42E3", 
"43A3", "45D3", "45B3", "45A3", "48F3", "48G3", "48D3", "48E3", "48C3", "48L3", 
"48M3", "48J3", "48K3", "48H3", "48I3", "49A3", "50A3", "51A3", "52B3", "54A3", 
"64B3", "64A3", "72A3" ];

    filtered[6] := ["11A6", "14B6", "17A6", "18A6", "18B6", "18C6", "20C6", "21B6", 
"21C6", "22A6", "22B6", "22C6", "24D6", "24G6", "27A6", "28D6", "28E6", "28G6", 
"28I6", "30A6", "30B6", "30C6", "30D6", "30E6", "31A6", "31B6", "32A6", "32B6", 
"35E6", "36C6", "36D6", "36E6", "36F6", "36J6", "36K6", "39A6", "45A6", "45C6", 
"45D6", "48A6", "48B6", "48C6", "48D6", "48I6", "48J6", "50E6", "52A6", "54A6", 
"54B6", "56D6", "56E6", "58A6", "60B6", "60C6", "60E6", "60F6", "63A6", "66B6", 
"66D6", "69A6", "71A6", "72B6", "72C6", "72D6", "78A6", "79A6", "86A6", "87A6", 
"90B6", "90C6", "100A6", "121A6" ];
    
    filtered[10] := ["9A10", "15A10", "15B10", "18A10", "18B10", "18C10", "18D10", 
"18E10", "18F10", "18G10", "18H10", "18L10", "18M10", "20A10", "20B10", "20C10",
"20D10", "20F10", "21A10", "22A10", "24A10", "24B10", "25A10", "26A10", "26D10",
"26E10", "27B10", "28C10", "28D10", "30A10", "30C10", "30F10", "30H10", "32B10",
"33B10", "33C10", "36A10", "36B10", "36C10", "36G10", "36I10", "36J10", "36K10",
"36M10", "36N10", "36O10", "36Q10", "36R10", "36S10", "37A10", "38A10", "39B10",
"40C10", "40D10", "40E10", "40F10", "40G10", "42A10", "42D10", "42E10", "42G10",
"42H10", "42I10", "42K10", "44B10", "44C10", "45A10", "45B10", "46A10", "48A10",
"48B10", "48C10", "48D10", "50A10", "52A10", "54A10", "54B10", "54C10", "54E10",
"54G10", "54I10", "56F10", "60C10", "72A10", "72B10", "72C10", "72D10", "74A10",
"75A10", "76A10", "78A10", "80A10", "80B10", "81A10", "84B10", "84C10", "86A10",
"88B10", "88C10", "90A10", "90D10", "90E10", "90F10", "92A10", "96A10", "96B10",
"100A10", "105A10", "108A10", "108F10", "110A10", "114A10", "114B10", "115A10", 
"118A10", "127A10", "134A10", "150A10" ];
    
    filtered[15] := ["14A15", "17A15", "20A15", "20D15", "20E15", "20G15", "21A15", 
"21B15", "23A15", "24A15", "24B15", "24D15", "24E15", "24F15", "24G15", "24H15",
"24I15", "24J15", "24M15", "24N15", "24Q15", "24R15", "26A15", "28C15", "28D15",
"28E15", "28F15", "30A15", "30B15", "30C15", "30E15", "30F15", "34A15", "35A15",
"35B15", "35C15", "35D15", "36A15", "36B15", "36C15", "36D15", "39A15", "40B15",
"40C15", "40D15", "40E15", "40F15", "40G15", "40H15", "40I15", "40L15", "40M15",
"40N15", "40O15", "40R15", "40S15", "40U15", "40V15", "40W15", "40X15", "40Y15",
"40Z15", "40AA15", "40AB15", "40AD15", "40AE15", "40AF15", "42A15", "42B15", 
"42C15", "42D15", "43A15", "45A15", "45B15", "45D15", "48E15", "48F15", "48G15",
"48H15", "48I15", "48L15", "48M15", "48N15", "48O15", "48P15", "48Q15", "48R15",
"48T15", "48U15", "48V15", "48W15", "48X15", "48AD15", "48AE15", "51A15", 
"51B15", "52A15", "56E15", "56F15", "56G15", "60A15", "60B15", "60C15", "60D15",
"60E15", "60F15", "60G15", "60H15", "60I15", "60J15", "60K15", "60L15", "60M15",
"60N15", "60U15", "60V15", "60AA15", "60AB15", "60AC15", "60AD15", "63A15", 
"66A15", "67A15", "68A15", "68B15", "68C15", "68D15", "68E15", "68F15", "70A15",
"70E15", "72F15", "72G15", "72H15", "72I15", "72J15", "72K15", "80E15", "80F15",
"80G15", "80H15", "80I15", "80J15", "80K15", "80L15", "80N15", "80O15", "80Q15",
"80R15", "80S15", "80T15", "80U15", "80V15", "84A15", "84B15", "85A15", "85B15",
"90A15", "90E15", "90G15", "90H15", "90I15", "90J15", "93A15", "95A15", "96M15",
"96N15", "96O15", "96S15", "98A15", "99C15", "100A15", "102A15", "102B15", 
"102C15", "108A15", "110A15", "112A15", "112B15", "112C15", "112D15", "112E15", 
"112F15", "112G15", "112H15", "120A15", "120E15", "120F15", "120G15", "120H15", 
"120I15", "120J15", "120K15", "120L15", "124A15", "126A15", "126B15", "132A15", 
"132B15", "135A15", "135B15", "136A15", "136B15", "136C15", "136D15", "136E15", 
"136F15", "138A15", "138B15", "140A15", "140B15", "141A15", "144B15", "144C15", 
"144E15", "150I15", "150J15", "153A15", "154A15", "154B15", "155A15", "156A15", 
"156B15", "160A15", "160B15", "161A15", "165A15", "170A15", "170B15", "170C15", 
"170D15", "171A15", "174A15", "175A15", "177A15", "178A15", "178B15", "179A15", 
"182B15", "182C15", "193A15", "194A15", "194B15" ];

// list of best value of M for the different groups
grps_M := [ <"11A6", 1>, <"14B6", 1>, <"17A6", 1>, <"18A6", 1>, <"18B6", 1>, <"18C6", 1>, <"20C6", 1>, <"21B6", 3>, <"21C6", 1>, <"22A6", 1>, <"22B6", 1>, <"22C6", 1>, <"24D6", 1>, <"24G6", 1>, <"27A6", 1>, <"28D6", 1>, <"28E6", 1>, <"28G6", 1>, <"28I6", 1>, <"30A6", 2>, <"30B6", 1>, <"30C6", 1>, <"30D6", 1>, <"30E6", 3>, <"31A6", 1>, <"31B6", 1>, <"32A6", 1>, <"32B6", 1>, <"35E6", 5>, <"36C6", 1>, <"36D6", 1>, <"36E6", 1>, <"36F6", 1>, <"36J6", 1>, <"36K6", 1>, <"39A6", 1>, <"45A6", 1>, <"45C6", 1>, <"45D6", 1>, <"48A6", 1>, <"48B6", 1>, <"48C6", 1>, <"48D6", 1>, <"48I6", 1>, <"48J6", 1>, <"50E6", 1>, <"52A6", 1>, <"54A6", 1>, <"54B6", 1>, <"56D6", 1>, <"56E6", 1>, <"58A6", 58>, <"60B6", 1>, <"60C6", 1>, <"60E6", 1>, <"60F6", 1>, <"63A6", 7>, <"66B6", 11>, <"66D6", 11>, <"69A6", 23>, <"71A6", 71>, <"72B6", 1>, <"72C6", 1>, <"72D6", 1>, <"78A6", 1>, <"79A6", 79>, <"86A6", 43>, <"87A6", 29>, <"90B6", 1>, <"90C6", 1>, <"100A6", 1>, <"121A6", 121> ];

SetDebugOnError(true);

procedure computeShimuraModularCurves(shim, grps : Proof := false)

    //    for g in [1,3,6,10,15] do
    for g in genera do
	for name in shim[g] do
	    X, fs := qExpansionBasisShimura(name, grps : Proof := Proof);
	    write_qexps(name cat "_shim", fs, X);
	    print "Group ", name, " - done!";
	end for;
    end for;
    
end procedure;

