freeze;
 
/****-*-magma-* EXPORT DATE: 2004-03-08 ************************************
                                                                            
                   HECKE:  Modular Symbols in Magma                          
                            William A. Stein                                 
                                                                            
   FILE: linalg.m (Z-modules and linear algebra)                            


          THIS FILE PROVIDES SOME FUNNY LINEAR ALGEBRA CODE
          WHICH SUPPORTS THE REST OF THE MODULAR SYMBOLS PACKAGE.
          NONE OF IT IS EXPORTED. 

          I suspect that the use of many of these functions could
          be eliminated by a more careful use of the built in
          Magma structures.
          --- WAS


   Revision 1.7  2002/04/11 06:26:56  was
   nothing, but some scratch work that is in com

   Revision 1.6  2002/03/01 19:40:48  was
   nothing.

   Revision 1.5  2002/03/01 02:04:57  was
   nothing.

   Revision 1.4  2001/07/13 03:29:53  was
   ...

   Revision 1.3  2001/06/07 01:38:56  was
   Replaced Restrict by Allan's much better Restrict.

   Revision 1.2  2001/05/13 03:50:06  was
   Changed ModularForms flag to ModularSymbols.

   Revision 1.1  2001/04/20 04:46:59  was
   Initial revision

   Revision 1.4  2001/02/04 02:02:53  was
   Changed
      function SaturatePolySeq(P, prec)
   so the output is in the canonical MAGMA reduced format.
   Note -- the coefficients of the output are now much larger
   than before!

   Revision 1.3  2000/08/21 01:20:15  was
   Added special case to MakeLattice to take care of the case
   of dimension 0.

   Revision 1.2  2000/06/03 04:52:43  was
   verbose: ModularForm --> ModularForms

   Revision 1.1  2000/05/02 08:02:10  was
   Initial revision
                                                                            
 ***************************************************************************/

import "misc.m" : PivotColumn;

forward IntegerKernel,
        RestrictionOfScalars;


function MakeLattice(B)
   return Lattice(Matrix(B));
end function;


function TrivialLattice(n)
   A := RMatrixSpace(Integers(),n,n)!(MatrixAlgebra(Integers(),n)!1);
   return Lattice(A);
end function;


