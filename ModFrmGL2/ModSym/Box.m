import "linalg.m" : KernelOn, Restrict;
import "operators.m" : ActionOnModularSymbolsBasis;

function FindLiftToSL2(g)
     elt_g := ElementToSequence(g);
     if #elt_g eq 1 then return PSL2(Integers())!1; end if;
     a,b,c,d := Explode(elt_g); 
     N := Modulus(Parent(a));
     Z := Integers();
     a_prime := Z!a;
     b_prime := Z!b;
     if a_prime eq 0 then
        a_prime +:= N;
     end if;
     gcd_res, x, y := Xgcd(a_prime, b_prime);
     while gcd_res ne 1 do
           b_prime +:= N; 
           gcd_res, x, y := Xgcd(a_prime, b_prime);
     end while;
     det := a_prime * Z!d - b_prime*Z!c;
     c_prime := Z!c - y * (1 - det);
     d_prime := Z!d + x * (1 - det);       
     lift_g := PSL2(Integers())![a_prime, b_prime, c_prime, d_prime];
     return lift_g;
end function;

function gen_to_mat(gs, C1, C2)
    C1b := Basis(C1);
    C2mat := Transpose(Matrix([Eltseq(c) : c in Basis(C2)]));
    ims := [C2!(&cat[ModularSymbolApply(C1, Eltseq(g),
					ModularSymbolRepresentation(c))
	    : g in gs]) : c in C1b];
    mat_ret := Transpose(Solution(Transpose(C2mat), Matrix([Vector(Eltseq(im))
							    : im in ims])));
    return mat_ret, ims;
end function;

function gen_to_mat2(g, C)
    MS := AmbientSpace(C);
    gM := ActionOnModularSymbolsBasis(Eltseq(g), MS);
    gC := Restrict(gM, VectorSpace(C));
    return Transpose(gC);
end function;

function Bdmatrix(CM, CMmat, t, C)
    ims := [CM!ModularSymbolApply(CM, [t,0,0,1],
				  ModularSymbolRepresentation(c))
	    : c in Basis(C)];
    mat_ret := t*Transpose(Solution(Transpose(CMmat),
				    Matrix([Vector(Eltseq(im)) : 
					    im in ims])));
    return mat_ret;
end function;

function sigma(a, Q21, sigma_Q21)
    K := Parent(a);
    if K eq Q21 then
	return sigma_Q21(a);
    end if;
    return (hom< K->K | -K.1>)(a);
end function;

function make_Q21_func(a, Q21, f_Q21)
    K := Parent(a);
    if K eq Q21 then
	return f_Q21(a);
    end if;
    return &+[f_Q21(Eltseq(a)[i])*Basis(K)[i]
	      : i in [1..Degree(K)]];
end function;

function make_nf_func(a, F, f_F)
    K := Parent(a);
    if K eq F then
	return f_F(a);
    end if;
    assert BaseRing(K) eq F;
    return &+[f_F(Eltseq(a)[i])*Basis(K)[i]
	      : i in [1..Degree(K)]];
end function;

function gauss_sum(eps, Q_huge)
    cond := Conductor(eps);
    chi := DirichletGroupFull(cond)!eps;
    if cond eq 1 then
	return Q_huge!1;
    end if;
    Q_cond<zeta_cond> := CyclotomicField(cond);
    Z_cond_star := [i : i in [0..cond-1] | GCD(i,cond) eq 1];
    gs := &+[zeta_cond^i*chi(i) : i in Z_cond_star];
    return Q_huge!gs;
end function;

function Rop(eps, SKpowersQ_L)
    cond := Conductor(eps);
    if cond eq 1 then
	return SKpowersQ_L[1][1]^0;
    end if;
    return &+[(eps^(-1))(i-1)*SKpowersQ_L[cond][i] : i in [1..cond]];
end function;

function pi(mu, oldspace_full, oldspaces, B_mat)
    Kf := BaseRing(Parent(mu));
    if mu in ChangeRing(oldspace_full, Kf) then
	oldsps := [ChangeRing(s, Kf) : s in oldspaces];
	basis := &cat [Basis(s) : s in oldsps];
	oldsp := VectorSpaceWithBasis(basis);
	bb := Solution(Matrix(Basis(oldsp)), mu);
    else
	return mu;
    end if;
    dd := [Dimension(s) : s in oldspaces];
    cumsum := [&+dd[1..i] : i in [0..#dd]];
    mus := [&+[bb[i]*Basis(oldsp)[i] : i in [cumsum[j]+1..cumsum[j+1]]]
	       : j in [1..#dd]];
    assert &+mus eq mu;
    return mus[1]*ChangeRing(Transpose(B_mat), Kf);
end function;

function pr(flist, check, Nold, prec)
    K := Universe(flist);
    if IsAbsoluteField(K) then
	folds := [f : f in Nold |
		  &and[Coefficients(MinimalPolynomial(flist[i]))
		       eq Coefficients(MinimalPolynomial(Coefficient(f,i)))
		       : i in check]];
//		       : i in [1..check]]];
    else
	folds := [f : f in Nold |
		  &and[Coefficients(AbsoluteMinimalPolynomial(flist[i]))
		       eq Coefficients(AbsoluteMinimalPolynomial(Coefficient(f,i)))
		       : i in check]];
//		       : i in [1..check]]];
    end if;
    assert #folds eq 1;
    fold := folds[1];
    Kf := BaseRing(Parent(fold));
    if (Type(Kf) eq FldRat) then
	embs := [hom<Kf->K|>];
    elif IsAbsoluteField(K) then
	embs := [hom<Kf->K | r[1]> : r in Roots(DefiningPolynomial(Kf),K)];
    else
	embs := [hom<AbsoluteField(Kf)->K | r[1]>
		 : r in Roots(DefiningPolynomial(AbsoluteField(Kf)),K)];
    end if;
    embs := [e : e in embs | &and[e(Coefficient(fold, i)) eq flist[i]
				  : i in check]];
//				  : i in [1..check]]];
    assert #embs eq 1;
    return [embs[1](Coefficient(fold, i)) : i in [1..prec-1]];
end function;

function chartwist(flist, chi, Q_L_to_Q_huge)
    return [Q_L_to_Q_huge(chi(n))*flist[n] : n in [1..#flist]];
end function;

function IsEqualPowerSeries(f, g)
    Kf := BaseRing(Parent(f));
    Kg := BaseRing(Parent(g));
    if (Type(Kf) eq FldRat) or (Type(Kg) eq FldRat) then
	is_isom := IsIsomorphic(Kf, Kg);
	if is_isom then phi := hom<Kf->Kg|>; end if;
    else
	is_isom, phi := IsIsomorphic(Kf, Kg);
    end if;
    if not is_isom then return false; end if;
    auts := Automorphisms(Kg);
    embs := [phi*aut : aut in auts];
    prec := Minimum(AbsolutePrecision(f), AbsolutePrecision(g));
    return exists(e){e : e in embs |
		     &and[e(Coefficient(f, i))
			  eq Coefficient(g,i) : i in [0..prec-1]]};
end function;

procedure add_old_twists(~new_mutwists, ~new_ftwists, ~new_powerlist,
			 ftws, oldspaces_full, oldspaces,
			 Kf, B_mats, Tr_mats, num_coset_reps,
			 alist, Nold, prec, deg_divs, Q_huge,
			 qKK, chis)
    
    for mutw_idx in [1..#new_mutwists] do
	mutw := new_mutwists[mutw_idx];
	ftw := ftws[mutw_idx];
	for sp_idx in [1..#oldspaces_full] do
	    if mutw in ChangeRing(oldspaces_full[sp_idx], Kf) then
		new_mutwists cat:= [pi(mutw, oldspaces_full[sp_idx],
				       oldspaces[sp_idx],
				       B_mats[sp_idx][1]) *
				    Transpose(ChangeRing(Tr_mats[sp_idx][2],Kf))
				    / num_coset_reps[sp_idx]];
		// ftwpr := pr(ftw, #alist, Nold[sp_idx], prec);
		cond := Conductor(chis[mutw_idx]);
		check := [i : i in [1..#alist] | GCD(i, cond) eq 1];
		ftwpr := pr(ftw, check, Nold[sp_idx], prec);
		d := deg_divs[sp_idx][2];
		ftwprB := &+[gauss_sum(chis[mutw_idx], Q_huge)
			     *ftwpr[j]*qKK^(d*j)
			     : j in [1..prec-1]];
		new_ftwists cat:= [[Coefficient(ftwprB,idx)
				    : idx in [1..prec-1]]];
		Append(~new_powerlist, new_powerlist[mutw_idx]) ;
	    end if;
	end for;
    end for;
    return;
end procedure;

function make_real_twist_orbit(alist, primes, Kf_to_KK, Tpluslist,
			       prec, cc, sigma, NN, Nold,
			       oldspaces_full, oldspaces,
			       C, Cplus, chis,
			       Q_huge, zeta_K,
			       K, SKpowersQ_L,
			       B_mats,
			       Tr_mats,
			       deg_divs,
			       num_coset_reps,
			       Q_L_to_Q_huge)
    Kf := Domain(Kf_to_KK);
    dim := Dimension(C);
    fpos :=[g : g in NN |
	    &and[Coefficients(MinimalPolynomial(alist[i]))
		 eq Coefficients(MinimalPolynomial(Coefficient(g,i)))
		 : i in [1..#alist]]];
    assert #fpos eq 1;
    f := fpos[1];
    F := BaseRing(Parent(f));
    if (Type(F) eq FldRat) then
	embs := [hom<F->Kf|>];
    else
	embs := [hom<F->Kf | r[1]> : r in Roots(DefiningPolynomial(F),Kf)];
    end if;
    embs := [e : e in embs | &and[e(Coefficient(f, i)) eq alist[i]
				  : i in [1..#alist]]];
    assert #embs eq 1;
    emb := embs[1];
    flist := [cc(Kf_to_KK(emb(Coefficient(f,i)))) : i in [1..prec-1]];
    subsp := VectorSpace(Kf, dim);
    for i in [1..#Nold] do
	if exists(g){g : g in Nold[i] | IsEqualPowerSeries(f,g)} then
	    subsp := ChangeRing(oldspaces[i][1], Kf);
	    break;
	end if;
    end for;

    intsn := VectorSpace(Kf, Dimension(C) div 2);
    for i in [1..#Tpluslist] do
	T := Tpluslist[i];
	intsn := intsn meet Kernel(ChangeRing(T, Kf) - Kf!alist[primes[i]]);
    end for;
    Hb := [x*ChangeRing(BasisMatrix(Cplus),Kf) : x in Basis(intsn)];
    H := sub<Universe(Hb)|Hb> meet subsp;
    assert Dimension(H) eq 1;
    mu := Basis(H)[1];
    LKK<qKK> := PowerSeriesRing(Codomain(Kf_to_KK), prec);
    
    zero_vec := Vector([0 : chi in chis]);

    // This is just for coercing issues.
    mu0 := mu*ChangeRing(Transpose(Rop(Universe(chis)!1,SKpowersQ_L)), Kf);
    
    base_mutwists := [mu0];
    base_ftwists := [flist];
    base_powerlist := [zero_vec];

    orig_mutwists := [[mu0]];
    orig_ftws := [[flist]];
    orig_powerlist := [[zero_vec]];
    
    add_old_twists(~base_mutwists, ~base_ftwists, ~base_powerlist,
		   [flist], oldspaces_full, oldspaces,
		   Kf, B_mats, Tr_mats, num_coset_reps,
		   alist, Nold, prec, deg_divs, Q_huge,
		   qKK, [Universe(chis)!1]);

    mutwists := [base_mutwists];
    ftwists := [base_ftwists];
    powerlist := [base_powerlist];
    
    for gen_idx in [1..#chis] do
	chi := chis[gen_idx];
	n_chi := Order(chi);
	e_chi := Vector([0 : j in [1..gen_idx-1]] cat [1]
			cat [0 : j in [gen_idx+1..#chis]]);
	for i in [1..n_chi-1] do
	    new_powerlist := [v + e_chi : v in orig_powerlist[#powerlist]];

	    chars := [&*[chis[i]^(-exp[i]) : i in [1..#chis]]
		      : exp in new_powerlist];

	    chars := [* DirichletGroupFull(Conductor(eps))!eps
		      : eps in chars *];

	    new_ftws := [chartwist(flist, eps^(-1), Q_L_to_Q_huge)
			 : eps in chars];
	    
	    new_ftwists := [[gauss_sum(chars[i], Q_huge)*a
			     : a in new_ftws[i]] : i in [1..#chars]];
	    
	    new_mutwists := [mu*ChangeRing(Transpose(Rop(eps,
							SKpowersQ_L)), Kf)
			     : eps in chars];

	    Append(~orig_powerlist, new_powerlist);
	    Append(~orig_ftws, new_ftws);
	    Append(~orig_mutwists, new_mutwists);
	    
	    add_old_twists(~new_mutwists, ~new_ftwists, ~new_powerlist,
			 new_ftws, oldspaces_full, oldspaces,
			 Kf, B_mats, Tr_mats, num_coset_reps,
			 alist, Nold, prec, deg_divs, Q_huge,
			 qKK, chars);

	    Append(~powerlist, new_powerlist);
	    Append(~ftwists, new_ftwists);
	    Append(~mutwists, new_mutwists);
	end for;
	
	orig_powerlist := [&cat orig_powerlist];
	orig_ftws := [&cat orig_ftws];
	orig_mutwists := [&cat orig_mutwists];
	
	powerlist := [&cat powerlist];
	ftwists := [&cat ftwists];
	mutwists := [&cat mutwists];
    end for;
    powerlist := powerlist[1];
    ftwists := ftwists[1];
    mutwists := mutwists[1];
    return VectorSpaceWithBasis(mutwists), ftwists, powerlist;
end function;

function first_nonzero_cf(a)
    for b in a do
	if not IsZero(b) then
	    return b;
	end if;
    end for;
end function;

// When we have an element of a number field over a cyclotomic field
function coeffs_by_zeta(x, Q_L)
    Kf := Parent(x);
    d := Degree(Q_L);
    Kf_Q_L := RelativeField(Q_L, Kf);
    if (Kf_Q_L eq Q_L) then
	return Eltseq(x);
    end if;
    return [Kf!Kf_Q_L![y[j] : y in [Eltseq(z) : z in Eltseq(Kf_Q_L!x)]]
	    : j in [1..d]];
end function;

function Pdmatrix(Pd, d, powerlist, chis,
		  Q_L, Q_huge, zeta_K, K,
		  Q_L_to_Q_huge, Q_K_to_Q_huge, perm_d)
    n := #powerlist;
    chars := [&*[chis[i]^(-exp[i]) : i in [1..#chis]]
	      : exp in powerlist];
    
    chars := [* DirichletGroupFull(Conductor(eps))!eps
	      : eps in chars *];
 
    gs_ratios := [Pd(gauss_sum(chars[i], Q_huge))
		  /gauss_sum(chars[perm_d[i]], Q_huge)
		  : i in [1..#chars]];

    // small_diag := DiagonalMatrix(gs_ratios);
    list := [];
    Q_K := Domain(Q_K_to_Q_huge);
    zeta_L := Q_L.1;
    L := EulerPhi(K) div 2;
    _, u, v := XGCD(K,L);
    for i in [0..EulerPhi(K)-1] do
	j := (d*i) mod K;
	elts := [Eltseq(zeta_K^j * x) : x in gs_ratios];
	coeffs := [&+[zeta_L^(u*i)*x_elt[i+1]*Vector(Q_L,Eltseq(zeta_K^(v*i)))
			    : i in [0..Degree(Q_huge)-1]] : x_elt in elts];
	Append(~list, [MonomialMatrix(n,n,[gr[i] : gr in coeffs], perm_d)
				     : i in [1..EulerPhi(K)]]);
    end for;
    return BlockMatrix(list);
end function;

// For some reason magma does not how to invert Kf_to_KK.
// We fix that problem

function reverse_nf_coercion(a, Kf_to_KK)
    QQ := Rationals();
    Kf := Domain(Kf_to_KK);
    KK := Codomain(Kf_to_KK);
    assert a in KK;
    roots := [r[1] : r in Roots(AbsoluteMinimalPolynomial(a),Kf)];
    assert exists(r){r : r in roots | Kf_to_KK(r) eq a};
    return r;
end function;

function fixed_cusp_forms_QQ(as, primes, Tpluslist, Kf_to_KKs, prec,
			     GFS, Bmats, Pds, ds,
			     cc, sigma, NN, Nold,
			     oldspaces_full,
			     oldspaces,
			     C, Cplus, chis,
			     Q_huge, Q_L, zeta_huge, zeta_K,
			     K, SKpowersQ_L,
			     B_mats,
			     Tr_mats,
			     deg_divs,
			     num_coset_reps, J,
			     Q_K_plus_to_Q_K, Q_K_to_Q_huge, Q_L_to_Q_huge,
			     Q_gcd, zeta_gcd, Q_gcd_to_Q_K)
    FCF := [];
    twist_orbit_indices := [];
    already_visited := {};
    i := 1;
    KK_aps := [*[Kf_to_KKs[j](aps[j]) : aps in as] : j in [1..#as[1]]*];
    while #already_visited lt #as[1] do
	while (i in already_visited) do
	    i +:= 1;
	end while;
	print "Computing twist orbit no. ", i, "out of ", #as[1];
	alist := [aps[i] : aps in as];
	Kf_to_KK := Kf_to_KKs[i];
	Kf := Domain(Kf_to_KK);
	KK := Codomain(Kf_to_KK);
	Q_huge_to_KK := hom<Q_huge->KK | KK!zeta_huge>;
	real_twist_orbit_ms, twist_mfs, powerlist :=
	    make_real_twist_orbit(alist, primes, Kf_to_KK, Tpluslist,
				  prec, cc, sigma, NN, Nold,
				  oldspaces_full, oldspaces,
				  C, Cplus, chis,
				  Q_huge, zeta_K,
				  K, SKpowersQ_L,
				  B_mats,
				  Tr_mats,
				  deg_divs,
				  num_coset_reps,
				  Q_L_to_Q_huge);
	twist_all_aps := [* *];
	for twist_mf in twist_mfs do
	    nonzero := exists(pivot){pivot : pivot in [1..#twist_mf]
				     | twist_mf[pivot] ne 0};
	    if nonzero then
		twist_aps := [x/twist_mf[pivot] : x in twist_mf];
	    else
		twist_aps := twist_mf;
	    end if;
	    Append(~twist_all_aps, twist_aps);
	    inlist := exists(j){j : j in [1..#as[1]] |
				Universe(KK_aps[j]) eq Universe(twist_aps) and
				&and[MinimalPolynomial(KK_aps[j][l]) eq
				     MinimalPolynomial(twist_aps[l]) : l in [1..#as]]};
	    if inlist then
		Include(~already_visited, j);
	    end if;
	end for;
	twist_orbit_index := [];
	FCF_orbit := [];
	fixed_space_basis := Basis(ChangeRing(GFS, Kf)
					     meet real_twist_orbit_ms);
	dim_orbit := Dimension(real_twist_orbit_ms);
	if #fixed_space_basis gt 0 then
	    print "Orbit intersects fixed space. Finding G-fixed vectors...";
	    fixed_basis_cfs :=
		[Eltseq(Solution(BasisMatrix(real_twist_orbit_ms), mu))
		 : mu in fixed_space_basis];
	    
	    coeffs_zeta := [[coeffs_by_zeta(b, Q_gcd) : b in b_imgs]
			    : b_imgs in fixed_basis_cfs];
	    zeta_to_Q_K := [[Vector(Kf,Eltseq(Q_gcd_to_Q_K(zeta_gcd)^i
					    *zeta_K^r))
			   : i in [0..Degree(Q_gcd)-1]]
			  : r in [0..EulerPhi(K)-1]];
	    fb_imgs_tr := [[[&+[cz[l][i+1]*zeta_to_Q_K[r+1][i+1]
			       : i in [0..Degree(Q_gcd)-1]]
			     : l in [1..dim_orbit]]
			    : r in [0..EulerPhi(K)-1]]
			  : cz in coeffs_zeta];
	    fb_imgs_block := [Matrix([Vector(Eltseq(Transpose(Matrix(fb_img_tr[r+1]))))
					     : fb_img_tr in fb_imgs_tr])
				      : r in [0..EulerPhi(K)-1]];
	    fixed_basis_block := VerticalJoin(fb_imgs_block);
	    fixed_ms_space_QQ := VectorSpace(Kf,EulerPhi(K)*#fixed_space_basis);
	
	    for k in [1..#Bmats] do
		Bmat := Bmats[k];
		Pd := Pds[k];
		d := ds[k];
		B_imgs := [mu*ChangeRing(Transpose(Bmat),Kf)
			   : mu in fixed_space_basis];
		assert &and[mu*ChangeRing(Transpose(J),Kf)
			    eq mu : mu in B_imgs];
		B_imgs_cfs :=
		    [Eltseq(Solution(BasisMatrix(real_twist_orbit_ms),
				     ChangeRing(mu,Kf))) : mu in B_imgs];

		coeffs_zeta := [[coeffs_by_zeta(b, Q_gcd) : b in b_imgs]
				: b_imgs in B_imgs_cfs];
		B_imgs_tr := [[[&+[cz[l][i+1]*zeta_to_Q_K[r+1][i+1]
				   : i in [0..Degree(Q_gcd)-1]]
				: l in [1..dim_orbit]]
			       : r in [0..EulerPhi(K)-1]]
			      : cz in coeffs_zeta];
		B_imgs_block := [Matrix([Vector(Eltseq(Transpose(Matrix(b_imgs_tr[r+1]))))
					        : b_imgs_tr in B_imgs_tr])
					 : r in [0..EulerPhi(K)-1]];
		B_imgs_block := VerticalJoin(B_imgs_block);

		perm_d := [Index(twist_all_aps, [Pd(x) : x in twist_ap])
			   : twist_ap in twist_all_aps];
		// Check that the Pd action does permute the basis elements
		assert Sort(perm_d) eq [1..dim_orbit];
		pd_mat := Pdmatrix(Pd,d,powerlist,chis, Q_L, Q_huge,
				   zeta_K, K, Q_L_to_Q_huge,Q_K_to_Q_huge,
				   perm_d);
		B_pd_mat := B_imgs_block * ChangeRing(pd_mat, Kf);
		B_pd_cfs := Solution(fixed_basis_block, B_pd_mat);
		I_mat := IdentityMatrix(Kf,EulerPhi(K)*#fixed_space_basis);
		fixed_B_pd := Kernel(B_pd_cfs - I_mat);
		fixed_ms_space_QQ meet:= fixed_B_pd;
	    end for;
	    fmssQQ_cc := [[cc(Kf_to_KK(a)) : a in Eltseq(v)]
			  : v in Basis(fixed_ms_space_QQ)];
	    fixed_basis_cfs_cc := [[cc(Kf_to_KK(a)) : a in mulist]
				   : mulist in fixed_basis_cfs];
	    fixed_cusp_forms_orbit_raw :=
		[&+[clist[i]*Vector(twist_mfs[i]) : i in [1..#clist]]
		 : clist in fixed_basis_cfs_cc];
	    fcf_ext := &cat[[Vector(Q_K_to_Q_huge(zeta_K^(-i))*f)
			     : f in fixed_cusp_forms_orbit_raw]
			    : i in [0..EulerPhi(K)-1]];
	    fsols := [&+[fmssQQ_cc[i][j]*fcf_ext[j] : j in [1..#fcf_ext]]
		      : i in [1..#fmssQQ_cc]];
	    // !! TODO : Should also treat the general case (where KK has larger degree)
	    if Degree(KK) eq 2 then
		fsols_cc := [Vector([sigma(a) : a in Eltseq(f)]) : f in fsols];
		// We check for the case where f and f_bar are linearly dependent
		pivots := [];
		for fsol in fsols do
		    assert exists(idx){idx : idx in [1..Degree(fsol)]
				       | fsol[idx] ne 0};
		    Append(~pivots, idx);
		end for;
		fsols_nrm := [fsols[i] / fsols[i][pivots[i]] : i in [1..#fsols]];
		fsols_cc_nrm := [fsols_cc[i] / fsols_cc[i][pivots[i]] : i in [1..#fsols]];
		fixed_cusp_forms_orbit_ns :=
		    &cat[fsols_nrm[i] eq fsols_cc_nrm[i]
			 select [fsols[i] + fsols_cc[i]] else
			 [fsols[i] + fsols_cc[i], (fsols[i]-fsols_cc[i])/KK.1]
			 : i in [1..#fsols]];
		/*
		    &cat[[f+Vector([sigma(a) : a in Eltseq(f)]),
			  (f-Vector([sigma(a) : a in Eltseq(f)]))/KK.1]
			 : f in fsols];
	       */
	    else
		fixed_cusp_forms_orbit_ns := fsols;
	    end if;
	    // This doesn't necessarily have to happen.
	    // Some choices of generators yield fixed forms
	    // with coefficients in Q_huge.
	    // A way to deal with that could be a choice of generators
	    // such that the forms will actually be fixed under the Pd's.
	    // (i.e. all the Bgens will be trivial, and gens will generate
	    // the intersection with SL2)
	    /*
	    if (TotallyReal) then
		fixed_cusp_forms_orbit_Q_K_plus :=
		    [Vector([(a@@Q_K_to_Q_huge)@@Q_K_plus_to_Q_K :
			     a in Eltseq(f)])
		     : f in fixed_cusp_forms_orbit_ns];
	    else
		fixed_cusp_forms_orbit_Q_K_plus :=
		[Vector([a@@Q_K_to_Q_huge : a in Eltseq(f)])
		 : f in fixed_cusp_forms_orbit_ns];
	    end if;
	   */
	    Q_K := Domain(Q_K_to_Q_huge);
	    Q_K_plus := Domain(Q_K_plus_to_Q_K);
	    in_Q_K := &and &cat[ [IsCoercible(Q_K, a) : a in Eltseq(f)]
				 : f in fixed_cusp_forms_orbit_ns ];
	    
	    if in_Q_K then
		in_Q_K_plus := &and &cat[ [IsCoercible(Q_K_plus, Q_K!a) : a in Eltseq(f)]
					  : f in fixed_cusp_forms_orbit_ns ];
		if in_Q_K_plus then
		    fixed_cusp_forms_orbit_Q_K_plus :=
			[Vector([(a@@Q_K_to_Q_huge)@@Q_K_plus_to_Q_K : a in Eltseq(f)])
			 : f in fixed_cusp_forms_orbit_ns];
		else
		    fixed_cusp_forms_orbit_Q_K_plus :=
		    [Vector([a@@Q_K_to_Q_huge : a in Eltseq(f)])
		     : f in fixed_cusp_forms_orbit_ns];
		end if;
	    else
		fixed_cusp_forms_orbit_Q_K_plus :=
		[Vector([Q_huge!a  : a in Eltseq(f)]) : f in fixed_cusp_forms_orbit_ns];
	    end if;
	    FCF_orbit cat:= [fixed_cusp_forms_orbit_Q_K_plus];
	    twist_orbit_index cat:=
		[[i : j in [1..#fixed_cusp_forms_orbit_Q_K_plus]]];
	else
	    FCF_orbit cat:= [[]];
	    twist_orbit_index cat:= [[]];
	end if;
	FCF cat:= [FCF_orbit];
	twist_orbit_indices cat:= [twist_orbit_index];
    end while;
    fs := &cat [FCF[i][1] : i in [1..#FCF]];
    tos := &cat[twist_orbit_indices[i][1] : i in [1..#FCF]];
    // make sure we have the right number of forms
    assert 2*#fs eq Dimension(GFS);
    return fs, tos;
end function;

function IsCompatibleChar(M1, M2)
    eps1 := DirichletCharacter(M1);
    eps2 := DirichletCharacter(M2);
    return
	IsCoercible(Parent(eps1), eps2) and (Parent(eps1)!eps2 eq eps1); 
end function;

forward get_degeneracy_maps;

function NewformDecompositionSubspaceMaps(M)
    ms := MultiSpaces(M);
    S := CuspidalSubspace(M);
    Sb := BasisMatrix(VectorSpace(S));
    Sbd := BasisMatrix(DualVectorSpace(S));
    D := NewformDecomposition(S);
    DD := [* *];
    ims := [* *];
    for d in D do
	M_old := RestrictionOfScalarsToQ(AmbientSpace(AssociatedNewSpace(d)));
	if not IsIdentical(M_old, M) then
	    quo_lev := Level(M) div Level(M_old);
	    divs := Divisors(quo_lev);
	    betas := [];
	    for m in divs do
		alpha, ims_alpha, beta := get_degeneracy_maps(M_old, M, m);
		im_d := Image(beta);
		im := Image(alpha);
		Append(~ims, [im, im_d]);
		Append(~betas, <alpha, beta, quo_lev div m>);
	    end for;
	    for j in [1..#betas] do
		Append(~DD, <d, betas[j]>);
	    end for;
	else
	    one := <IdentityMatrix(BaseRing(d), Dimension(S)),
		    IdentityMatrix(BaseRing(d), Dimension(S)), 1>;
	    Append(~DD, <d, one >);
	    im := VectorSpaceWithBasis(
			  Solution(Sb,BasisMatrix(VectorSpace(d))));
	    im_d := VectorSpaceWithBasis(
			    Solution(Sbd, BasisMatrix(DualVectorSpace(d))));
	    Append(~ims, [im, im_d]);
	end if;
    end for;
    dim := &+[Dimension(d[1])*Degree(BaseRing(d[1])) : d in DD];
    assert dim eq Dimension(S);
    return DD, ims;
end function;

function getBoxGandAL(num)
    PGnsplus7 := GammaNSplus(7,Integers(7)!5);
    Gnsplus7 := ImageInLevelGL(PGnsplus7);
    PG := PGnsplus7;
    if num gt 1 then
	Ge7 := Subgroups(Gnsplus7 : IndexEqual := 2, IsCyclic)[1]`subgroup;
	PGe7 := PSL2Subgroup(Ge7);
	PG := PGe7;
    end if;
    PG := PG meet Gamma0(5);
    G := ImageInLevelGL(PG);
    w5 := [2890, 193 , -8685, -580];
    assert Determinant(Matrix(2,2,w5)) eq 5;
    phi7 := [3,1,-10,-3];
    assert Determinant(Matrix(2,2,phi7)) eq 1;
    phi7w5 := Eltseq(Matrix(2,2,phi7)*Matrix(2,2,w5));
    ws := [[],[w5], [phi7w5]];
    return G, ws[num];
end function;

function make_Borel(N)
    gens := [[1,1,0,1]];
    for t in [1..N-1] do
	if GCD(t, N) eq 1 then
	    Append(~gens, [t,0,0,1]);
	    Append(~gens, [1,0,0,t]);
	end if;
    end for;
    return sub<GL(2, Integers(N)) | gens>;
end function;

function get_M_K(G)
    N := Modulus(BaseRing(G));
    // First we find M such that G_M is contained in B_0(M)
    M := GCD([N] cat [Integers()!g[2,1] : g in Generators(G)]);
    K := N div M;
    // we make sure that GCD(K,M) eq 1
    fac := Factorization(N);
    M := &*([1] cat [fa[1]^fa[2] : fa in fac | K mod fa[1] ne 0]);
    // Now we reduce it until equality holds
    divs := Reverse(Divisors(M));
    found := false;
    // we don't try 1 because GL(2,1) etc.
    for M in divs[1..#divs-1] do
	G_M := sub< GL(2, Integers(M)) |
		  [[Integers(M)!x : x in Eltseq(g)] : g in Generators(G)]>;
	B_M := make_Borel(M);
	if G_M eq B_M then
	    found := true;
	    break;
	end if;
    end for;
    if not found then M := 1; end if;
    
    K := N div M;

    return M, K;
end function;

function get_gens(G)
    N := Modulus(BaseRing(G));
    /*
    // First we find M such that G_M is contained in B_0(M)
    M := GCD([N] cat [Integers()!g[2,1] : g in Generators(G)]);
    K := N div M;
    // we make sure that GCD(K,M) eq 1
    fac := Factorization(N);
    M := &*([1] cat [fa[1]^fa[2] : fa in fac | K mod fa[1] ne 0]);
    // Now we reduce it until equality holds
    divs := Reverse(Divisors(M));
    found := false;
    // we don't try 1 because GL(2,1) etc.
    for M in divs[1..#divs-1] do
	G_M := sub< GL(2, Integers(M)) |
		  [[Integers(M)!x : x in Eltseq(g)] : g in Generators(G)]>;
	B_M := make_Borel(M);
	if G_M eq B_M then
	    found := true;
	    break;
	end if;
    end for;
    if not found then M := 1; end if;
    
    K := N div M;
   */
    M, K := get_M_K(G);
    H := G meet SL(2, Integers(N));
    gens := [Eltseq(FindLiftToSL2(g)) : g in Generators(H)];
    quo, quo_mat := G/H;
    Cs := [g@@quo_mat : g in Generators(quo)];
    ds := [Determinant(C) : C in Cs];
    Bgens := [C*GL(2,Integers(N))![Determinant(C),0,0,1]^(-1) : C in Cs];
    Bgens := [Eltseq(FindLiftToSL2(b)) : b in Bgens];
    return gens, Bgens, K, M, ds;
end function;

function get_degeneracy_maps(M_old, M, d)
    C := CuspidalSubspace(M);
    C_old := CuspidalSubspace(M_old);
    C_old_new := NewSubspace(C_old);
    Cbmat := BasisMatrix(VectorSpace(C));
    Cboldmat := BasisMatrix(VectorSpace(C_old));
    Cboldnewmat := BasisMatrix(VectorSpace(C_old_new));
    ms := MultiSpaces(M);
    ms_old := MultiSpaces(M_old);
    all_alphas := [];
    all_betas := [];
    for j in [1..#ms_old] do
	assert exists(i){i : i in [1..#ms]
			 | IsCompatibleChar(ms[i], ms_old[j])};
	deg := DegeneracyMatrix(ms_old[j], ms[i], d);
	deg_d := DegeneracyMatrix(ms[i], ms_old[j], d);
	multi := MultiQuotientMaps(M)[i];
	multi_old := MultiQuotientMaps(M_old)[j];
	quo_mat := Matrix([Representation(multi(x))
			       : x in Basis(M)]);
	quo_old := Matrix([Representation(multi_old(b))
			   : b in Basis(M_old)]);
	deg_eltseq := [&cat[Eltseq(x) : x in Eltseq(row)]
		       : row in Rows(quo_old*deg)];
	deg_d_eltseq := [&cat[Eltseq(x) : x in Eltseq(row)]
			 : row in Rows(quo_mat*deg_d)];
	quo_inv := Matrix([Representation((z*b)@@multi)
			   : z in Basis(BaseRing(ms[i])),
			     b in Basis(ms[i])]);
	quo_old_inv := Matrix([Representation((z*b)@@multi_old)
			       : z in Basis(BaseRing(ms_old[j])),
				 b in Basis(ms_old[j])]);
	alpha := Matrix(deg_eltseq)*quo_inv;
	beta := Transpose(quo_old_inv)*Transpose(Matrix(deg_d_eltseq));
	Append(~all_alphas, alpha);
	Append(~all_betas, beta);
    end for;
    big_alpha := &+all_alphas;
    big_beta := &+all_betas;
    ims_mat := Cboldmat*big_alpha;
    alpha_C := Transpose(Solution(Cbmat, ims_mat));
    beta_C := Transpose(Solution(Cboldmat, Cbmat*Transpose(big_beta)));
    alpha_new_C := Transpose(Solution(Cbmat, Cboldnewmat*big_alpha));
    return alpha_C, [M!v : v in Rows(ims_mat)], beta_C, alpha_new_C;
end function;

// !! TODO - right now we treat the newforms in the top level separately.
// However, this could be done in the same way.
function get_old_spaces(MS)
    N := Level(MS);
    // old_levels := [N div p : p in PrimeDivisors(N)];
    C := CuspidalSubspace(MS);
    D := NewformDecomposition(C);
    old_levels := Sort([lev : lev in {Level(d) : d in D} | lev ne N]);
    dirichlet_groups := [DirichletGroupFull(level) : level in old_levels];
    // reduce them to minimal base rings
    conds := [Conductor(BaseRing(grp)) : grp in dirichlet_groups];
    dirichlet_groups := [DirichletGroup(old_levels[i],
					CyclotomicField(conds[i]))
			 : i in [1..#old_levels]];
    chars := [*[dirichlet_groups[i]!DirichletCharacter(d) : d in D |
		Level(d) eq (old_levels[i])] : i in [1..#old_levels]*];
    M_old := [ModularSymbols(chis, 2) : chis in chars | not IsEmpty(chis)];
    C_old := [CuspidalSubspace(m) : m in M_old];
    C_old_new := [NewSubspace(c) : c in C_old];
 //   assert &and[Dimension(C_old[i]) eq Dimension(C_old_new[i])
//		: i in [1..#C_old]];
//    C_oldb := [* Basis(c) : c in C_old *];
//    C_oldmat := [* Transpose(Matrix([Eltseq(c) : c in b])) : b in C_oldb *];
    
    num_coset_reps := [];
    Tr_mats := [];
    Tr_ims := [];
    B_mats := [];
    deg_divs := [];
    Tr_mats_new := [];
    for m_old in M_old do
	N_old := Level(m_old);
	a := N div N_old;
	m_Tr_mats := [* *];
	m_Tr_ims := [* *];
	m_B_mats := [* *];
	m_deg_divs := [];
	m_Tr_mats_new := [* *];
	// This isn't always right, but it doesnt matter
	num_reps := GCD(N_old, a) eq 1 select a + 1 else a;
	for d in Divisors(a) do
	    tr_mat, tr_ims, b_mat, tr_mat_new := get_degeneracy_maps(m_old, MS, d);
	    Append(~m_Tr_mats, tr_mat/d);
	    Append(~m_Tr_mats_new, tr_mat_new/d);
	    Append(~m_Tr_ims, tr_ims);
	    Append(~m_B_mats, b_mat*d);
	    Append(~m_deg_divs, d);
	    m_dim := Dimension(CuspidalSubspace(m_old));
	    assert Rank(tr_mat) eq m_dim;
	    I := IdentityMatrix(Rationals(), m_dim);
	    id_mat := Transpose(tr_mat)*Transpose(b_mat);
	    num_reps := id_mat[1,1];
	    assert id_mat eq num_reps*I;
	end for;
	// We will be using the fact that the first degeneracy map
	// is the inclusion
	assert m_deg_divs[1] eq 1;
	Append(~Tr_mats, m_Tr_mats);
	Append(~Tr_ims, m_Tr_ims);
	Append(~B_mats, m_B_mats);
	Append(~deg_divs, m_deg_divs);
	Append(~num_coset_reps, num_reps);
	Append(~Tr_mats_new, m_Tr_mats_new);
    end for; 
 
    //   oldspace_bases := [[* Rows(Transpose(tr)) : tr in m *] : m in Tr_mats];
    oldspace_bases := [[* Rows(Transpose(tr)) : tr in m *] : m in Tr_mats_new];
    oldspaces := [[sub<Universe(bb) | bb> : bb in bases]
		  : bases in oldspace_bases];
   
    oldspaces_full := [&+spaces : spaces in oldspaces];
   
    assert &and[Dimension(oldspaces_full[i]) eq
		&+[Dimension(s) : s in oldspaces[i]] : i in [1..#oldspaces]];
    
    return Tr_mats, Tr_ims, B_mats, deg_divs,
	   num_coset_reps, oldspaces_full, oldspaces, C_old_new;
end function;

function get_relevant_components(gs, MS)
  C := CuspidalSubspace(MS);
  fixed_spaces := [Kernel(Transpose(gmat)-
			   IdentityMatrix(Rationals(), Nrows(gmat)))
		     : gmat in gs];
  H_inv := &meet fixed_spaces;
  Cb := Basis(C);
  Cmat := Transpose(Matrix([Eltseq(c) : c in Cb]));
  DD, ims := NewformDecompositionSubspaceMaps(MS);
  //  proj := [*BasisMatrix(DualVectorSpace(dd[1]))*dd[2][2] : dd in DD*];
  proj := [* im[2] : im in ims *];
  H_inv_bas := Transpose(BasisMatrix(H_inv));
  H_components := [i : i in [1..#proj] | proj[i]*H_inv_bas ne 0];
  S_H := [*DD[h] : h in H_components*];
  return S_H;
end function;

function createFieldEmbeddings(K, NN, C, ds)

    dim := Dimension(C);

    L := EulerPhi(K);
    // We will only consider even characters
    if IsEven(L) then
	L := L div 2;
    end if;
    Q_L<zeta_L> := CyclotomicField(L);
    Q_K<zeta_K> := CyclotomicField(K);
    Q_gcd<zeta_gcd> := CyclotomicField(GCD(K,L));
    Q_K_plus, Q_K_plus_to_Q_K := sub<Q_K | zeta_K + zeta_K^(-1)>;
    
    Q_K_q<q> := PowerSeriesRing(Q_K);
    
    Q_huge<zeta_huge> := CyclotomicField(LCM(K,L));

    _, Q_K_to_Q_huge := IsSubfield(Q_K, Q_huge);
    _, Q_L_to_Q_huge := IsSubfield(Q_L, Q_huge);
    _, Q_gcd_to_Q_K := IsSubfield(Q_gcd, Q_K);
    _, Q_gcd_to_Q_L := IsSubfield(Q_gcd, Q_L);

    _<x_L> := PolynomialRing(Q_L);
    _<x_huge> := PolynomialRing(Q_huge);
    
    fields := [* BaseRing(Parent(f)) : f in NN *];
    min_polys := [* DefiningPolynomial(F) : F in fields *];
    huge_fields := [* *];
    for poly in min_polys do
	fac := Factorization(Evaluate(poly, x_huge));
	nt_facs := [f[1] : f in fac | Degree(f[1]) ne 1];
	assert #nt_facs le 1;
	if #nt_facs eq 1 then
	    KK := NumberField(nt_facs[1]);
	else
	    KK := Q_huge;
	end if;
	Append(~huge_fields, KK);
    end for;
		     
    field_embs := [* *];
    for i in [1..#fields] do
	Kf := fields[i];
	Kf_base := BaseRing(Kf);
	if (Type(Kf_base) eq FldRat) and (Kf ne Q_L) then
	    Kf := NumberField(Evaluate(DefiningPolynomial(Kf), x_L));
//	    comp := Compositum(Q_L, Kf);
//	    assert IsSubfield(Q_L, comp);
//	    Kf := RelativeField(Q_L, comp);
	end if;
	assert IsSubfield(fields[i], Kf);
	is_sub, emb := IsSubfield(Kf, huge_fields[i]);
	assert is_sub;
	Append(~field_embs, emb);
    end for;

    cc_Q_huge := hom<Q_huge -> Q_huge | zeta_huge^(-1)>;

    function cc(a)
	return make_nf_func(a, Q_huge, cc_Q_huge);
    end function;

    assert &and[cc(F!zeta_huge) eq F!(zeta_huge^(-1)) : F in huge_fields];

    elts := [Integers()!(Integers(K)!d) : d in ds];
    powers := [CRT([e,1],[K,L div GCD(K,L)]) : e in elts];
    // Checking that CRT actually worked
    assert &and[p ne -1 : p in powers];
    Ps_Q_huge := [hom<Q_huge -> Q_huge | zeta_huge^pow> : pow in powers];

    I := IdentityMatrix(Rationals(), dim);

    X := DirichletGroupFull(K);
    conds := {Conductor(x) : x in Elements(X)};
 
    SKpowersQ_L := AssociativeArray(conds);
    for cond in conds do
	S_cond := Matrix(2,2,[1,1/cond,0,1]);
	S_cond_mat := ChangeRing(gen_to_mat([S_cond],C,C), Q_L);
	S_cond_powers := [ChangeRing(I, Q_L)];
	while (#S_cond_powers lt K) do
	    S_cond_powers cat:= [S_cond_mat*S_cond_powers[#S_cond_powers]];
	end while;
	SKpowersQ_L[cond] := [ChangeRing(M, Q_L) : M in S_cond_powers];
    end for;
    
    sigma_Q_huge := hom<Q_huge -> Q_huge | zeta_huge>;

    function sigma_i(a)
	return sigma(a, Q_huge, sigma_Q_huge);
    end function;
    
    return field_embs, cc, Ps_Q_huge, SKpowersQ_L, Q_huge,
	   Q_L, zeta_huge, zeta_K, Q_K_plus_to_Q_K, Q_K_to_Q_huge,
	   Q_L_to_Q_huge, elts, sigma_i, Q_gcd, zeta_gcd,
	   Q_gcd_to_Q_K;
end function;

forward BoxMethod;

function BoxExample(G, ws, prec)
    return BoxMethod(G, prec : AtkinLehner := ws);
end function;

function int_qexp(f, prec, qKp, Q_K_plus)
    den := LCM([Denominator(f[i]) : i in [1..prec-1]]);
    ff := ChangeRing(f, Q_K_plus);
    return den*&+[ff[i]*qKp^i : i in [1..prec-1]];
end function;

function FindCurveSimple(qexps, prec, n_rel)
    R<q> := Universe(qexps);
    K := BaseRing(R);
    zeta := K.1;
    fs := [f + O(q^prec) : f in qexps];
    g := #fs;
    // Using the original eigenforms yields equations over Q
 //   T, E := EchelonForm(Matrix([AbsEltseq(f) : f in fs]));
//    fs := [&+[E[j][i]*fs[i] : i in [1..g]] : j in [1..g]];
    R<[x]> := PolynomialRing(K,g);
    degmons := [MonomialsOfDegree(R, d) : d in [1..n_rel]];
    prods := [[Evaluate(m, fs) + O(q^prec) : m in degmons[d]] :
	      d in [1..n_rel]];
    kers := [Kernel(Matrix([AbsEltseq(f) : f in prod])) : prod in prods];
    rels := [[&+[Eltseq(kers[d].i)[j]*degmons[d][j] : j in [1..#degmons[d]]] :
	      i in [1..Dimension(kers[d])]] : d in [1..n_rel]];
    I := ideal<R | &cat rels>;
    X := Curve(ProjectiveSpace(R),I);
    // Do we want to assert X is coercible to Q?
    return X, fs;
end function;

function FindHyperellipticCurve(qexps, prec)
    R<q> := Universe(qexps);
    K := BaseRing(R);
    fs := [f + O(q^prec) : f in qexps];
    g := #fs;
    T, E := EchelonForm(Matrix([AbsEltseq(f) : f in fs]));
    fs := [&+[E[j][i]*fs[i] : i in [1..g]] : j in [1..g]];
    x := fs[g-1] / fs[g];
    y := q * Derivative(x) / fs[g];
    mons := [x^i : i in [0..2*g+2]] cat [-y^2];
    denom := q^(-(2*g+2)*Valuation(x));
    f_mons := [denom*m + O(q^AbsolutePrecision(x)) : m in mons];
    ker := Kernel(Matrix([AbsEltseq(f : FixedLength) : f in f_mons]));
    assert Dimension(ker) eq 1;
    ker_b := Basis(ker)[1];
    ker_b /:= -ker_b[2*g+4];
    R<x> := PolynomialRing(K);
    poly := &+[ker_b[i+1]*x^i : i in [0..2*g+2]];
    X := HyperellipticCurve(poly);
    return X, fs;
end function;

// This only works when conjugating one eigenform
// gives you another eigenform
function FindRationalCurve(qexps, prec, n_rel)
    _<q> := PowerSeriesRing(Rationals());
    fs := [];
    for qexp in qexps do
      K := BaseRing(Parent(qexp));
      zeta := K.1;
      for j in [0..Degree(K)-1] do
        f := &+[Trace(zeta^j*Coefficient(qexp, n))*q^n : n in [1..prec-1]];
        f +:= O(q^prec);
        Append(~fs, f);
      end for;
    end for;
    T, E := EchelonForm(Matrix([AbsEltseq(f) : f in fs]));
    fs := [&+[E[j][i]*fs[i] : i in [1..#fs]] : j in [1..#fs]];
    n := #fs;
    R<[x]> := PolynomialRing(Rationals(),n);
    degmons := [MonomialsOfDegree(R, d) : d in [1..n_rel]];
    prods := [[Evaluate(m, fs) + O(q^prec) : m in degmons[d]] :
	      d in [1..n_rel]];
    kers := [Kernel(Matrix([AbsEltseq(f) : f in prod])) : prod in prods];
    rels := [[&+[Eltseq(kers[d].i)[j]*degmons[d][j] : j in [1..#degmons[d]]] :
	      i in [1..Dimension(kers[d])]] : d in [1..n_rel]];
    I := ideal<R | &cat rels>;
    X := Curve(ProjectiveSpace(R),I);
    return X;
end function;

procedure testBoxExample()
    prec := 200;
    fs := [* *];
    for num in [1..3] do
	print "computing for Box's group number ", num;
	G, ws := getBoxGandAL(num);
	Append(~fs, BoxExample(G, ws, prec));
    end for;
    assert &and[#fs[1] eq 6, #fs[2] eq 5, #fs[3] eq 8];
    fs_qexps := [* *];
    for num in [1..3] do
	Q_K_plus := BaseRing(Universe(fs[num]));
	_<qKp> := PowerSeriesRing(Q_K_plus);
	Append(~fs_qexps, [int_qexp(f,prec,qKp,Q_K_plus) : f in fs[num]]);
    end for;
    curves := [* FindCurveSimple(fs, prec, 2) : fs in fs_qexps *];
    assert [Genus(X) : X in curves] eq [6,5,8];
end procedure;

function BoxMethod(G, prec : AtkinLehner := [])
    gens, Bgens, K, M, ds := get_gens(G);

    print "Found generators. K = ", K, " and M = ", M;
    
    gens cat:= AtkinLehner;
    N := M * K^2;
    g1 := CRT([1+K,1], [K^2,M]);
    alpha := Integers()!PrimitiveElement(Integers(M));
    g2 := CRT([1,alpha], [K^2,M]);
    MS := ModularSymbolsH(N, [g1,g2], 2, 0);
    
    C := CuspidalSubspace(MS);
    dim := Dimension(C);

    print "Dimension of large cusp form space is ", dim;
    
    GL2Q := GL(2, Rationals());
    alpha_K := GL(2, Rationals())![1,0,0,1/K];
    gmats := [Matrix(GL2Q!g^alpha_K) : g in gens];
    Bmats := [Matrix(GL2Q!g^alpha_K) : g in Bgens];

    print "Computing action of Gamma on large cusp form space...";
    // This could be made faster,
    // but right now I want to follow Box closely
    // Basically, folowing Cremona - we should only compute the images
    // of S and T, and use these to obtain the images of all the generators.
    gs := [gen_to_mat2(g^(-1),C) : g in gmats];
    Bs := [gen_to_mat2(B^(-1),C) : B in Bmats];
    // Bs := [gen_to_mat2(B,C) : B in Bmats];
    J := Transpose(StarInvolution(C));

    Cplus := Kernel(Transpose(J-1));

    print "Computing old subspaces...";

    Tr_mats, Tr_ims, B_mats, deg_divs,
    num_coset_reps, oldspaces_full,
    oldspaces, C_old_new := get_old_spaces(MS);

    print "Computing newforms...";
    
    Nnew := NewSubspace(C);

    nfd_old := [NewformDecomposition(s) : s in C_old_new];    
    nfd := NewformDecomposition(Nnew);
    Nold := [[* qEigenform(d,prec) : d in nf *] : nf in nfd_old]; 
    Nnew := [* qEigenform(d,prec) : d in nfd *];
    NN := (&cat ([[* *]] cat Nold)) cat Nnew;

    print "Computing Hecke operators...";
    
    max_hecke := 1;
    num_distinct := 0;

    // We want only the Hecke operators prime to p
    // because the embedding of the oldform is no longer
    // an eigenform for the other Hecke operators
    primes := [];
    sep_all := false;
    //   while (num_distinct lt #NN) do
    while (not sep_all) do
	repeat
	    max_hecke := NextPrime(max_hecke);
	until N mod max_hecke ne 0;
	Append(~primes, max_hecke);
	num_distinct := 
	    #{[Coefficients(MinimalPolynomial(Coefficient(f,i)))
	       : i in [1..max_hecke]] : f in NN};
	// we also want to be able to cut the exact subspace
	// using only prime to level Hecke operators
	num_distinct_old := 
	   [ #{[Coefficients(MinimalPolynomial(Coefficient(f,p)))
		: p in primes] : f in n_old} : n_old in Nold];
	sep_old := &and[num_distinct_old[i] eq #Nold[i] : i in [1..#Nold]];
	sep_all := sep_old and (num_distinct eq #NN);
    end while;

    Ts := [HeckeOperator(C, p) : p in primes];
    Tpluslist := [Restrict(T, Cplus) : T in Ts];

    as := [[*Coefficient(f, n) : f in NN *] : n in [1..max_hecke]];

    print "Creating field embeddings...";
    
    field_embs, cc, Ps_Q_huge, SKpowersQ_L,
    Q_huge, Q_L, zeta_huge, zeta_K,
    Q_K_plus_to_Q_K, Q_K_to_Q_huge,
    Q_L_to_Q_huge, elts, sigma_i,
    Q_gcd, zeta_gcd, Q_gcd_to_Q_K := createFieldEmbeddings(K, NN, C, ds);

    // Taking only the forms with trivial Nebentypus character is not good enough
    // We need to take represenatives for X / X^2!

    print "Preparing character group...";
    
    X := DirichletGroupFull(K);
    A, phi := AbelianGroup(X);

    Z2 := AbelianGroup([2]);
    h := hom< A -> Z2 | a :-> IsEven(phi(a)) select 0 else 1>;
    A_even := Kernel(h);
    chis := [phi(g) : g in Generators(A_even)];

    quo, quo_map := A / (2*A_even);
    char_reps := [phi(g@@quo_map) : g in quo];
    
    nfd_trivial := [i : i in [1..#nfd] |
		    X!DirichletCharacter(nfd[i]) in char_reps];
    nfd_old_trivial := [[i : i in [1..#nf] |
			 X!DirichletCharacter(nf[i]) in char_reps]
			: nf in nfd_old]; 

    cumsum := [0] cat [&+[#nf : nf in nfd_old[1..i]] : i in [1..#nfd_old]];
    a_idxs := &cat[ [idx + cumsum[j] : idx in nfd_old_trivial[j]]
		    : j in [1..#nfd_old]];
    a_idxs cat:= [idx + cumsum[#cumsum] : idx in nfd_trivial];

    as := [[* aps[idx] : idx in a_idxs *] : aps in as ];

    print "Computing the Gamma fixed space...";

    fixed_spaces := [Kernel(Transpose(gmat)-
			   IdentityMatrix(Rationals(), Nrows(gmat)))
		     : gmat in gs];

    Gamma_fixed_space := &meet fixed_spaces;

    print "Dimension of fixed space is", Dimension(Gamma_fixed_space);
    
    Kf_to_KKs := [* field_embs[i] : i in a_idxs *];
    
    Ps := [];
    for P_Q_huge in Ps_Q_huge do
	function P(a)
	    return make_nf_func(a, Q_huge, P_Q_huge);
	end function;
	Append(~Ps, P);
    end for;

    print "Entering fixed_cusp_forms_QQ...";
    
    fs,tos := fixed_cusp_forms_QQ(as, primes, Tpluslist, Kf_to_KKs, prec,
				  Gamma_fixed_space,Bs,
				  Ps,elts,
				  cc, sigma_i,
				  NN,Nold,
				  oldspaces_full, oldspaces,
				  C, Cplus, chis,
				  Q_huge, Q_L, zeta_huge, zeta_K,
				  K, SKpowersQ_L,
				  B_mats,
				  Tr_mats,
				  deg_divs,
				  num_coset_reps,
				  J,
				  Q_K_plus_to_Q_K, Q_K_to_Q_huge,
				  Q_L_to_Q_huge, Q_gcd, zeta_gcd,
				  Q_gcd_to_Q_K);
    return fs, tos;
end function;

function ModularCurve(G, genus)
    assert genus ge 2;
    max_deg := Maximum(7-genus, 2);
    prec := max_deg*(2*genus-2)-(max_deg-1) + 1;
    level := Modulus(BaseRing(G));
    prec *:= level;
    fs := BoxMethod(G, prec);
    K := BaseRing(Universe(fs));
    _<q> := PowerSeriesRing(K);
    fs_qexps:=[int_qexp(f,prec,q,K) : f in fs];
    X, fs := FindCurveSimple(fs_qexps, prec, max_deg);
    g := Genus(X);
    if g eq 0 then
	X, fs := FindHyperellipticCurve(fs_qexps, prec);
    end if;
    assert Genus(X) eq genus;
    return X, fs;
end function;

import "../congruence.m" : qExpansionBasis;

procedure testBox(grps_by_name)
    testBoxExample();
    working_examples := ["7A3", "8A2", "8A3", "8B3", "8A5",
			 "9A2", "9B2", "9A3", "9A4", "9B4", "9C4",
			 "10A2", "10B2", "11A2", "11A6",
			 "12B2", "12E2"];
    // Checked all real type conjugates for:
    // 7A3, 8A2, 8A3, 8B3, 9A2, 9B2
    // still not working:
    // (1) 10D2, 10E2, 10F2 - obtains two G-invariant forms.
    // The canonical map yields a genus 0 curve,
    // but I fail to find a hyperelliptic relation.
    // (2) 12C2 - for some reason getting only a single form.
    // (2.5) 10D2, 10E2, 10F2, 12D2 - Now that we choose the another conjugate, it fails!
    // Somehow it does not seem to intersect any orbit !?
    // (3) 12F2 - there is an orbit in which Pd does not act on the basis
    // There is a form whose conjugate is not in this orbit.
    // (4) 13A2 (Gamma1(13)) - something goes wrong when twisting.
    // We twist the form 13.2.e.a and obtain the aps of 169.2.b.a
    // but the mu seems to be in the old subspace.
    // Either we should twist by the inverse in one of them or this is an
    // issue with field embeddings.
    // (5) 14B6 - for some reason getting only 5 forms !?
    // Level 17 - computing the action is nearly killing us
    // (6) 17A6 - We again have an issue with the field embeddings.
    // (7) 18A6 - something's wrong with coeffs_by_zeta !?
    // (8) 35E6 - this is conjugate to Box's example, but for some reason
    // doesn't seem to work !?
    for name in working_examples do
	X,fs := qExpansionBasis(name, grps_by_name);
    end for;
end procedure;