function MakeLatticeWithInnerProd(B,M)
   V   := VectorSpace(Rationals(), Nrows(M));
   Mat := RMatrixSpace(Rationals(), #B, Dimension(V));
   X   := Mat!B;
   return Lattice(X,M : CheckPositive := false);
end function;


function VectorSpaceZBasis(B) 
// Return vector space with basis 
// the lattice generated by the elements of B.
   V := VectorSpace(Parent(Eltseq(B[1])[1]),#Eltseq(B[1]));
   if &and[b eq 0 : b in B] then
      return VectorSpaceWithBasis([V|]);
   end if;
   Latbase := Basis(MakeLattice(B));
   return VectorSpaceWithBasis([V!v : v in Latbase]);
end function;


function KernelOn(A, B)
// Suppose B is a basis for an n-dimensional subspace
// of some ambient space and A is an nxn matrix.
// Then A defines a linear transformation of the space
// spanned by B.  This function returns the
// kernel of that transformation.
   if Type(B) eq ModTupFld then
      BM := BasisMatrix(B);
   else
      BM := Matrix(B);
   end if;
   return RowSpace(KernelMatrix(A) * BM);
end function;


function LatticeIndex(V, W) 
// Compute the lattice index [V:W].
   Vec := VectorSpace(Rationals(),Degree(V));
   B:=[Vec!b : b in Basis(V)];
   C:=[Vec!c : c in Basis(W)];
   Vspace := VectorSpaceWithBasis(B);
   D:=[Coordinates(Vspace, c) : c in C];
   if Dimension(W) lt Dimension(V) then
      return 0;
   end if;
   n := #D;
   return Abs(Determinant(MatrixAlgebra(Rationals(),n)!(&cat D)));
end function;


function Volume(L)
// Compute the absolute value of the determinant of the matrix 
// got by finding a Z-lattice basis for the Z-span of the rows 
// in the sequence L.
   n := Degree(L[1]);
   B := Basis(Lattice(RMatrixSpace(Rationals(),
                       #L, n)!L));
   VB := [VectorSpace(Rationals(),n)!b : b in B];
   r := #B;
   B := &cat[Eltseq(b) : b in B];
   if r ne n then
      return 0;
   end if;
   Mat := MatrixAlgebra(Rationals(), n)!B;
   return Abs(Determinant(Mat));
end function;


function ZAlgDisc(gens) 
/*******************************************************************
   The elements of gens should all lie in a field Q[x]/(f(x)).
   It is assumed that they generate a subring O of Q[x]/(f(x)), 
   as a *Z-module*!  This function returns the discriminant of 
   this Z-module.

   We use that 

           disc(O) = Vol(L)^2 * disc(f).

      where Vol(L) is the volume of the lattice in Euclidean 
      space cut out by the vectors (b_0,..,b_n) corresponding
      to generators b_0 + b_1*x + ... + b_n*x^n of O_f listed 
      in gens. 
  ******************************************************************/
    f := Modulus(Parent(gens[1]));
    n := Degree(f);
    V := VectorSpace(Rationals(),n);
    return Discriminant(f) * Volume([ V![Coefficient(g,i): i in [0..n-1]] 
                   : g in gens])^2;
end function;


/***************************
 AVOID USING THIS!!!!
 Don't use lattices at all (note that 'Lattice' does an LLL).
 Instead do something like Saturation(Matrix(B)).
    --- Steve
****************************/
function Saturate(B) 
   t := Cputime();
   if Type(B[1]) eq SeqEnum then
      V := RSpace(Rationals(), #B[1]);
      B := [V|b : b in B];
   end if;
   L := MakeLattice(B);
   S := PureLattice(L);
   return S;
end function;


// V is a vector space and B is a basis for a space that contains V.
// This functions returns a basis for the Z-module of elements of 
// V that are contained in the Z-span of B.
function SaturateWithRespectToBasis(V,B)
   // 1. Choose a basis for V.
 //BV := Basis(V);
   // 2. Write each element of BV as a linear combination of the
   //    basis vectors in B.
 //S  := RSpaceWithBasis(B);
 //C  := [Coordinates(S, b) : b in BV];
   B := Matrix(B);
   C := Solution( B, BasisMatrix(V) );
   // 3. Saturate C.
 //SatC := Saturate(C);
   SatC := Saturation(C);
   // 4. 
   if BaseRing(B) cmpne Integers() then 
      SatC := ChangeRing( SatC, BaseRing(B) );
   end if;
   return Lattice( SatC * B );
   // TO DO : add an option to not MakeLattice, and change the calling functions accordingly
end function;

function Intersect_Vector_Space_With_Lattice(V, L)
   W := VectorSpace(RationalField(), Degree(V));
   B := [W!b : b in Basis(L)];
   return SaturateWithRespectToBasis(V,B);
end function;


function SaturatePolySeq(P, prec) 
// Returns generators for the saturation of the Z-module generated
// by the sequence of q-expansions.
// TO DO (maybe): change it to also accept vectors, as in EchelonPolySeq.
   if #P eq 0 then 
     return P, MatrixAlgebra(Rationals(), 0)!0;
   end if;
   // Steve changed this:
   /*
   R := Parent(P[1]);
   X    := [[Rationals()!Coefficient(f,i) : i in [0..prec-1]] :  f in P];
   S    := Saturate(X);
   S    := sub<RSpace(Integers(),Degree(S)) | [Eltseq(b) : b in Basis(S)]>;
   q := PowerSeriesRing(Integers()).1;
   return [&+[Integers()!(v[i])*q^(i-1) : i in [1..prec]] : v in Basis(S)];
   */
   vprintf ModularSymbols: "Saturating and echelonizing q-expansion basis (dimension %o) ...", #P;
   time0 := Cputime();
   M := Matrix(Rationals(), [[Coefficient(f,i) : i in [0..prec-1]] : f in P] );
   // !!! How do I get the matrix operation for the saturation??
   satM := Saturation(IntegralMatrix(M));
   E,T := EchelonForm(M);
   submat := ColumnSubmatrix(satM, [PivotColumn(E,j) : j in [1..Nrows(satM)]]);
   submat := ChangeRing(submat, Rationals());
   if Nrows(E) eq Nrows(satM) then
     zero := RMatrixSpace(Rationals(), Nrows(satM),0)!0;
   else
     zero := Matrix([[Rationals()!0 : j in [1..Nrows(E)-Nrows(satM)]] :
				   i in [1..Nrows(satM)]]);
   end if;
   I := HorizontalJoin(submat, zero)  * T;
   //M, I := HermiteForm(Saturation(IntegralMatrix(M)));
   M, J := HermiteForm(satM);
   vprintf ModularSymbols: " %o\n", Cputime(time0);
   R := PowerSeriesRing(Integers());
   ans := [R! Eltseq(M[i]) : i in [1..Nrows(M)]];
   return ans, ChangeRing(J, Rationals())*I;
end function;


function EchelonPolySeq(P, prec) 
// Put the sequence of poly's in Echelon form.
    if #P eq 0 then 
	return P;
    end if;

    vprintf ModularSymbols,2: "Setting up to echelonize q-expansions, dimension %o ... ", #P;
    time0 := Cputime();
    if ISA(Type(Universe(P)), ModTupRng) then  // new option, saves unnecessary work
//  "new way ... ";
       R := PowerSeriesRing(BaseRing(P[1]));
       q := R.1;
       M := Matrix(P);
       if Ncols(M) lt prec then  // we assume the missing coeffs are all zero
          M := HorizontalJoin(M, ZeroMatrix(BaseRing(M), Nrows(M), prec-Ncols(M)) );
       end if;
    else
//  "old way ... ";
       R := Parent(P[1]);
       q := R.1;
       M := Matrix(#P, prec,
	    [[Coefficient(f,i) : i in [0..prec-1]] :  f in P]);
    end if;
    time1 := Cputime();
    vprintf ModularSymbols,2: "%os \nEchelonizing ... ", time1-time0;
    M, I := EchelonForm(M);
    vprintf ModularSymbols,2: "%os\n", Cputime(time1);
  //return [&+[M[r, i+1]*q^i : i in [0..prec-1]]: r in [1..Nrows(M)]];
    return [R! Eltseq(M[r]) : r in [1..Nrows(M)]], I;

    /* Original version
    V    := RSpace(BaseRing(R),prec);
    X    := sub<V|[[Coefficient(f,i) : i in [0..prec-1]] :  f in P]>;
    return [&+[v[i+1]*q^i : i in [0..prec-1]] : v in Basis(X)];
    */

end function;


function IndexInSaturation(P, prec)
// Returns the index and structure of the Z-module generated by the sequence
// of q-expansions in its saturation. 
   if #P eq 0 then 
      return 1, AbelianGroup([]);
   end if;
   R<q> := Parent(P[1]);
   X    := [[Coefficient(f,i) : i in [0..prec-1]] :  f in P];
   D    := RMatrixSpace(Integers(),#P,(prec))!(&cat X);
   S    := SmithForm(D);
   ind  := [S[i,i] : i in [1..Min(Nrows(S),Ncols(S))] | S[i,i] gt 1];
   if #ind eq 0 then
      return 1, AbelianGroup([]);
   end if;
   return &*ind, AbelianGroup(ind);
end function;


function Pivots(B)   // find pivots of reduced basis.
   return [Min(Support(b)): b in B];
end function;

   
function MyCharpoly(A, proof)
   assert Nrows(A) gt 0;
   if Type(BaseRing(Parent(A))) eq FldRat then
      return CharacteristicPolynomial(A : Al := "Modular", Proof:=proof);
   end if;
   return CharacteristicPolynomial(A);
end function;


function Restrict(A, x)
   F := BaseRing(Parent(A));
   if Type(x) eq SeqEnum then
      B := Matrix(F, x);
   else
      assert Type(x) in {ModTupRng, ModTupFld};
      if Dimension(x) eq 0 then
         return MatrixAlgebra(F,0)!0;
      end if;
      B := Matrix(F, BasisMatrix(x));
   end if; 
   R := MatrixAlgebra(F, Nrows(B)) ! Solution(B, B*A);
   return R;
end function;


function IntegerKernel(A) 
// Compute integer kernel of the not-necessarily-square matrix A.
   n := Nrows(A); 
   m := Ncols(A);
   vprintf ModularSymbols, 2: "Computing kernel of %o-by-%o matrix.\n", n, m;
   if Type(A) ne ModMatRngElt then
      d := Lcm([Integers()|Denominator(a) : a in Eltseq(A)]);
   else
      d := 1;
   end if;
   B := RMatrixSpace(Integers(),n,m) ! (d*A);
   b := Basis(Kernel(B));
   if #b eq 0 then
      return sub<VectorSpace(Rationals(),n)|0>;
   end if;
   return VectorSpaceWithBasis([VectorSpace(Rationals(),n)!x: x in b]);
end function;


function IntegerKernelZ(A)
// Compute integer kernel of the matrix A, and return as integral space.
   if Type(BaseRing(Parent(A))) eq RngInt then
      return Kernel(A);
   end if;
   n:= Nrows(A);
   d:= LCM([Denominator(a) : a in Eltseq(A)]);
   B:= MatrixAlgebra(Integers(),n) ! (d*A);
   return Kernel(B);
end function;     


function IntegerKernelOn(A, B)
/*  Suppose B is a basis for an n-dimensional subspace
    of some ambient space and A is an nxn matrix.
    Then A defines a linear transformation of the space
    spanned by B.  This function returns the integer
    kernel of that transformation, as a subspace with basis. 
*/
   if Type(B) eq ModTupFld then
      B := Basis(B);
   end if;

   K := IntegerKernel(A);
   if Dimension(K) eq 0 then 
      V := VectorSpace(Parent(B[1][1]),#B);
      return sub<V|V!0>;
   end if;
   return RowSpace(BasisMatrix(K) * Matrix(B));
end function;


function DiscriminantMatAlgZ(A, dim)
// Compute the discriminant of the Z-algebra generated by the matrices
// Generators(A).
   vprint ModularSymbols : "Computing discriminant of matrix algebra.";
   T := [t : t in Generators(A)];
   if #T eq 0 then
      return 1;
   end if;
   d := Nrows(T[1]);

   // 1. choose vector v such that the vector space spanned by all
   //    T[i]*v has dimension equal to the dimension of A.
   vprint ModularSymbols,2 : "\t 1. Choosing projection vector v.";
   n   := 0; 
   row := VectorSpace(Rationals(),d);
   repeat 
      n   +:= 1;
      if n gt d then
         error "DiscriminantMatAlgZ: the generators don't generate the Hecke algebra additively.";
      end if;
      V    := VectorSpace(Rationals(),d*n);
      gens := [V!&cat[Eltseq(row.j*t) : j in [1..n]] : t in T];
      W    := sub<V|gens>;
      vprintf ModularSymbols : "\t\tDim W = %o, goal = %o.\n", Dimension(W), d;
   until Dimension(W) eq dim;


   // 2. Find a subset of T which generates over Q
   vprint ModularSymbols,2 : "\t 2. Finding subset of Q generators.";
   E, F := EchelonForm(Transpose(RMatrixSpace(Rationals(),#gens,d*n)!gens));
   P := Pivots(Basis(RowSpace(E)));


   // 3. Compute the inner product matrix <P[i],P[j]>.  
   vprint ModularSymbols,2 : "\t 2. Computing inner product matrix.";
   M := MatrixAlgebra(Rationals(),#P)!0;
   for i in [1..#P] do
      for j in [1..i] do
         M[i,j] := Trace(T[P[i]]*T[P[j]]);
         if i ne j then
            M[j,i] := M[i,j];
         end if;
      end for;
   end for;

   // 4. Write each element of gens as a linear combination
   // of the generating sequence [gens[p] : p in P] 
   vprint ModularSymbols,2 : "\t 4. Expressing generators.";
   genspace := VectorSpaceWithBasis([gens[p] : p in P]);   
   VV := VectorSpace(Rationals(),#P);
   redgen   := [VV!Coordinates(genspace, g) : g in gens];

   // 5. Make lattice.
   vprint ModularSymbols,2 : "\t 5. Making lattice.";
   L := MakeLatticeWithInnerProd(redgen,M);

   // 6. Compute discriminant.
   vprint ModularSymbols,2 : "\t 6. Computing discriminant.";
   return Integers()!Determinant(GramMatrix(L)), L;
end function;


QQ := RationalField();

function RestrictionOfScalars_AlgMatElt(A) 
/* The restriction of scalars to the rational field 
   of the matrix A over a number field.
   If alpha1,...,alphad is the basis for the number field F,
   and x1,...,xn is the basis that A is written with respect to,
   then this function returns the action of Res(A) on the basis
       alpha1*x1,...,alpha1*xn, alpha2*x1,...,.alpha2*xn, ..., 
               alphad*x1,...,alphad*xn.
   All matrices are viewed as acting from the right.
*/
   assert Type(A) eq AlgMatElt;
   K := BaseRing(Parent(A));
   assert Type(K) in {FldRat, FldCyc, FldNum};
   if Type(K) eq FldRat then
      return A;
   end if;
   n := Degree(Parent(A));
   d := Degree(K);
   if d eq 1 then
      return MatrixAlgebra(RationalField(),n)!A;
   end if;
   B := MatrixAlgebra(RationalField(),d*n)!0;
   basis := Basis(K);
   for i in [1..n] do
      v := A[i];
      for j in [1..d] do
         w := basis[j]*v;
         for k in [1..n] do
            x := w[k];
            for m in [1..d] do
               B[(j-1)*n+i, (m-1)*n+k] := x[m];
            end for;
         end for;
      end for;
   end for;
   return B;
end function;


function RestrictionOfScalars_ModMatFldElt(A) 
   assert Type(A) eq ModMatFldElt;
   K := BaseRing(Parent(A));
   assert Type(K) in {FldRat, FldCyc, FldNum};
   if Type(K) eq FldRat then
      return A;
   end if;
   n := Nrows(A);
   m := Ncols(A);
   d := Degree(K);
   if d eq 1 then
      return RMatrixSpace(RationalField(),n,m)!A;
   end if;
   B := RMatrixSpace(RationalField(),d*n,d*m)!0;
   basis := Basis(K);
   for i in [1..n] do
      v := A[i];
      for j in [1..d] do
         w := basis[j]*v;
         for k in [1..m] do
            x := w[k];
            for s in [1..d] do
               B[(j-1)*n+i, (s-1)*m+k] := x[s];
            end for;
         end for;
      end for;
   end for;
   return B;
end function;

function RestrictionOfScalars_ModTupFldElt(v) 
   assert Type(v) eq ModTupFldElt;
   K := Parent(v[1]);
   assert Type(K) in {FldRat, FldCyc, FldNum, RngInt};
   if Type(K) eq FldRat then
      return v;
   end if;
   V := VectorSpace(RationalField(),Degree(Parent(v))*Degree(K));
   return V![Eltseq(x)[i] : x in Eltseq(v), i in [1..Degree(K)]];

end function;

function RestrictionOfScalars_ModTupFld(V)
   K := BaseField(V);
   if Type(K) eq FldRat then
      return V;
   end if;
   assert Type(K) in {FldRat, FldCyc, FldNum, RngInt};
   BK := Basis(K);
   BV := Basis(V);                               // this order "a*v" is very important.
   return VectorSpaceWithBasis([RestrictionOfScalars(a*v) : v in BV, a in BK]);
end function;


function RestrictionOfScalars_SeqEnum(v) 
   assert Type(v) eq SeqEnum;
   if #v eq 0 then
      return VectorSpace(QQ,0)!0;
   end if;
   K := Parent(v[1]);
   assert Type(K) in {FldRat, FldCyc, FldNum, RngInt};
   if Type(K) eq FldRat then
      return VectorSpace(QQ, #v)!v;
   end if;
   V := VectorSpace(QQ,#v*Degree(K));
   return V![Eltseq(x)[i] : x in v, i in [1..Degree(K)]];

end function;

function RestrictionOfScalars(x)
//   if (Type(x) eq SeqEnum and (#x eq 0 or Type(x[1]) eq FldRat)) or
//      (Type(x) ne SeqEnum and (Type(BaseRing(Parent(x))) eq FldRat)) then
//      return x;
//   end if;
   case Type(x):
      when AlgMatElt:
         return RestrictionOfScalars_AlgMatElt(x);
      when ModMatFldElt:
         return RestrictionOfScalars_ModMatFldElt(x);
      when ModTupFldElt:
         return RestrictionOfScalars_ModTupFldElt(x);
      when ModTupFld:
         return RestrictionOfScalars_ModTupFld(x);
      when SeqEnum:
         return RestrictionOfScalars_SeqEnum(x);
      else:
         print "Type(x) = ", Type(x);
         assert false;
   end case;
end function;

/* Given a matrix or vector x over Q and a field K, 
   compute a matrix or vector y over K whose restriction 
   of scalars down to Q is x.  This is the inverse of
   the RestrictionOfScalars function above. */

function UnRestrictionOfScalars_AlgMatElt(x, K)
   error "Not yet written";
end function;

function UnRestrictionOfScalars_ModMatFldElt(x, K)
   error "Not yet written";
end function;

function UnRestrictionOfScalars_ModTupFldElt(x, K)
   d := Degree(K);
   n := Degree(x) div d;
   return VectorSpace(K, n) ! [K![x[j+n*i] : i in [0..d-1]] : j in [1..n]];
end function;

function UnRestrictionOfScalars(x, K)
   if Type(K) eq FldRat then
      return x;
   end if;
   case Type(x):
      when AlgMatElt:
         return UnRestrictionOfScalars_AlgMatElt(x, K);
      when ModMatFldElt:
         return UnRestrictionOfScalars_ModMatFldElt(x, K);
      when ModTupFldElt, LatElt:
         return UnRestrictionOfScalars_ModTupFldElt(x, K);
      else:
         assert false;
   end case;
end function;
