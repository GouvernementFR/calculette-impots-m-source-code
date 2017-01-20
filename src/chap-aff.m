#*************************************************************************************************************************
#
#Copyright or © or Copr.[DGFIP][2015]
#
#Ce logiciel a été initialement développé par la Direction Générale des 
#Finances Publiques pour permettre le calcul de l'impôt sur le revenu 2015 
#au titre des revenus perçus en 2014. La présente version a permis la 
#génération du moteur de calcul des chaînes de taxation des rôles d'impôt 
#sur le revenu de ce millésime.
#
#Ce logiciel est régi par la licence CeCILL 2.1 soumise au droit français 
#et respectant les principes de diffusion des logiciels libres. Vous pouvez 
#utiliser, modifier et/ou redistribuer ce programme sous les conditions de 
#la licence CeCILL 2.1 telle que diffusée par le CEA, le CNRS et l'INRIA  sur 
#le site "http://www.cecill.info".
#
#Le fait que vous puissiez accéder à cet en-tête signifie que vous avez pris 
#connaissance de la licence CeCILL 2.1 et que vous en avez accepté les termes.
#
#**************************************************************************************************************************
regle 111011:
application : iliad ;

CONST0 = 0;
CONST1 = 1;
CONST2 = 2;
CONST3 = 3;
CONST4 = 4;
CONST10 = 10;
CONST20 = 20;
CONST40 = 40;

regle 1110:
application : batch, iliad;

LIG0 = (1 - positif(IPVLOC)) * (1 - positif(RE168 + TAX1649)) * IND_REV ;

LIG01 = (1 - positif(RE168 + TAX1649)) * (1 - positif(ANNUL2042)) * IND_REV ;

LIG1 = (1 - positif(RE168 + TAX1649)) ;

LIG2 = (1 - positif(ANNUL2042)) ;

LIG3 = positif(positif(CMAJ + 0) 
	+ positif_ou_nul(MAJTX1 - 40) + positif_ou_nul(MAJTX4 - 40)
        + positif_ou_nul(MAJTXPCAP1 - 40) + positif_ou_nul(MAJTXPCAP4 - 40)
        + positif_ou_nul(MAJTXLOY1 - 40) + positif_ou_nul(MAJTXLOY4 - 40)
        + positif_ou_nul(MAJTXCHR1 - 40) + positif_ou_nul(MAJTXCHR4 - 40)
	+ positif_ou_nul(MAJTXC1 - 40) + positif_ou_nul(MAJTXC4 - 40) 
        + positif_ou_nul(MAJTXCVN1 - 40) + positif_ou_nul(MAJTXCVN4 - 40)
	+ positif_ou_nul(MAJTXCDIS1 - 40) + positif_ou_nul(MAJTXCDIS4 - 40)
        + positif_ou_nul(MAJTXGLO1 - 40) + positif_ou_nul(MAJTXGLO4 - 40)
        + positif_ou_nul(MAJTXRSE11 - 40) + positif_ou_nul(MAJTXRSE14 - 40)
        + positif_ou_nul(MAJTXRSE51 - 40) + positif_ou_nul(MAJTXRSE54 - 40)
	+ positif_ou_nul(MAJTXRSE21 - 40) + positif_ou_nul(MAJTXRSE24 - 40)
        + positif_ou_nul(MAJTXRSE31 - 40) + positif_ou_nul(MAJTXRSE34 - 40)
        + positif_ou_nul(MAJTXRSE41 - 40) + positif_ou_nul(MAJTXRSE44 - 40)
        + positif_ou_nul(MAJTXTAXA4 - 40)) ;

regle 1110010:
application : batch , iliad ;


LIG0010 = (INDV * INDC * INDP) * (1 - ART1731BIS) * LIG0 * LIG2 ;

LIG0020 = (INDV * (1 - INDC) * (1 - INDP)) * (1 - ART1731BIS) * LIG0 * LIG2 ;

LIG0030 = (INDC * (1 - INDV) * (1 - INDP)) * (1 - ART1731BIS) * LIG0 * LIG2 ;

LIG0040 = (INDP * (1 - INDV) * (1 - INDC)) * (1 - ART1731BIS) * LIG0 * LIG2 ;

LIG0050 = (INDV * INDC * (1 - INDP)) * (1 - ART1731BIS) * LIG0 * LIG2 ;

LIG0060 = (INDV * INDP * (1 - INDC)) * (1 - ART1731BIS) * LIG0 * LIG2 ;

LIG0070 = (INDC * INDP * (1 - INDV)) * (1 - ART1731BIS) * LIG0 * LIG2 ;

LIG10YT = (INDV * INDC * INDP) * ART1731BIS * LIG0 * LIG2 ;

LIG20YT = (INDV * (1 - INDC) * (1 - INDP)) * ART1731BIS * LIG0 * LIG2 ;

LIG30YT = (INDC * (1 - INDV) * (1 - INDP)) * ART1731BIS * LIG0 * LIG2 ;

LIG40YT = (INDP * (1 - INDV) * (1 - INDC)) * ART1731BIS * LIG0 * LIG2 ;

LIG50YT = (INDV * INDC * (1 - INDP)) * ART1731BIS * LIG0 * LIG2 ;

LIG60YT = (INDV * INDP * (1 - INDC)) * ART1731BIS * LIG0 * LIG2 ;

LIG70YT = (INDC * INDP * (1 - INDV)) * ART1731BIS * LIG0 * LIG2 ;

regle 11110:
application : batch , iliad ;
LIG10V = positif_ou_nul(TSBNV + PRBV + BPCOSAV + GLDGRATV + positif(F10AV * null(TSBNV + PRBV + BPCOSAV + GLDGRATV))) ;
LIG10C = positif_ou_nul(TSBNC + PRBC + BPCOSAC + GLDGRATC + positif(F10AC * null(TSBNC + PRBC + BPCOSAC + GLDGRATC))) ;
LIG10P = positif_ou_nul(somme(i=1..4:TSBNi + PRBi) + positif(F10AP * null(somme(i=1..4:TSBNi + PRBi)))) ;
LIG10 = positif(LIG10V + LIG10C + LIG10P) ;
regle 11000:
application : batch , iliad ;

LIG1100 = positif(T2RV) * (1 - positif(IPVLOC)) ;

LIG899 = positif(RVTOT + LIG1100 + LIG910 + BRCMQ + RCMFR + REPRCM + LIGRCMABT + LIG2RCMABT + LIGPV3VG + LIGPV3WB + LIGPV3VE 
		  + RCMLIB + LIG29 + LIG30 + RFQ + 2REVF + 3REVF + LIG1130 + VLHAB + DFANT + ESFP + RE168 + TAX1649 + R1649 + PREREV)
		 * (1 - positif(LIG0010 + LIG0020 + LIG0030 + LIG0040 + LIG0050 + LIG0060 + LIG0070)) 
		 * (1 - ART1731BIS) ; 

LIG900 = positif(RVTOT + LIG1100 + LIG910 + BRCMQ + RCMFR + REPRCM + LIGRCMABT + LIG2RCMABT + LIGPV3VG + LIGPV3WB + LIGPV3VE 
		  + RCMLIB + LIG29 + LIG30 + RFQ + 2REVF + 3REVF + LIG1130 + VLHAB + DFANT + ESFP + RE168 + TAX1649 + R1649 + PREREV)
		 * positif(LIG0010 + LIG0020 + LIG0030 + LIG0040 + LIG0050 + LIG0060 + LIG0070) 
		 * (1 - ART1731BIS) ; 

LIG899YT = positif(RVTOT + LIG1100 + LIG910 + BRCMQ + RCMFR + REPRCM + LIGRCMABT + LIG2RCMABT + LIGPV3VG + LIGPV3WB + LIGPV3VE 
		   + RCMLIB + LIG29 + LIG30 + RFQ + 2REVF + 3REVF + LIG1130 + VLHAB + DFANT + ESFP + RE168 + TAX1649 + R1649 + PREREV)
		 * (1 - positif(LIG10YT + LIG20YT + LIG30YT + LIG40YT + LIG50YT + LIG60YT + LIG70YT)) 
		 * ART1731BIS ; 

LIG900YT = positif(RVTOT + LIG1100 + LIG910 + BRCMQ + RCMFR + REPRCM + LIGRCMABT + LIG2RCMABT + LIGPV3VG + LIGPV3WB + LIGPV3VE 
		   + RCMLIB + LIG29 + LIG30 + RFQ + 2REVF + 3REVF + LIG1130 + VLHAB + DFANT + ESFP + RE168 + TAX1649 + R1649 + PREREV)
		 * positif(LIG10YT + LIG20YT + LIG30YT + LIG40YT + LIG50YT + LIG60YT + LIG70YT) 
		 * ART1731BIS ; 

regle 111440:
application : batch , iliad ;

LIG4401 =  positif(V_FORVA) * (1 - positif_ou_nul(BAFV)) * LIG0 ;

LIG4402 =  positif(V_FORCA) * (1 - positif_ou_nul(BAFC)) * LIG0 ;

LIG4403 =  positif(V_FORPA) * (1 - positif_ou_nul(BAFP)) * LIG0 ;

regle 11113:
application : iliad , batch ;

LIG13 =  positif(present(BACDEV)+ present(BACREV)
               + present(BAHDEV) +present(BAHREV)
               + present(BACDEC) +present(BACREC)
               + present(BAHDEC)+ present(BAHREC)
               + present(BACDEP)+ present(BACREP)
               + present(BAHDEP)+ present(BAHREP)
               + present(4BAHREV) + present(4BAHREC) + present(4BAHREP)
               + present(4BACREV) + present(4BACREC) + present(4BACREP)
               + present(BAFV) + present(BAFC) + present(BAFP)
	       + present(BAFORESTV) + present(BAFORESTC) 
	       + present(BAFORESTP)
               + present(BAFPVV) + present(BAFPVC) + present(BAFPVP))
	* (1 - positif(IPVLOC)) * (1 - positif(ANNUL2042)) * LIG1 ;

regle 111135:
application : batch , iliad ;

4BAQLV = positif(4BACREV + 4BAHREV) ;
4BAQLC = positif(4BACREC + 4BAHREC) ;
4BAQLP = positif(4BACREP + 4BAHREP) ;

regle 111134:
application : iliad , batch ;

LIG134V = positif(present(BAFV) + present(BAHREV) + present(BAHDEV) + present(BACREV) + present(BACDEV)+ present(BAFPVV)+present(BAFORESTV)) ;
LIG134C = positif(present(BAFC) + present(BAHREC) + present(BAHDEC) + present(BACREC) + present(BACDEC)+ present(BAFPVC)+present(BAFORESTC)) ;
LIG134P = positif(present(BAFP) + present(BAHREP) + present(BAHDEP) + present(BACREP) + present(BACDEP)+ present(BAFPVP)+present(BAFORESTP)) ;
LIG134 = positif(LIG134V + LIG134C + LIG134P+present(DAGRI6)+present(DAGRI5)+present(DAGRI4)+present(DAGRI3)+present(DAGRI2)+present(DAGRI1)) 
		* (1 - positif(IPVLOC)) * (1 - positif(abs(DEFIBA))) * (1 - positif(ANNUL2042)) * LIG1 ;

LIGDBAIP = positif_ou_nul(DBAIP) * positif(DAGRI1 + DAGRI2 + DAGRI3 + DAGRI4 + DAGRI5 + DAGRI6) * (1 - positif(IPVLOC))
			  * positif(abs(abs(BAHQTOT)+abs(BAQTOT)-(DAGRI6+DAGRI5+DAGRI4+DAGRI3+DAGRI2+DAGRI1))) * LIG1 ;
regle 111136:
application : iliad ,batch;
LIG136 = positif(4BAQV + 4BAQC + 4BAQP) * (1 - positif(IPVLOC)) * (1 - positif(ANNUL2042)) * LIG1 ;

regle 111590:
application : iliad, batch ;
pour i = V,C,P:
LIG_BICPi =        (
  present ( BICNOi )                          
 + present (BICDNi )                          
 + present (BIHNOi )                          
 + present (BIHDNi )                          
                  ) * (1 - positif(ANNUL2042)) * LIG0 ;

LIG_BICP = LIG_BICPV + LIG_BICPC + LIG_BICPP ;

LIG_DEFNPI = positif(
   present ( DEFBIC6 ) 
 + present ( DEFBIC5 ) 
 + present ( DEFBIC4 ) 
 + present ( DEFBIC3 ) 
 + present ( DEFBIC2 )
 + present ( DEFBIC1 )
            )
  * LIG0 * LIG2 ;

LIGMLOC = positif(present(MIBMEUV) + present(MIBMEUC) + present(MIBMEUP)
		+ present(MIBGITEV) + present(MIBGITEC) + present(MIBGITEP)
		+ present(LOCGITV) + present(LOCGITC) + present(LOCGITP))
	  * LIG0 * LIG2 ;
 
LIGMLOCAB = positif(MLOCABV + MLOCABC + MLOCABP) * LIG0  * LIG2 ; 

LIGMIBMV = positif(BICPMVCTV + BICPMVCTC + BICPMVCTP) * (1 - null(4 - V_REGCO)) * LIG0 ;

LIGBNCMV = positif(BNCPMVCTV + BNCPMVCTC + BNCPMVCTP) * (1 - null(4 - V_REGCO)) * LIG0 ;

LIGPLOC = positif(LOCPROCGAV + LOCPROCGAC + LOCPROCGAP + LOCDEFPROCGAV + LOCDEFPROCGAC + LOCDEFPROCGAP 
		+ LOCPROV + LOCPROC + LOCPROP + LOCDEFPROV +LOCDEFPROC + LOCDEFPROP)
		   * (1 - null(4 - V_REGCO)) * LIG0 ;

LIGNPLOC = positif(LOCNPCGAV + LOCNPCGAC + LOCNPCGAPAC + LOCDEFNPCGAV + LOCDEFNPCGAC + LOCDEFNPCGAPAC
		   + LOCNPV + LOCNPC + LOCNPPAC + LOCDEFNPV + LOCDEFNPC + LOCDEFNPPAC
		   + LOCGITCV + LOCGITCC + LOCGITCP + LOCGITHCV + LOCGITHCC + LOCGITHCP)
		   *  (1-null(4 - V_REGCO)) * LIG0 ;

LIGNPLOCF = positif(LOCNPCGAV + LOCNPCGAC + LOCNPCGAPAC + LOCDEFNPCGAV + LOCDEFNPCGAC + LOCDEFNPCGAPAC
		   + LOCNPV + LOCNPC + LOCNPPAC + LOCDEFNPV + LOCDEFNPC + LOCDEFNPPAC
                   + LNPRODEF10 + LNPRODEF9 + LNPRODEF8 + LNPRODEF7 + LNPRODEF6 + LNPRODEF5
                   + LNPRODEF4 + LNPRODEF3 + LNPRODEF2 + LNPRODEF1
		   + LOCGITCV + LOCGITCC + LOCGITCP + LOCGITHCV + LOCGITHCC + LOCGITHCP)
		   *  (1-null(4 - V_REGCO)) * LIG0 ;

LIGDEFNPLOC = positif(TOTDEFLOCNP) *  (1-null(4 - V_REGCO)) ;

LIGDFLOCNPF = positif(DEFLOCNPF) * positif(DEFRILOC) * (1 - PREM8_11) ;

LIGLOCNSEUL = positif(LIGNPLOC + LIGDEFNPLOC + LIGNPLOCF) ;

LIGLOCSEUL = 1 - positif(LIGNPLOC + LIGDEFNPLOC + LIGNPLOCF) ;

regle 1115901:
application : iliad,batch;

LIG_BICNPF = 
       positif(
   present (BICDEC)
 + present (BICDEP)
 + present (BICDEV)
 + present (BICHDEC)
 + present (BICHDEP)
 + present (BICHDEV)
 + present (BICHREC)
 + present (BICHREP)
 + present (BICHREV)
 + present (BICREC)
 + present (BICREP)
 + present (BICREV)
 + present ( DEFBIC6 ) 
 + present ( DEFBIC5 ) 
 + present ( DEFBIC4 ) 
 + present ( DEFBIC3 ) 
 + present ( DEFBIC2 )
 + present ( DEFBIC1 )
)
                   * LIG0 * LIG2 ;
regle 11117:
application : iliad,batch;
LIG_BNCNF = positif (present(BNCV) + present(BNCC) + present(BNCP)) ;

LIGNOCEP = (present(NOCEPV) + present(NOCEPC) + present(NOCEPP)) * LIG0 * LIG2 ;

LIGNOCEPIMP = (present(NOCEPIMPV) + present(NOCEPIMPC) + present(NOCEPIMPP)) * LIG0 * LIG2 ;

LIGDAB = positif(present(DABNCNP6) + present(DABNCNP5) + present(DABNCNP4)
		 + present(DABNCNP3) + present(DABNCNP2) + present(DABNCNP1)) 
		* LIG0 * LIG2 ;

LIGDIDAB = positif_ou_nul(DIDABNCNP) * positif(LIGDAB) * LIG0 * LIG2 ;


LIGDEFBNCNPF = positif(DEFBNCNPF) * positif(DEFRIBNC) * null(PREM8_11) ;
LIGDEFBANIF  = positif (DEFBANIF) * positif(DEFRIBASUP + DEFRIGLOBSUP) * (1-PREM8_11);
LIGDEFBICNPF = positif (DEFBICNPF) * DEFRIBIC * (1-PREM8_11);
LIGDEFRFNONI = positif (DEFRFNONI) * DEFRIRF * (1-PREM8_11);

LIGBNCIF = ( positif (LIGNOCEP) * (1 - positif(LIG3250) + null(BNCIF)) 
             + (null(BNCIF) * positif(LIGBNCDF)) 
	     + null(BNCIF) * (1 - positif_ou_nul(NOCEPIMP+SPENETNPF-DABNCNP6 -DABNCNP5 -DABNCNP4 -DABNCNP3 -DABNCNP2 -DABNCNP1))
             + positif (LIGDEFBNCNPF)
             + positif(
   present (DABNCNP6)
 + present (DABNCNP5)
 + present (DABNCNP4)
 + present (DABNCNP3)
 + present (DABNCNP2)
 + present (DABNCNP1)
 + present (BNCAADV)
 + present (DNOCEPC)
 + present (DNOCEPP)
 + present (BNCAADC)
 + present (BNCAADP)
 + present (DNOCEP)
 + present (BNCNPV)
 + present (BNCNPC)
 + present (BNCNPP)
 + present (BNCNPPVV)
 + present (BNCNPPVC)
 + present (BNCNPPVP)
 + present (BNCAABV)
 + present (ANOCEP)
 + present (BNCAABC)
 + present (ANOVEP)
 + present (BNCAABP)
 + present (ANOPEP)
                        )
           )
	     * (1 - positif(LIGSPENPNEG + LIGSPENPPOS)) * LIG0 * LIG2 ;
regle 125:
application : batch, iliad;
LIG910 = positif(present(RCMABD) + present(RCMTNC) + present(RCMAV) + present(RCMHAD) 
	         + present(RCMHAB) + present(REGPRIV) + (1-present(BRCMQ)) *(present(RCMFR))
                ) * LIG0 * LIG2 ;
regle 1111130: 
application : iliad , batch ;
LIG1130 = positif(present(REPSOF)) * LIG0 * LIG2 ;
regle 1111950:
application : iliad, batch;
LIG1950 = INDREV1A8 *  positif_ou_nul(REVKIRE) 
                    * (1 - positif_ou_nul(IND_TDR)) 
                    * (1 - positif(ANNUL2042 + 0)) ;

regle 11129:
application : batch, iliad;
LIG29 = positif(present(RFORDI) + present(RFDHIS) + present(RFDANT) +
                present(RFDORD)) * (1 - positif(IPVLOC))
                * (1 - positif(LIG30)) * LIG1 * LIG2 * IND_REV ;
regle 11130:
application : iliad, batch ;
LIG30 = positif(RFMIC) * (1 - positif(IPVLOC)) * LIG1 * LIG2 ;
LIGREVRF = positif(present(FONCI) + present(REAMOR)) * (1 - positif(IPVLOC)) * LIG1 * LIG2 ;
regle 11149:
application : batch, iliad;
LIG49 =  INDREV1A8 * positif_ou_nul(DRBG) * LIG2 ;
regle 11152:
application :  iliad, batch;
LIG52 = positif(present(CHENF1) + present(CHENF2) + present(CHENF3) + present(CHENF4) 
                 + present(NCHENF1) + present(NCHENF2) + present(NCHENF3) + present(NCHENF4)) 
	     * LIG1 * LIG2 ;
regle 11158:
application : iliad, batch;
LIG58 = (present(PAAV) + present(PAAP)) * positif(LIG52) * LIG1 * LIG2 ;
regle 111585:
application : iliad, batch;
LIG585 = (present(PAAP) + present(PAAV)) * (1 - positif(LIG58)) * LIG1 * LIG2 ;
LIG65 = positif(LIG52 + LIG58 + LIG585 
                + present(CHRFAC) + present(CHNFAC) + present(CHRDED)
		+ present(DPERPV) + present(DPERPC) + present(DPERPP)
                + LIGREPAR)  
       * LIG1 * LIG2 ;
regle 111555:
application : iliad, batch;
LIGDPREC = present(CHRFAC) * (1 - positif(ANNUL2042)) * LIG1;

LIGDFACC = (positif(20-V_NOTRAIT+0) * positif(DFACC)
           + (1 - positif(20-V_NOTRAIT+0)) * present(DFACC)) * (1 - positif(ANNUL2042)) * LIG1 ;
regle 1111390:
application : batch, iliad;
LIG1390 = positif(positif(ABMAR) + (1 - positif(RI1)) * positif(V_0DN)) * LIG1 * LIG2 ;
regle 11168:
application : batch, iliad;
LIG68 = INDREV1A8 * (1 - positif(abs(RNIDF))) * LIG2 ;
regle 1111420:
application : iliad,batch;
LIGTTPVQ = positif(
                   positif(CARTSV) + positif(CARTSC) + positif(CARTSP1) + positif(CARTSP2)+ positif(CARTSP3)+ positif(CARTSP4)
                   + positif(REMPLAV) + positif(REMPLAC) + positif(REMPLAP1) + positif(REMPLAP2)+ positif(REMPLAP3)+ positif(REMPLAP4)
                   + positif(PEBFV) + positif(PEBFC) + positif(PEBF1) + positif(PEBF2)+ positif(PEBF3)+ positif(PEBF4)
                   + positif(CARPEV) + positif(CARPEC) + positif(CARPEP1) + positif(CARPEP2)+ positif(CARPEP3)+ positif(CARPEP4)
                   + positif(CODRAZ) + positif(CODRBZ) + positif(CODRCZ) + positif(CODRDZ) + positif(CODREZ) + positif(CODRFZ) 
                   + positif(PENSALV) + positif(PENSALC) + positif(PENSALP1) + positif(PENSALP2)+ positif(PENSALP3)+ positif(PENSALP4)
                   + positif(RENTAX) + positif(RENTAX5) + positif(RENTAX6) + positif(RENTAX7)
                   + positif(REVACT) + positif(REVPEA) + positif(PROVIE) + positif(DISQUO) + positif(RESTUC) + positif(INTERE)
                   + positif(FONCI) + positif(REAMOR)
                   + positif(4BACREV) + positif(4BACREC)+positif(4BACREP)+positif(4BAHREV)+positif(4BAHREC)+positif(4BAHREP)
                   + positif(GLD1V) + positif(GLD1C) + positif(GLD2V) + positif(GLD2C) + positif(GLD3V) + positif(GLD3C)
                   + positif(CODDAJ) + positif(CODEAJ) + positif(CODDBJ)+ positif(CODEBJ)   
                   + positif(CODRVG)
                  ) * LIG1 * LIG2 * (1 - null(4-V_REGCO)) ;

regle 111721:
application : batch, iliad;

LIG1430 = positif(BPTP3) * LIG0 * LIG2 ;

LIG1431 = positif(BPTP18) * LIG0 * LIG2 ;

LIG1432 = positif(BPTP19) * LIG0 * LIG2 ;
regle 111722:
application : batch, iliad;
LIG815 = V_EAD * positif(BPTPD) * LIG0 * LIG2 ;
LIG816 = V_EAG * positif(BPTPG) * LIG0 * LIG2 ;
LIGTXF225 = positif(PEA+0) * LIG0 * LIG2 ;
LIGTXF24 = positif(BPTP24) * LIG0 * LIG2 ;
LIGTXF30 = positif_ou_nul(BPCOPTV + BPCOPTC + BPVSK) * LIG0  * LIG2 ;
LIGTXF40 = positif(BPV40V + BPV40C + 0) * LIG0 * LIG2 ;

regle 111723:
application : batch, iliad ;

LIGCESDOM = positif(BPTPDIV) * positif(PVTAXSB) * positif(V_EAD + 0) * LIG0 * LIG2 ;

LIGCESDOMG = positif(BPTPDIV) * positif(PVTAXSB) * positif(V_EAG + 0) * LIG0 * LIG2 ;

regle 11181:
application : batch , iliad ;
 
LIG81 = positif(present(RDDOUP) + present(DONAUTRE) + present(REPDON03) + present(REPDON04) 
                + present(REPDON05) + present(REPDON06) + present(REPDON07) + present(COD7UH)
                + positif(EXCEDANTA))
        * LIG1 * LIG2 ;

regle 1111500:
application : iliad, batch ;

LIG1500 = positif((positif(IPMOND) * positif(present(IPTEFP)+positif(VARIPTEFP)*present(DEFZU))) + positif(INDTEFF) * positif(TEFFREVTOT)) 
	      * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * (1 - positif(DEFRIMOND)) * LIG1 * LIG2 ;

LIG1510 = positif((positif(IPMOND) * present(IPTEFN)) + positif(INDTEFF) * (1 - positif(TEFFREVTOT))) 
	      * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * (1 - positif(DEFRIMOND)) * LIG1 * LIG2 ;

LIG1500YT = positif((positif(IPMOND) * positif(present(IPTEFP)+positif(VARIPTEFP)*present(DEFZU))) + positif(INDTEFF) * positif(TEFFREVTOT)) 
	     * positif(positif(max(0,IPTEFP+DEFZU-IPTEFN))+positif(max(0,RMOND+DEFZU-DMOND)))* (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * positif(DEFRIMOND) * LIG1 * LIG2;

LIG1510YT =  positif(null(max(0,RMOND+DEFZU-DMOND))+null(max(0,IPTEFP+DEFZU-IPTEFN))) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * positif(DEFRIMOND) * LIG1 * LIG2 ;

regle 1111522:
application : iliad, batch ;
LIG1522 = (1 - present(IND_TDR)) * (1 - INDTXMIN) * (1 - INDTXMOY) * V_CR2 * LIG2 ;
regle 1111523:
application : batch, iliad;
LIG1523 = (1 - present(IND_TDR)) * null(V_REGCO - 4) * LIG2 ;
regle 11175:
application : iliad, batch ;
LIG75 = (1 - INDTXMIN) * (1 - INDTXMOY) * (1 - (LIG1500+ LIG1500YT)) * (1 - (LIG1510+ LIG1510YT)) * INDREV1A8 * LIG2 ;

LIG1545 = (1 - present(IND_TDR)) * INDTXMIN * positif(IND_REV) * LIG2 ;

LIG1760 = (1 - present(IND_TDR)) * INDTXMOY * LIG2 ;

LIG1546 = positif(PRODOM + PROGUY) * (1 - positif(V_EAD + V_EAG)) * LIG2 ;

LIG1550 = (1 - present(IND_TDR)) * INDTXMOY * LIG2 ;

LIG74 = (1 - present(IND_TDR)) * (1 - INDTXMIN) * positif(LIG1500 + LIG1510 + LIG1500YT + LIG1510YT) * LIG2 ;

regle 11180:
application : batch, iliad ;
LIG80 = positif(present(RDREP) + present(DONETRAN)) * LIG1 * LIG2 ;
regle 11188:
application : iliad , batch ;
LIGRSOCREPR = positif(present(RSOCREPRISE)) * LIG1 * LIG2 ;
regle 1111740:
application : batch , iliad ;
LIG1740 = positif(RECOMP) * LIG2 ;
regle 1111780:
application : batch , iliad ;
LIG1780 = positif(RDCOM + NBACT) * LIG1 * LIG2 ;
regle 111981:
application : batch, iliad;
LIG98B = positif(LIG80 + LIGFIPC + LIGFIPDOM + present(DAIDE)
                 + LIGDUFLOT + LIGPINEL + LIG7CY
                 + LIGREDAGRI + LIGFORET + LIGRESTIMO  
	         + LIGCINE + LIGRSOCREPR + LIGCOTFOR 
	         + present(PRESCOMP2000) + present(RDPRESREPORT) + present(FCPI) 
		 + present(DSOUFIP) + LIGRIRENOV + present(DFOREST) 
		 + present(DHEBE) + present(DSURV)
	         + LIGLOGDOM + LIGREPTOUR + LIGLOCHOTR
	         + LIGREPHA + LIGCREAT + LIG1780 + LIG2040 + LIG81 + LIGLOGSOC
	         + LIGDOMSOC1 
		 + somme (i=A,B,E,M,C,D,S,F,Z,N,T,X : LIGCELLi) + LIGCELMG + LIGCELMH
		 + somme (i=A,B,D,E,F,H,G,L,M,S,R,U,T,Z,X,W,V : LIGCELHi) 
                 + somme (i=U,X,T,S,W,P,L,V,K,J : LIGCELGi)
                 + somme (i=A,B,C,D,E,F,G,H,I,J,K,L : LIGCELYi)
		 + LIGCELHNO + LIGCELHJK + LIGCELNQ + LIGCELCOM + LIGCELNBGL
		 + LIGCEL + LIGCELJP + LIGCELJBGL + LIGCELJOQR + LIGCEL2012
                 + LIGCELFD + LIGCELFABC
                 + LIGILMPA + LIGILMPB + LIGILMPC + LIGILMPD + LIGILMPE
                 + LIGILMOA + LIGILMOB + LIGILMOC + LIGILMOD + LIGILMOE
		 + LIGREDMEUB + LIGREDREP + LIGILMIX + LIGILMIY + LIGINVRED + LIGILMIH  + LIGILMJC + LIGILMIZ 
                 + LIGILMJI + LIGILMJS + LIGMEUBLE + LIGPROREP + LIGREPNPRO + LIGMEUREP + LIGILMIC + LIGILMIB 
                 + LIGILMIA + LIGILMJY + LIGILMJX + LIGILMJW + LIGILMJV 
		 + LIGRESIMEUB + LIGRESINEUV + LIGRESIVIEU + LIGLOCIDEFG + LIGCODJTJU
                 + LIGCODOU
		 + present(DNOUV) + LIGLOCENT + LIGCOLENT + LIGRIDOMPRO
		 + LIGPATNAT1 + LIGPATNAT2 + LIGPATNAT3+LIGPATNAT4) 
           * LIG1 * LIG2 ;

LIGRED = LIG98B * (1 - positif(RIDEFRI)) * LIG1 * LIG2 ;

LIGREDYT = LIG98B * positif(RIDEFRI) * LIG1 * LIG2 ;

regle 1111820:
application : batch , iliad ;

LIG1820 = positif(ABADO + ABAGU + RECOMP) * LIG2 ;

regle 111106:
application : iliad , batch ;

LIG106 = positif(RETIR) ;
LIGINRTAX = positif(RETTAXA) ;
LIG10622 = positif(RETIR22) ;
LIGINRTAX22 = positif(RETTAXA22) ;
ZIG_INT22 = positif(RETCS22 + RETPS22 + RETRD22 + RETCVN22) ;

LIGINRPCAP = positif(RETPCAP) ;
LIGINRPCAP2 = positif(RETPCAP22) ;
LIGINRLOY = positif(RETLOY) ;
LIGINRLOY2 = positif(RETLOY22) ;

LIGINRHAUT = positif(RETHAUTREV) ;
LIGINRHAUT2 = positif(RETCHR22) ;
regle 111107:
application : iliad, batch;

LIG_172810 = TYPE2 * positif(NMAJ1) ;

LIGTAXA17281 = TYPE2 * positif(NMAJTAXA1) ;

LIGPCAP17281 = TYPE2 * positif(NMAJPCAP1) ;

LIGCHR17281 = TYPE2 * positif(NMAJCHR1) ;

LIG_NMAJ1 = TYPE2 * positif(NMAJ1) ;
LIG_NMAJ3 = TYPE2 * positif(NMAJ3) ;
LIG_NMAJ4 = TYPE2 * positif(NMAJ4) ;

LIGNMAJTAXA1 = TYPE2 * positif(NMAJTAXA1) ;
LIGNMAJTAXA3 = TYPE2 * positif(NMAJTAXA3) ;
LIGNMAJTAXA4 = TYPE2 * positif(NMAJTAXA4) ;

LIGNMAJPCAP1 = TYPE2 * positif(NMAJPCAP1) ;
LIGNMAJPCAP3 = TYPE2 * positif(NMAJPCAP3) ;
LIGNMAJPCAP4 = TYPE2 * positif(NMAJPCAP4) ;
LIGNMAJLOY1 = TYPE2 * positif(NMAJLOY1) ;
LIGNMAJLOY3 = TYPE2 * positif(NMAJLOY3) ;
LIGNMAJLOY4 = TYPE2 * positif(NMAJLOY4) ;

LIGNMAJCHR1 = TYPE2 * positif(NMAJCHR1) ;
LIGNMAJCHR3 = TYPE2 * positif(NMAJCHR3) ;
LIGNMAJCHR4 = TYPE2 * positif(NMAJCHR4) ;

regle 11119:
application : batch, iliad;
LIG109 = positif(IPSOUR + REGCI + LIGPVETR + LIGCULTURE + LIGMECENAT 
		  + LIGCORSE + LIG2305 + LIGEMPLOI + LIGCI2CK + LIGCICAP + LIGCI8XV + LIGCIGLO + LIGREGCI
		  + LIGBPLIB + LIGCIGE + LIGDEVDUR 
                  + LIGCICA + LIGCIGARD + LIG82
		  + LIGPRETUD + LIGSALDOM + LIGCIFORET + LIGHABPRIN
		  + LIGCREFAM + LIGCREAPP + LIGCREBIO  + LIGPRESINT + LIGCREPROSP + LIGINTER
		  + LIGRESTAU + LIGCONGA + LIGMETART 
		  + LIGCREFORM + LIGLOYIMP 
		  + LIGVERSLIB + LIGCITEC + INDLIGPPE
		   ) 
               * LIG1 * LIG2 ;

LIGCRED1 = positif(REGCI + LIGPVETR + LIGCICAP + LIGREGCI + LIGCI8XV + LIGCIGLO + 0) 
	    * (1 - positif(IPSOUR + LIGCULTURE + LIGMECENAT + LIGCORSE + LIG2305 + LIGEMPLOI + LIGCI2CK + LIGBPLIB + LIGCIGE + LIGDEVDUR 
		           + LIGCICA + LIGCIGARD + LIG82 + LIGPRETUD + LIGSALDOM + LIGCIFORET + LIGHABPRIN + LIGCREFAM + LIGCREAPP 
		           + LIGCREBIO + LIGPRESINT + LIGCREPROSP + LIGINTER + LIGRESTAU + LIGCONGA + LIGMETART
		           + LIGCREFORM + LIGLOYIMP + LIGVERSLIB + LIGCITEC + 0))
	    ;

LIGCRED2 = (1 - positif(REGCI + LIGPVETR + LIGCICAP + LIGREGCI + LIGCI8XV + LIGCIGLO + 0)) 
	    * positif(IPSOUR + LIGCULTURE + LIGMECENAT + LIGCORSE + LIG2305 + LIGEMPLOI + LIGCI2CK + LIGBPLIB + LIGCIGE + LIGDEVDUR 
		      + LIGCICA + LIGCIGARD + LIG82 + LIGPRETUD + LIGSALDOM + LIGCIFORET + LIGHABPRIN + LIGCREFAM + LIGCREAPP 
		      + LIGCREBIO + LIGPRESINT + LIGCREPROSP + LIGINTER + LIGRESTAU + LIGCONGA + LIGMETART
		      + LIGCREFORM + LIGLOYIMP + LIGVERSLIB + LIGCITEC + 0)
	    ;

LIGCRED3 = positif(REGCI + LIGPVETR + LIGCICAP + LIGREGCI + LIGCI8XV + LIGCIGLO + 0) 
	    * positif(IPSOUR + LIGCULTURE + LIGMECENAT + LIGCORSE + LIG2305 + LIGEMPLOI + LIGCI2CK + LIGBPLIB + LIGCIGE + LIGDEVDUR
		      + LIGCICA + LIGCIGARD + LIG82 + LIGPRETUD + LIGSALDOM + LIGCIFORET + LIGHABPRIN + LIGCREFAM + LIGCREAPP 
		      + LIGCREBIO + LIGPRESINT + LIGCREPROSP + LIGINTER + LIGRESTAU + LIGCONGA + LIGMETART
		      + LIGCREFORM + LIGLOYIMP + LIGVERSLIB + LIGCITEC + 0)
           ;
regle 11120:
application : batch, iliad ;

LIGPVETR = positif(present(CIIMPPRO) + present(CIIMPPRO2)) * LIG1 * LIG2 ;
LIGCICAP = present(PRELIBXT) * LIG1 * LIG2 ;
LIGREGCI = positif(present(REGCI) + present(COD8XY)) * positif(CICHR) * LIG1 * LIG2 ;
LIGCI8XV = present(COD8XV) * LIG1 * LIG2 ;
LIGCIGLO = positif(present(COD8XF) + present(COD8XG) + present(COD8XH)) * LIG1 * LIG2 ;

LIGCULTURE = present(CIAQCUL) * LIG1 * LIG2 ;
LIGMECENAT = present(RDMECENAT) * LIG1 * LIG2 ;
LIGCORSE = positif(present(CIINVCORSE) + present(IPREPCORSE) + present(CICORSENOW)) * LIG1 * LIG2 ;
LIG2305 = positif(DIAVF2) * LIG1 * LIG2 ;
LIGEMPLOI = positif(COD8UW + COD8TL) * LIG1 * LIG2 ;
LIGCI2CK = positif(COD2CK) * LIG1 * LIG2 ;
LIGBPLIB = present(RCMLIB) * LIG0 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGCIGE = positif(RDTECH + RDEQPAHA) * LIG1 * LIG2 ;
LIGDEVDUR = positif(DDEVDUR) * LIG1 * LIG2 ;
LIGCICA = positif(BAILOC98) * LIG1 * LIG2 ;
LIGCIGARD = positif(DGARD) * LIG1 * LIG2 ;
LIG82 = positif(present(RDSYVO) + present(RDSYCJ) + present(RDSYPP) ) * LIG1 * LIG2 ;
LIGPRETUD = positif(PRETUD+PRETUDANT) * LIG1 * LIG2 ;
LIGSALDOM = present(CREAIDE) * LIG1 * LIG2 ;
LIGCIFORET = positif(BDCIFORET) * LIG1 * LIG2 ;
LIGHABPRIN = positif(present(PREHABT) + present(PREHABT1) + present(PREHABT2) + present(PREHABTN) 
                     + present(PREHABTN1) + present(PREHABTN2) + present(PREHABTVT)
                    ) * LIG1 * LIG2 ;
LIGCREFAM = positif(CREFAM) * LIG1 * LIG2 ;
LIGCREAPP = positif(CREAPP) * LIG1 * LIG2 ;
LIGCREBIO = positif(CREAGRIBIO) * LIG1 * LIG2 ;
LIGPRESINT = positif(PRESINTER) * LIG1 * LIG2 ;
LIGCREPROSP = positif(CREPROSP) * LIG1 * LIG2 ;
LIGINTER = positif(CREINTERESSE) * LIG1 * LIG2 ;
LIGRESTAU = positif(CRERESTAU) * LIG1 * LIG2 ;
LIGCONGA = positif(CRECONGAGRI) * LIG1 * LIG2 ;
LIGMETART = positif(CREARTS) * LIG1 * LIG2 ;
LIGCREFORM = positif(CREFORMCHENT) * LIG1 * LIG2 ;
LIGLOYIMP = positif(LOYIMP) * LIG1 * LIG2 ;
LIGVERSLIB = positif(AUTOVERSLIB) * LIG1 * LIG2 ;
LIGCITEC = positif(DTEC) * LIG1 * LIG2 ;

LIGCREAT = positif(DCREAT + DCREATHANDI) * LIG1 * LIG2 ;
regle 1112030:
application : batch, iliad ;

LIGNRBASE = positif(present(NRINET) + present(NRBASE)) * LIG1 * LIG2 ;
LIGBASRET = positif(present(IMPRET) + present(BASRET)) * LIG1 * LIG2 ;
regle 1112332:
application :  iliad, batch ;
LIGAVFISC = positif(AVFISCOPTER) * LIG1 * LIG2 ; 
regle 1112040:
application : batch, iliad;
LIG2040 = positif(DNBE + RNBE + RRETU) * LIG1 * LIG2 ;
regle 1112041:
application : iliad, batch ;
LIGRDCSG = positif(positif(V_BTCSGDED) + present(DCSG) + present(RCMSOC)) * LIG1 * LIG2 ;
regle 111117:
application : batch, iliad;

LIGTAXANET = positif((present(CESSASSV) + present(CESSASSC)) * INDREV1A8IR + TAXANTAFF) * (1 - positif(ANNUL2042 + 0)) * LIG1 ;

LIGPCAPNET = positif((present(PCAPTAXV) + present(PCAPTAXC)) * INDREV1A8IR + PCAPANTAFF) * (1 - positif(ANNUL2042 + 0)) * LIG1 ;

LIGLOYNET = (present(LOYELEV) * INDREV1A8IR + TAXLOYANTAFF) * (1 - positif(ANNUL2042 + 0)) * LIG1 ;

LIGHAUTNET = positif(BHAUTREV * INDREV1A8IR + HAUTREVANTAF) * (1 - positif(ANNUL2042 + 0)) * LIG1 ;

LIG_IRNET = positif(LIGTAXANET + LIGPCAPNET + LIGLOYNET + LIGHAUTNET) * (1 - positif(ANNUL2042 + 0)) ;

LIGIRNET = positif(IRNET * LIG_IRNET + LIGTAXANET + LIGPCAPNET + LIGLOYNET + LIGHAUTNET) * (1 - positif(ANNUL2042 + 0)) ;

regle 1112135:
application : batch, iliad;
LIGANNUL = positif(ANNUL2042) ;

regle 1112050:
application : batch, iliad;
LIG2053 = positif(V_NOTRAIT - 20) * positif(IDEGR) * positif(IREST - SEUIL_8) * TYPE2 ;

regle 1112051:
application : batch,iliad ;
LIG2051 = (1 - positif(20 - V_NOTRAIT)) 
          * positif (RECUMBIS) ;

LIGBLOC = positif(V_NOTRAIT - 20) ;

LIGSUP = positif(null(V_NOTRAIT - 26) + null(V_NOTRAIT - 36) + null(V_NOTRAIT - 46) + null(V_NOTRAIT - 56) + null(V_NOTRAIT - 66)) ;

LIGDEG = positif_ou_nul(TOTIRPSANT) * positif(SEUIL_8 - RECUM) 
         * positif(null(V_NOTRAIT - 23) + null(V_NOTRAIT - 33) + null(V_NOTRAIT - 43) + null(V_NOTRAIT - 53) + null(V_NOTRAIT - 63)) ;

LIGRES = (1 - positif(TOTIRPSANT + 0)) * positif_ou_nul(RECUM - SEUIL_8)
         * positif(null(V_NOTRAIT - 23) + null(V_NOTRAIT - 33) + null(V_NOTRAIT - 43) + null(V_NOTRAIT - 53) + null(V_NOTRAIT - 63)) ;

LIGDEGRES = positif(TOTIRPSANT + 0) * positif_ou_nul(RECUM - SEUIL_8) 
            * positif(null(V_NOTRAIT - 23) + null(V_NOTRAIT - 33) + null(V_NOTRAIT - 43) + null(V_NOTRAIT - 53) + null(V_NOTRAIT - 63)) ;

LIGNEMP = positif((1 - null(NAPTEMP)) + null(NAPTEMP) * null(NAPTIR) * null(NAPCRP)) ;

LIGEMP = 1 - LIGNEMP ;

LIG2052 = (1 - positif(V_ANTREIR + 0)) * (1 - APPLI_OCEANS);

LIGTAXANT = (
	     APPLI_ILIAD * (1 - positif(20 - V_NOTRAIT)) * positif(V_TAXANT + LIGTAXANET * positif(TAXANET))
            ) * (1 - positif(LIG2051)) * TYPE2 * (1 - APPLI_OCEANS);

LIGPCAPANT = (
	      APPLI_ILIAD * (1 - positif(20 - V_NOTRAIT)) * positif(V_PCAPANT + LIGPCAPNET * positif(PCAPNET))
             ) * (1 - positif(LIG2051)) * TYPE2 * (1 - APPLI_OCEANS);
LIGLOYANT = (
	      APPLI_ILIAD * (1 - positif(20 - V_NOTRAIT)) * positif(V_TAXLOYANT + LIGLOYNET * positif(TAXLOYNET))
             ) * (1 - positif(LIG2051)) * TYPE2 * (1 - APPLI_OCEANS);

LIGHAUTANT = (
	      APPLI_ILIAD * (1 - positif(20 - V_NOTRAIT)) * positif(V_CHRANT + LIGHAUTNET * positif(HAUTREVNET))
             ) * (1 - positif(LIG2051)) * TYPE2 * (1 - APPLI_OCEANS);

LIGANTREIR = positif(V_ANTREIR + 0) * (1 - positif(V_ANTCR)) * (1 - APPLI_OCEANS);

LIGNANTREIR = positif(V_ANTREIR + 0) * positif(V_ANTCR + 0) * (1 - APPLI_OCEANS);

LIGNONREC = positif(V_NONMERANT + 0) * (1 - APPLI_OCEANS);

LIGNONREST = positif(V_NONRESTANT + 0) * (1 - APPLI_OCEANS);

LIGIINET = LIGSUP * (positif(NAPT + 0) + null(IINETCALC)) ;

LIGIINETC = LIGSUP * null(NAPT) * positif(IINETCALC + 0) ;

LIGIDEGR = positif(LIGDEG + LIGDEGRES) * (positif_ou_nul(IDEGR - SEUIL_8) + null(IDEGR)) ;

LIGIDEGRC = positif(LIGDEG + LIGDEGRES) * positif(SEUIL_8 - IDEGR) * positif(IDEGR + 0) ;

LIGIREST = positif(LIGRES + LIGDEGRES) * (positif_ou_nul(IREST - SEUIL_8) + null(IREST)) ;

LIGIRESTC = positif(LIGRES + LIGDEGRES) * positif(SEUIL_8 - IREST) * positif(IREST + 0) ;

LIGNMRR = LIGIINETC * positif(V_ANTRE - V_NONRESTANT + 0) ;

LIGNMRS = LIGIINETC * (1 - positif(V_ANTRE - V_NONRESTANT)) ;

LIGRESINF = positif(LIGIDEGRC + LIGIRESTC) ;

regle 1112080:
application : batch, iliad ;

LIG2080 = positif(NATIMP - 71) * LIG2 ;

regle 1112081:
application : batch, iliad ;

LIGTAXADEG = positif(NATIMP - 71) * positif(TAXADEG) * LIG2 ;

LIGPCAPDEG = positif(NATIMP - 71) * positif(PCAPDEG) * LIG2 ;

LIGLOYDEG = positif(NATIMP - 71) * positif(TAXLOYDEG) * LIG2 ;

LIGHAUTDEG = positif(NATIMP - 71) * positif(HAUTREVDEG) * LIG2 ;

regle 1112140:
application : iliad , batch ;

INDCTX = si (  (V_NOTRAIT+0 = 23)  
            ou (V_NOTRAIT+0 = 33)   
            ou (V_NOTRAIT+0 = 43)   
            ou (V_NOTRAIT+0 = 53)   
            ou (V_NOTRAIT+0 = 63)  
            )
         alors (1)
         sinon (0)
         finsi;

INDIS = si (  (V_NOTRAIT+0 = 14)
            ou (V_NOTRAIT+0 = 16)
	    ou (V_NOTRAIT+0 = 26)
	    ou (V_NOTRAIT+0 = 36)
	    ou (V_NOTRAIT+0 = 46)
	    ou (V_NOTRAIT+0 = 56)
	    ou (V_NOTRAIT+0 = 66)
           )
        alors (1)
        sinon (0)
	finsi;


LIG2140 = si (
                ( ( (V_CR2 + 0 = 0) et NATIMP = 1 et (IRNET + TAXANET + PCAPNET + TAXLOYNET + HAUTREVNET + NRINET - NAPTOTA + NAPCR >= SEUIL_12)) 
		    ou ((V_CR2 + 0 = 1) et (NATIMP = 1 ou  NATIMP = 0))
                    ou ((V_REGCO + 0 = 3) et ((NRINET +0 < 12) et (CSTOTSSPENA < 61)))
                ) 
		et LIG2141 + 0 = 0
		)
          alors ((((1 - INDCTX) * INDREV1A8 * (1 - (positif(IRANT)*null(NAPT)) ) * LIG2)
                + null(IINET + NAPTOTA) * null(INDREV1A8)) * positif(IND_REV) * positif(20 - V_NOTRAIT))
          finsi;

LIG21401 = si (( ((V_CR2+0=0) et NATIMP=1 et (IRNET + TAXANET + PCAPNET + TAXLOYNET + HAUTREVNET + NRINET - NAPTOTA + NAPCR >= SEUIL_12)) 
		ou ((V_CR2+0=1) et (NATIMP=1 ou  NATIMP=0)))
		et LIG2141 + 0 = 0
		)
           alors ((((1 - INDCTX) * INDREV1A8 * (1 - (positif(IRANT)*null(NAPT)) ) * LIG2)
                + null(IINET + NAPTOTA) * null(INDREV1A8)) * positif(IND_REV) * positif(20 - V_NOTRAIT))
           finsi ;

LIG21402 = si (( ((V_CR2+0=0) et NATIMP=1 et (IRNET + TAXANET + PCAPNET + TAXLOYNET + HAUTREVNET + NRINET - NAPTOTA + NAPCR >= SEUIL_12)) 
		ou ((V_CR2+0=1) et (NATIMP=1 ou  NATIMP=0)))
		et LIG2141 + 0 = 0
		)
           alors ((((1 - INDCTX) * INDREV1A8 * (1 - (positif(IRANT)*null(NAPT)) ) * LIG2)
                + null(IINET + NAPTOTA) * null(INDREV1A8)) * positif(IND_REV) * positif(V_NOTRAIT - 20))
           finsi ;


regle 112141:
application : batch , iliad ;

LIG2141 = null(IAN + RPEN - IAVT + TAXASSUR + IPCAPTAXT + TAXLOY + CHRAPRES - IRANT) 
                  * positif(IRANT)
                  * (1 - positif(LIG2501))
		  * null(V_IND_TRAIT - 4)
		  * (1 - positif(NRINET + 0)) ;

regle 112145:
application : batch , iliad ;

LIGNETAREC = positif (IINET) * (1 - LIGPS) * positif(ANNUL2042) * TYPE2 ;

LIGNETARECS = positif (IINET) * LIGPS * positif(ANNUL2042) * TYPE2 ;

regle 1112150:
application : iliad , batch ;

LIG2150 = (1 - INDCTX) 
	 * positif(IREST)
         * (1 - positif(LIG2140))
         * (1 - positif(IND_REST50))
	 * positif(20 - V_NOTRAIT)
         * LIG2 ;

regle 1112160:
application : batch , iliad ;

LIG2161 =  INDCTX 
	  * positif(IREST) 
          * positif_ou_nul(IREST - SEUIL_8) 
	  * (1 - positif(IND_REST50)) ;

LIG2368 = INDCTX 
	 * positif(IREST)
         * positif ( positif(IND_REST50)
                     + positif(IDEGR) ) ;

regle 1112171:
application : batch , iliad ;

LIG2171 = (1 - INDCTX) 
	 * positif(IREST)
	 * (1 - positif(LIG2140))
         * positif(IND_REST50)  
	 * positif(20 - V_NOTRAIT)
	 * LIG2 ;

regle 11121710:
application : batch , iliad ;

LIGTROP = positif(V_ANTRE+V_ANTCR) * null(IINET)* positif_ou_nul(abs(NAPTOTA)
             - IRESTIT - IRANT) * (1 - positif_ou_nul(abs(NAPTOTA) - IRESTIT
             - IRANT - SEUIL_12))
               * null(IDRS2 - IDEC + IREP)
	       * (1 - LIGPS)
               * (1 - INDCTX);

LIGTROPS = positif(V_ANTRE+V_ANTCR) * null(IINET)* positif_ou_nul(abs(NAPTOTA)
             - IRESTIT - IRANT) * (1 - positif_ou_nul(abs(NAPTOTA) - IRESTIT
             - IRANT - SEUIL_12))
               * null(IDRS2 - IDEC + IREP)
	       * LIGPS
               * (1 - INDCTX);

LIGTROPREST =  positif(V_ANTRE+V_ANTCR) * null(IINET)* positif_ou_nul(abs(NAPTOTA) 
               - IRESTIT - IRANT) * (1 - positif_ou_nul(abs(NAPTOTA) - IRESTIT
               - IRANT - SEUIL_12))
		 * (1 - positif(LIGTROP))
	         * (1 - LIGPS)
                 * (1 - INDCTX);

LIGTROPRESTS =  positif(V_ANTRE+V_ANTCR) * null(IINET)* positif_ou_nul(abs(NAPTOTA) 
                - IRESTIT - IRANT) * (1 - positif_ou_nul(abs(NAPTOTA) - IRESTIT
                - IRANT - SEUIL_12))
		 * (1 - positif(LIGTROP))
	         * LIGPS
                 * (1 - INDCTX);

regle 1113210:
application : batch, iliad ;

LIGRESINF50 = positif(positif(IND_REST50) * positif(IREST) 
                      + positif(RECUM) * (1 - positif_ou_nul(RECUM - SEUIL_8)))  
	      * positif(SEUIL_8 - IRESTIT) * null(LIGRESINF) ;

regle 1112200:
application : batch,iliad ;
LIG2200 = (positif(IDEGR) * positif_ou_nul(IDEGR - SEUIL_8) * (1 - LIGPS) * TYPE2) ;

LIG2200S = (positif(IDEGR) * positif_ou_nul(IDEGR - SEUIL_8) * LIGPS * TYPE2) ;

regle 1112205:
application : batch, iliad;
LIG2205 = positif(IDEGR) * (1 - positif_ou_nul(IDEGR - SEUIL_8)) * (1 - LIGPS) * LIG2 ;

LIG2205S = positif(IDEGR) * (1 - positif_ou_nul(IDEGR - SEUIL_8)) * LIGPS * LIG2 ;

regle 1112301:
application : batch, iliad;
IND_NIRED = si ((CODINI=3 ou CODINI=5 ou CODINI=13)
               et ((IAVIM +NAPCRPAVIM)- TAXASSUR + IPCAPTAXT + TAXLOY + CHRAPRES) = 0 
                   et  V_CR2 = 0)
          alors (1 - INDCTX) 
          finsi;
regle 1112905:
application : batch, iliad;
IND_IRNMR = si (CODINI=8 et NATIMP=0 et V_CR2 = 0)
          alors (1 - INDCTX)  
          finsi;
regle 1112310:
application : batch, iliad;

 
IND_IRINF80 = si ( ((CODINI+0=9 et NATIMP+0=0) ou (CODINI +0= 99))
                  et V_CR2=0 
                  et  (IRNET +TAXASSUR + IPCAPTAXT + TAXLOY + CHRAPRES + NAPCR < SEUIL_12)
                  et  ((IAVIM+NAPCRPAVIM) >= SEUIL_61))
              alors ((1 - positif(INDCTX)) * (1 - positif(IREST))) 
              finsi;


regle 11123101:
application : batch , iliad ;

LIGNIIR = null(IRNETBIS)
           * null(NRINET + 0)
           * null(NATIMP +0)
           * null(TAXANET + PCAPNET + TAXLOYNET + HAUTREVNET + NAPCRP + 0)
           * (1 - positif(IREP))
           * (1 - positif(IPROP))
           * (1 - positif(IRESTIT))
           * (1 - positif(IDEGR))
           * (1 - positif(LIGIDB))
           * (1 - positif(LIGNIRI))
           * (1 - positif(LIG80F))
           * (1 - positif(LIG400RI))
           * (1 - positif(LIG400F))
           * (1 - positif(LIGAUCUN))
           * (1 - positif(LIG2141))
           * (1 - positif(LIG2501))
           * (1 - positif(LIG8FV))
           * (1 - positif(LIGNIDB))
           * (1 - null(V_REGCO-2 +0))
           * (1 - positif(LIGTROP))
	   * (1 - positif(LIGTROPREST))
	   * (1 - positif(IMPRET))
	   * (1 - positif(NRINET))
	   * positif(20 - V_NOTRAIT)
           * LIG2 ;

LIGNIIRDEG = null(IDRS3 - IDEC)
	       * null(IBM23)
	       * (1 - positif(IRE))
               * null(TAXASSUR + IPCAPTAXT + TAXLOY + CHRAPRES + NAPCRP)
               * (1 - null(V_REGCO-2))
               * (1 - positif(LIG2501))
	       * (1 - positif(LIGTROP))
	       * (1 - positif(LIGTROPREST))
	       * (1 - positif(IMPRET - SEUIL_12))
	       * (1 - positif(NRINET - SEUIL_12))
	       * positif(1 + null(3 - INDIRPS))
	       * positif(V_NOTRAIT - 20)
               * LIG2 ;

regle 11123102:
application : batch , iliad ;

LIGCBAIL = null(IDOM11 - DEC11)
            * (1 - positif(IBM23))
	    * positif_ou_nul(TAXASSUR + IPCAPTAXTOT + TAXLOY + CHRAPRES + NAPCRP - SEUIL_61)
	    * positif_ou_nul(NAPTIR + NAPCRP - SEUIL_12)
	    * (1 - positif(LIGNIDB))
	    * (1 - positif(LIGTROP))
	    * (1 - positif(LIGTROPREST))
	    * (1 - positif(IMPRET))
	    * (1 - positif(NRINET))
            * (1 - null(V_REGCO - 2))
            * LIG2 ;

LIGNITSUP = positif_ou_nul(TAXASSUR + IPCAPTAXT + TAXLOY + CHRAPRES - SEUIL_61)
             * null(IDRS2-IDEC+IREP)
             * positif_ou_nul(TAXANET + PCAPNET + TAXLOYNET + HAUTREVNET - SEUIL_12)
	     * (1 - positif(LIG0TSUP))
             * (1 - null(V_REGCO-2))
	     * (1 - positif(LIGTROP))
	     * (1 - positif(LIGTROPREST))
	     * positif(V_NOTRAIT - 20)
	     * (1 - positif(INDCTX))
             * LIG2 ;
                       
LIGNITDEG = positif(TAXANET + PCAPNET + TAXLOYNET + HAUTREVNET)
             * positif_ou_nul(IRB2 - SEUIL_61)
             * positif_ou_nul(TAXANET + PCAPNET + TAXLOYNET + HAUTREVNET - SEUIL_12)
             * null(INDNIRI) * (1 - positif(IBM23))
             * positif(1 - null(2-V_REGCO)) * INDREV1A8
             * (1 - null(V_REGCO-2))
	     * (1 - positif(LIGTROP))
	     * (1 - positif(LIGTROPREST))
	     * (1 - positif(IMPRET))
	     * positif(INDCTX)
             * LIG2 ;
                       
regle 11123103:
application : batch , iliad ;

LIGNIDB = null(IDOM11 - DEC11)
           * positif(SEUIL_61 - TAXASSUR - IPCAPTAXTOT - TAXLOY - CHRAPRES)
           * positif(SEUIL_61 - NAPCRP)
	   * positif(TAXASSUR + IPCAPTAXTOT + TAXLOY + CHRAPRES + NAPCRP)
           * null(IRNETBIS)
	   * (1 - positif(IRESTIT))
           * (1 - positif(IREP))
           * (1 - positif(IPROP))
           * (1 - positif(LIG80F))
           * (1 - positif(LIG400RI))
	   * (1 - positif(LIGTROP))
	   * (1 - positif(LIGTROPREST))
	   * (1 - positif(NRINET))
	   * (1 - positif(IMPRET))
           * (1 - null(V_REGCO - 2))
           * LIG2 ;  

LIGREVSUP = INDREV1A8
	     * positif(REVFONC)
	     * (1 - null(V_REGCO-2))
	     * (1 - positif(LIGTROP))
	     * (1 - positif(LIGTROPREST))
	     * (1 - positif(IMPRET))
	     * positif(V_NOTRAIT - 20)
	     * (1 - positif(INDCTX))
             * LIG2 ;  

LIGREVDEG = INDREV1A8
	     * positif(REVFONC)
	     * (1 - null(V_REGCO-2))
	     * (1 - positif(LIGTROP))
	     * (1 - positif(LIGTROPREST))
	     * (1 - positif(IMPRET))
	     * positif(INDCTX)
             * LIG2 ;  

regle 11123104:
application : batch , iliad ;

LIGNIRI = INDNIRI
           * null(IRNETBIS)
           * null(NATIMP)
	   * null(NAPCRP)
	   * (1 - positif(IRE))
           * (1 - positif(LIGIDB))
           * (1 - positif(IREP))
           * (1 - positif(IPROP))
           * (1 - positif(AVFISCOPTER))
           * (1 - null(V_REGCO-2))
           * (1 - positif(TAXANET + PCAPNET + TAXLOYNET + HAUTREVNET))
	   * (1 - positif(LIGTROP))
	   * (1 - positif(LIGTROPREST))
	   * (1 - positif(IMPRET))
	   * (1 - positif(NRINET))
	   * positif(20 - V_NOTRAIT)
           * LIG2 ; 

regle 11123105:
application : batch , iliad ;

LIGIDB = INDNIRI
          * null(IBM23)
	  * positif(TAXASSUR + IPCAPTAXTOT + TAXLOY + CHRAPRES + NAPCRP)
          * positif(SEUIL_61 - TAXASSUR - IPCAPTAXTOT - TAXLOY - CHRAPRES) 
          * positif(SEUIL_61 - NAPCRP) 
	  * (1 - positif(IRESTIT))
          * (1 - positif(IREP))
          * (1 - positif(IPROP))
          * (1 - null(V_REGCO-2))
	  * (1 - positif(LIGTROP))
	  * (1 - positif(LIGTROPREST))
	  * (1 - positif(IMPRET))
	  * (1 - positif(NRINET))
          * LIG2 ;

regle 11123106:
application : batch , iliad ;

LIGRIDB = positif(INDNIRI
	          * null(IBM23)
	          * (positif_ou_nul(TAXASSUR + IPCAPTAXTOT + TAXLOY + CHRAPRES - SEUIL_61)
	             + positif_ou_nul(NAPCRP - SEUIL_61))
	          * positif_ou_nul(NAPTIR + NAPCRP - SEUIL_12)
                  * (1 - positif(IREP))
                  * (1 - positif(IPROP))
                  * (1 - null(V_REGCO-2))
	          * (1 - positif(LIGTROP))
	          * (1 - positif(LIGTROPREST))
	          * (1 - positif(IMPRET))
	          * (1 - positif(NRINET))
                  * LIG2 
                 ) ;

LIG0TSUP = INDNIRI
            * null(IRNETBIS)
            * positif_ou_nul(TAXASSUR + IPCAPTAXT + TAXLOY + CHRAPRES - SEUIL_61)
            * (1 - positif(IREP))
            * (1 - positif(IPROP))
            * (1 - null(V_REGCO-2))
	    * (1 - positif(LIGTROP))
	    * (1 - positif(LIGTROPREST))
	    * positif(V_NOTRAIT - 20)
	    * (1 - positif(INDCTX))
            * LIG2 ;

LIG0TDEG = INDNIRI
            * null(IRNETBIS)
            * positif_ou_nul(TAXASSUR + IPCAPTAXT + TAXLOY + CHRAPRES - SEUIL_61)
            * (1 - positif(IREP))
            * (1 - positif(IPROP))
            * (1 - null(V_REGCO-2))
	    * (1 - positif(LIGTROP))
	    * (1 - positif(LIGTROPREST))
	    * positif(INDCTX)
            * LIG2 ;

regle 11123111:
application : batch , iliad ;

LIGPSNIR = positif(IAVIM) 
           * positif(SEUIL_61 - IAVIM) 
           * positif(SEUIL_61 - NAPTIR)
           * positif_ou_nul(NAPCRP - SEUIL_61)
           * (positif(IINET) * positif(20 - V_NOTRAIT) + positif(V_NOTRAIT - 20)) 
           * (1 - positif(LIG400RI))
           * (1 - null(V_REGCO-2))
           * (1 - positif(LIGNIDB))
	   * (1 - positif(LIGTROP))
	   * (1 - positif(LIGTROPREST))
	   * (1 - positif(IMPRET))
	   * (1 - positif(NRINET))
           * LIG2 ;

LIGIRNPS = positif((positif_ou_nul(IAVIM - SEUIL_61) * positif_ou_nul(NAPTIR - SEUIL_12)) * positif(IBM23)
                   + positif(IRESTIT + 0))
           * positif(SEUIL_61 - NAPCRP)
           * positif(NAPCRP)
           * (1 - positif(LIG400RI))
           * (1 - null(V_REGCO-2))
           * (1 - positif(LIGNIDB))
	   * (1 - positif(LIGTROP))
	   * (1 - positif(LIGTROPREST))
	   * (1 - positif(IMPRET))
	   * (1 - positif(NRINET))
           * LIG2 ;

LIG400F = INDNMR1 * positif(IAMD2) * (1 - INDNIRI) 
           * positif_ou_nul(NAPTIR)
           * (1 - positif(LIG400RI))
           * (1 - null(V_REGCO-2))
           * (1 - positif(LIGNIDB))
	   * (1 - positif(LIGTROP))
	   * (1 - positif(LIGTROPREST))
	   * (1 - positif(IMPRET))
	   * (1 - positif(NRINET))
	   * positif(20 - V_NOTRAIT)
           * LIG2 ;

LIG400DEG = positif(IAVIM + NAPCRPAVIM)
  	     * positif (SEUIL_61 - (IAVIM + NAPCRPAVIM))
	     * null(ITRED)
	     * positif (IRNET)
	     * (1 - positif(IRNET - SEUIL_61))
             * (1 - null(V_REGCO-2))
	     * (1 - positif(LIGTROP))
	     * (1 - positif(LIGTROPREST))
	     * (1 - positif(IMPRET - SEUIL_12))
	     * (1 - positif(NRINET - SEUIL_12))
	     * positif(V_NOTRAIT - 20)
             * LIG2 ;

regle 11123112:
application : batch , iliad ;

LIG400RI = INDNMR1 
	    * positif(ITRED)
            * (1 - null(IRB))
            * (1 - null(V_REGCO-2))
	    * (1 - positif(LIGTROP))
	    * (1 - positif(LIGTROPREST))
	    * positif(20 - V_NOTRAIT)
            * LIG2 ;

LIG61NRSUP = positif(IBM23)
              * positif(ITRED)
	      * positif(IAVIM + NAPCRPAVIM)  
              * positif(SEUIL_61 - (IAVIM + NAPCRPAVIM))
              * (1 - positif(INDNMR2))
              * (1 - null(V_REGCO-2))
	      * (1 - positif(LIGTROP))
	      * (1 - positif(LIGTROPREST))
	      * (1 - positif(IMPRET))
	      * (1 - positif(NRINET))
	      * positif(V_NOTRAIT - 20) 
              * LIG2 ;

LIG61DEG = positif(ITRED)
	    * positif(IAVIM)  
            * positif(SEUIL_61 - IAVIM)
            * (1 - positif(INDNMR2))
            * (1 - null(V_REGCO-2))
	    * (1 - positif(LIGTROP))
	    * (1 - positif(LIGTROPREST))
	    * (1 - positif(IMPRET))
            * positif(INDCTX)
            * LIG2 ;

regle 11123113:
application : batch , iliad ;
	

LIG80F = positif((positif(SEUIL_12 - NAPTIR) * positif(NAPTIR) * positif(SEUIL_61 - NAPCRP) * positif_ou_nul(IAVIM - SEUIL_61)
                  + positif(SEUIL_12 - (NAPCRP + NAPTIR)) * positif(NAPCRP + NAPTIR) * positif_ou_nul(NAPCRP - SEUIL_61))
                 * (1 - positif (IRANT))
	         * (1 - positif(LIGTROP))
	         * (1 - positif(LIGTROPREST))
	         * positif(20 - V_NOTRAIT)
                 * (1 - null(V_REGCO - 2))
                 * LIG2) 
                ;

regle 11123114:
application : batch , iliad ;
	

LIGAUCUN = positif((positif_ou_nul(IAVIM - SEUIL_61)
                    + positif_ou_nul(NAPCRP - SEUIL_61))
                   * null(TOTNET)
	           * null(NAPT)
	           * (1 - positif(IREST))
                   * (1 - positif(LIG80F))
	           * (1 - positif(LIGTROP))
	           * (1 - positif(LIGTROPREST))
	           * (1 - positif(IMPRET))
	           * (1 - positif(NRINET))
                   * (1 - null(V_REGCO - 2))
	           * positif(20 - V_NOTRAIT) 
	           * LIG2
                  ) ;

regle 11123115:
application : batch , iliad ;

LIG12ANT = positif (IRANT)
            * positif (SEUIL_12 - TOTNET )
	    * positif( TOTNET)
	    * (1 - positif(LIGTROP))
	    * (1 - positif(LIGTROPREST))
	    * (1 - positif(null(2-V_REGCO) + (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO))) * positif(NRINET-SEUIL_12))
	    * (1 - positif(IMPRET - SEUIL_12)) 
	    * (1 - positif(NRINET - SEUIL_12))
	    * positif(20 - V_NOTRAIT)
            * LIG2 ; 

regle 11123116:
application : batch , iliad ;

LIG12NMR = positif(IRPSCUM)
            * positif(SEUIL_12 - IRPSCUM)
	    * positif(V_NOTRAIT - 20)
            * (1 - null(2-V_REGCO))
	    * (1 - positif(IMPRET - SEUIL_12)) 
	    * (1 - positif(NRINET - SEUIL_12)) ;

regle 11123117:
application : batch , iliad ;

LIGNIIRAF = null(IAD11)
             * positif(IRESTIT)
             * (1 - positif(INDNIRI))
             * (1 - positif(IREP))
             * (1 - positif(IPROP))
             * (1 - positif_ou_nul(NAPTIR))
	     * (1 - positif(LIGTROP))
	     * (1 - positif(LIGTROPREST))
	     * positif(1 + null(3 - INDIRPS))
             * LIG2 ;

regle 11123118:
application : batch , iliad ;

LIGNIRIAF = INDNIRI
             * null(IBM23)
             * positif(positif(IRESTIT) + positif(V_NOTRAIT - 20))
	     * (1 - positif(LIGIDB))
	     * (1 - positif(LIGRIDB))
             * (1 - positif(IREP))
             * (1 - positif(IPROP))
	     * (1 - positif(IMPRET))
	     * (1 - positif(LIGTROP))
	     * (1 - positif(LIGTROPREST))
             * LIG2 ;

regle 11123120:
application : batch , iliad ;

LIGNIDEG = null(IDRS3-IDEC)
	    * null(IBM23)
	    * positif(SEUIL_61 - TAXASSUR)
	    * positif(SEUIL_61 - IPCAPTAXT)
	    * positif(SEUIL_61 - TAXLOY)
	    * positif(SEUIL_61 - CHRAPRES)
            * positif(SEUIL_12 - IRNET)
            * (1 - null(V_REGCO-2))
	    * (1 - positif(LIGDEG61))
	    * (1 - positif(LIGTROP))
	    * (1 - positif(LIGTROPREST))
	    * positif(INDCTX)
            * LIG2 ;

regle 11123121:
application : batch , iliad ;

LIGDEG61 = positif (IRNETBIS)
            * positif (SEUIL_61 - IAMD1) 
            * positif (SEUIL_61 - NRINET) 
	    * positif (IBM23)
	    * (1 - positif(LIG61DEG))
            * (1 - null(V_REGCO-2))
	    * (1 - positif(LIGTROP))
	    * (1 - positif(LIGTROPREST))
	    * (1 - positif(IMPRET))
            * positif (INDCTX)
            * LIG2 ;

regle 11123122:
application : batch , iliad ;

LIGDEG12 = positif (IRNET + TAXANET + PCAPNET + TAXLOYNET + HAUTREVNET)
            * positif (SEUIL_12 - IRNET - TAXANET - PCAPNET - TAXLOYNET - HAUTREVNET)
            * (1 - null(V_REGCO-2))
            * (1 - positif(LIGNIDEG))
            * (1 - positif(LIGDEG61))
            * (1 - positif(LIG61DEG))
	    * (1 - positif(LIGTROP))
	    * (1 - positif(LIGTROPREST))
            * (1 - positif(IMPRET))
	    * positif(INDCTX)
            * LIG2 ;

regle 11123124:
application : batch , iliad ;

LIGDIPLOI = positif(INDREV1A8)
             * positif(null(NATIMP - 1) + positif(NAPTEMP))
             * positif(REVFONC) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) 
	     * (1 - positif(LIGTROP))
	     * (1 - positif(LIGTROPREST))
             * LIG1 ;

regle 11123125:
application : batch , iliad ;

LIGDIPLONI = positif(INDREV1A8)
              * positif(null(NATIMP) + positif(IREST) + (1 - positif(NAPTEMP)))
              * positif(REVFONC) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO))
	      * (1 - positif(LIGTROP))
	      * (1 - positif(LIGTROPREST))
	      * (1 - LIGDIPLOI)
              * LIG1 ;

regle 1112355:
application : batch, iliad ;
LIG2355 = positif (
		   IND_NI * (1 - positif(V_ANTRE)) + INDNMR1 + INDNMR2
                   + positif(NAT1BIS) *  null(NAPT) * (positif (IRNET + TAXANET + PCAPNET + TAXLOYNET + HAUTREVNET))
		   + positif(SEUIL_12 - (IAN + RPEN - IAVT + TAXASSUR + IPCAPTAXT + TAXLOY + CHRAPRES - IRANT))
				 * positif_ou_nul(IAN + RPEN - IAVT + TAXASSUR + IPCAPTAXT + TAXLOY + CHRAPRES - IRANT) 
                  )
          * positif(INDREV1A8)
          * (1 - null(NATIMP - 1) + null(NATIMP - 1) * positif(IRANT))  
	  * (1 - LIGPS)
	  * LIG2 ;

regle 1112382:
application : batch , iliad ;

LIG2LB = positif(COD2LB) * LIG1 * LIG2 * (1-V_CNR) ;
LIG7CY = positif(COD7CY) * LIG1 * LIG2 ;
LIGRVG = positif(CODRVG) * LIG1 * LIG2 ;

regle 1112380:
application : batch, iliad;

LIG2380 = si (NATIMP=0 ou NATIMP=21 ou NATIMP=70 ou NATIMP=91)
          alors (IND_SPR * positif_ou_nul(V_8ZT - RBG) * positif(V_8ZT)
                * (1 - present(BRAS)) * (1 - present(IPSOUR))
                * V_CR2 * LIG2)
          finsi ;

regle 1112383:
application : batch , iliad ;

LIG2383 = si ((IAVIM+NAPCRPAVIM)<=(IPSOUR * LIG1 ))
          alors ( positif(RBG - V_8ZT) * present(IPSOUR) 
                * V_CR2 * LIG2)
          finsi ;

regle 1112501:
application : iliad,batch;

LIG2501 = (1 - positif(IND_REV)) * (1 - null(2 - V_REGCO)) * LIG2 ;

LIG25012 = (1 - positif(IND_REV)) * null(2 - V_REGCO) * LIG2 ;

LIG8FV = positif(REVFONC) * (1 - IND_REV8FV) ;

regle 1112503:
application : batch, iliad;
LIG2503 = (1 - positif(IND_REV))
          * (1 - positif_ou_nul(IND_TDR))
          * LIG2
          * (1 - null(2 - V_REGCO)) ;

regle 1113510:
application : batch, iliad;
LIG3510 =  (positif(V_FORVA) * (1 - positif_ou_nul(BAFV))
           + positif(V_FORCA) * (1 - positif_ou_nul(BAFC))
           + positif(V_FORPA) * (1 - positif_ou_nul(BAFP)))
           * (1 - positif(IPVLOC)) * LIG1 ;

regle 1113700:
application : batch, iliad ;

LIG3700 = positif(LIG4271 + LIG3710 + LIG3720 + LIG3730) * LIG1 * TYPE4 ;

regle 1113710:
application : batch , iliad ;

LIG4271 = positif(positif(V_0AB) * LIG1) * (1 - positif(ANNUL2042 + 0)) ;

LIG3710 = positif(20 - V_NOTRAIT) * positif(BOOL_0AZ) * LIG1 ;

regle 1113720:
application : batch, iliad ;

LIG3720 = (1 - positif(20 - V_NOTRAIT)) * (1 - positif(LIG3730)) * LIG1 * LIG2 ;

regle 1113730:
application : batch, iliad ;

LIG3730 = (1 - positif(20 - V_NOTRAIT))
          * positif(BOOL_0AZ)
          * LIG1 ;

regle 1113740:
application : batch, iliad;
LIG3740 = positif(INDTXMIN) * LIG1 * positif(IND_REV) * (1 - positif(ANNUL2042)) ;

regle 1113750:
application : batch, iliad;
LIG3750 = present(V_ZDC) * null(abs(V_ZDC - 1)) * positif(IREST) * LIG1 ;

regle 111021:
application : iliad , batch ;
LIGPRR2 = positif(PRR2V + PRR2C + PRR2P + PRR2ZV + PRR2ZC + PRR2Z1 + PRR2Z2 + PRR2Z3 + PRR2Z4 + PENALIMV + PENALIMC + PENALIMP + 0) ;

regle 111022:
application : batch, iliad;
LIG022 = somme(i=1..4:TSNN2iAFF) ;

regle 111023:
application : batch, iliad;
LIG023 = somme(i=1..4:3TSNi) ;

regle 111024:
application : batch, iliad;
LIG024 = somme(i=1..4:4TSNi) ;

regle 111062:
application : batch, iliad;
LIG062V = CARPEV + CARPENBAV + PENSALV + PENSALNBV + CODRAZ;
LIG062C = CARPEC + CARPENBAC + PENSALC + PENSALNBC + CODRBZ;
LIG062P = somme(i=1..4: CARPEPi + CARPENBAPi) + somme(i=1..4: PENSALPi + PENSALNBPi) + CODRCZ + CODRDZ + CODREZ + CODRFZ ;
regle 111066:
application : batch,iliad;
LIG066 = somme(i=1..4:PEBFi);
regle 111390:
application : batch, iliad;
LIG390 = GLD1V + GLD1C ;

regle 114100:
application : batch , iliad ;
LIG_SAL = positif_ou_nul(TSHALLOV + TSHALLOC + TSHALLOP) * positif_ou_nul(ALLOV + ALLOC + ALLOP) * LIG0  * LIG2 ;

LIG_REVASS = positif_ou_nul(ALLOV + ALLOC + ALLOP) * positif_ou_nul(TSHALLOV + TSHALLOC + TSHALLOP) * LIG0  * LIG2 ;

LIG_SALASS = positif(TSBNV + TSBNC + TSBNP + F10AV + F10AC + F10AP
                     + null(ALLOV + ALLOC + ALLOP) * null(TSHALLOV + TSHALLOC + TSHALLOP))
               * LIG0 * LIG2 ;

LIG_GATASA = positif_ou_nul(BPCOSAV + BPCOSAC + GLDGRATV + GLDGRATC) * LIG0 * LIG2 ;

LIGF10V = positif(F10AV + F10BV) * LIG0 * LIG2 ;

LIGF10C = positif(F10AC + F10BC) * LIG0 * LIG2 ;

LIGF10P = positif(F10AP + F10BP) * LIG0 * LIG2 ;

regle 114500:
application : batch , iliad;
LIGRCMABT = positif(present(RCMABD) + present(RCMTNC)
                    + present(RCMHAD) + present(RCMHAB) + present(RCMAV) + present(REGPRIV)
                    + present(RCMFR) + present(DEFRCM) + present(DEFRCM2) + present(DEFRCM3)
                    + present(DEFRCM4) + present(DEFRCM5) + present(DEFRCM6))
             * (1 - positif(IPVLOC)) * LIG1 * LIG2 * positif(INDREV1A8IR) ;

LIG2RCMABT = positif(present(REVACT) + present(REVPEA) + present(PROVIE) + present(DISQUO) + present(RESTUC) + present(INTERE))
                * (1 - positif(IPVLOC)) * LIG1 * LIG2 * positif(INDREV1A8IR) ;

LIGPV3VG = positif(PVBAR3VG) * (1 - positif(IPVLOC)) * LIG1 * LIG2 * positif(INDREV1A8IR) ;

LIGPV3WB = positif(PVBAR3WB) * (1 - positif(IPVLOC)) * LIG1 * LIG2 * positif(INDREV1A8IR) ;

LIGPV3VE = positif(PVBAR3VE) * (1 - positif(IPVLOC)) * LIG1 * LIG2 * positif(INDREV1A8IR) ;

regle 114800:
application : iliad, batch ;
pour i=V,C,P:
PPESAISITPi = positif(PPEACi* positif(abs(PPERPROi)));

pour i=V,C,P:
PPESAISINBJi = positif(PPENJi* positif(abs(PPERPROi)));

INDPPEV = positif( PPETPV * PPESALVTOT
                   + PPENBHV * PPESALVTOT
                   + positif(
                              present(BPCOSAV)
                            + present(GLDGRATV)
                            + present(GLD1V)
                            + present(GLD2V)
                            + present(GLD3V)
                            + present(TSASSUV)
                            + present(CARTSV) * present(CARTSNBAV)
                            + present(CODDAJ) + present(CODEAJ)
                             ) * (PPEPRIMEVT + PPEMAJORETTE * null(PPEPRIMECT))
                   + (PPEACV + PPENJV) * abs(PPERPROV) * (null(TSHALLOV+0) + positif(PPETPV + PPENBHV +0))
                   + abs(PPERPROV) * (PPEPRIMEVT + PPEMAJORETTE * null(PPEPRIMECT))
                 ) ;

INDPPEC = positif( PPETPC * PPESALCTOT
                   + PPENBHC * PPESALCTOT
                   + positif(
                              present(BPCOSAC)
                            + present(GLDGRATV)
                            + present(GLD1C)
                            + present(GLD2C)
                            + present(GLD3C)
                            + present(TSASSUC)
                            + present(CARTSC) * present(CARTSNBAC)
                            + present(CODDBJ) + present(CODEBJ)
                             ) * PPEPRIMECT
                   + (PPEACC + PPENJC) * abs(PPERPROC) * (null(TSHALLOC+0) + positif(PPETPC + PPENBHC + 0))
                   + abs(PPERPROC) * PPEPRIMECT
                 ) ;

INDPPEP = positif(   somme(i=1..4:PPETPPi)*PPESALPTOT
                   + somme(i=1..4:PPENBHi)*PPESALPTOT
                   + (PPEACP+PPENJP)*abs(PPERPROP)*(null(TSHALLO1 + TSHALLO2 + TSHALLO3 + TSHALLO4 + 0)
                                                         + positif (somme (i=1..4:PPETPPi + PPENBHi + 0)))
                   + somme(i=1..4:present(CARTSPi) * present(CARTSNBAPi)) * PPEPRIMEPT
                   + abs(PPERPROP)*PPEPRIMEPT
                 ) ;

TYPEPPE = (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG0 * LIG2 ;

LIGPPEVCP = (positif(INDPPEV) * positif(INDPPEC) * positif(INDPPEP)) * TYPEPPE ;

LIGPPEV = (positif(INDPPEV) * null(INDPPEC) * null(INDPPEP)) * TYPEPPE ;

LIGPPEVC = (positif(INDPPEV) * positif(INDPPEC) * null(INDPPEP)) * TYPEPPE ;

LIGPPEVP = (positif(INDPPEV) * null(INDPPEC) * positif(INDPPEP)) * TYPEPPE ;

LIGPPEC = (null(INDPPEV) * positif(INDPPEC) * null(INDPPEP)) * TYPEPPE ;

LIGPPECP = (null(INDPPEV) * positif(INDPPEC) * positif(INDPPEP)) * TYPEPPE ;

LIGPPEP = (null(INDPPEV) * null(INDPPEC) * positif(INDPPEP)) * TYPEPPE ;

INDLIGPPE = positif(LIGPPEVCP + LIGPPEV + LIGPPEVC + LIGPPEVP + LIGPPEC + LIGPPECP + LIGPPEP)
            * (1 - null(7 - PPENEXOV)) * (1 - null(11 - PPENEXOV))
            * (1 - null(7 - PPENEXOC)) * (1 - null(11 - PPENEXOC))
            * (1 - null(7 - PPENEXO1)) * (1 - null(11 - PPENEXO1))
            * (1 - null(7 - PPENEXO2)) * (1 - null(11 - PPENEXO2))
            * (1 - null(7 - PPENEXO3)) * (1 - null(11 - PPENEXO3))
            * (1 - null(7 - PPENEXO4)) * (1 - null(11 - PPENEXO4))
            * (1 - null(2 - PPEPEXOV))
            * (1 - null(2 - PPEPEXOC))
            * (1 - null(2 - PPEPEXO1))
            * (1 - null(2 - PPEPEXO2))
            * (1 - null(2 - PPEPEXO3))
            * (1 - null(2 - PPEPEXO4)) ;

LIGPPETOT = positif(PPETOT) * (1 - null(7 - V_REGCO)) ;

LIGPPEMAY = positif(PPETOTMAY) * null(7 - V_REGCO) ;

LIGPASPPE = INDLIGPPE * null(PPETOTX) ;

regle 1149000:
application : iliad, batch;
LIGPIPPE = positif (PPETOTX) * LIG0;
regle 1149001:
application : iliad, batch;
PPEREVSALV = positif(PPESALVTOT * INDLIGPPE
                    + PPESALV * positif(PPEPRIMEVT) * positif(PPETOTX))
                    * (1-null(2 - V_REGCO)) * (1-null(4 - V_REGCO))
                    * INDPPEV
                    * INDLIGPPE;
PPEREVSALC = positif(PPESALCTOT * INDLIGPPE
                    + PPESALC * positif(PPEPRIMECT) * positif(PPETOTX))
                    * (1-null(2 - V_REGCO)) * (1-null(4 - V_REGCO))
                    * INDPPEC
                    * INDLIGPPE;
PPEREVSALP = positif(PPESALPTOT + PPESALPTOT * INDLIGPPE
                    +PPESALPTOT * positif(PPEPRIMEPT) * positif(PPETOTX))
                    * (1-null(2 - V_REGCO)) * (1-null(4 - V_REGCO))
                    * INDPPEP
                    * INDLIGPPE;

regle 114900:
application : iliad, batch;
TPLEINSALV = positif(PPETPV  * PPESALVTOT + positif(PPENBHV - 1820)
                    + PPESALVTOT * INDLIGPPE * (1 - positif(LIGPPEHV))
                    + positif(PPEPRIMEVT) * positif(PPETOTX)
                     * positif(PPESALV) * (1 - positif(LIGPPEHV))
                    + positif(PPESALV) * (1 - positif(LIGPPEHV)))
                    * INDPPEV
                    * positif(INDLIGPPE) * LIG0 * LIG2 ;

TPLEINSALC = positif(  PPETPC*PPESALCTOT
                    + PPESALCTOT * INDLIGPPE * (1 - positif(LIGPPEHC))
                     + positif(PPENBHC - 1820)
                    + positif(PPEPRIMECT) * positif(PPETOTX)
                     * positif(PPESALC) * (1 - positif(LIGPPEHC))
                     +positif(PPESALC) * (1 - positif(LIGPPEHC)))
                    * INDPPEC
                    * positif(INDLIGPPE) * LIG0 * LIG2 ;

TPLEINSALP = positif((PPETPP1 + PPETPP2 + PPETPP3 + PPETPP4) * PPESALPTOT
              + positif(PPENBH1 - 1820) + positif(PPENBH2 - 1820)
              + positif(PPENBH3 - 1820) + positif(PPENBH4 - 1820)
                    + PPESALPTOT * INDLIGPPE * (1 - positif(LIGPPEHP))
                    + positif(PPEPRIMEPT) * positif(PPETOTX)
                     * positif(PPESALPTOT) * (1 - positif(LIGPPEHP))
                    +positif(PPESALPTOT) * (1 - positif(LIGPPEHP)))
              * INDPPEP
              * positif(INDLIGPPE) * LIG0 * LIG2 ;

TPLEINNSALV = positif(positif(PPEACV + positif(PPENJV - 360)
               + positif(positif(1-null(PPE_AVRPRO1V+0))
                * positif(positif(PPETOTX) + positif(PPEREVSALV))
                      * positif(abs(PPERPROV)))
               * (1 - positif(LIGPPEJV))) * positif(INDLIGPPE)
               + positif(PPESAISITPV) * positif(PPEACV))
               * INDPPEV
               * LIG0 * LIG2 ;

TPLEINNSALC = positif(positif(PPEACC + positif(PPENJC - 360)
               + positif(positif(1-null(PPE_AVRPRO1C+0))
                * positif(positif(PPETOTX) + positif(PPEREVSALC))
                      * positif(abs(PPERPROC)))
               * (1 - positif(LIGPPEJC)))* positif(INDLIGPPE)
               + positif(PPESAISITPC) * positif(PPEACC))
               * INDPPEC
               * LIG0 * LIG2 ;

TPLEINNSALP =positif(positif(PPEACP + positif(PPENJP - 360)
              + positif(positif(1 - null(PPE_AVRPRO1P+0))
               * positif(positif(PPETOTX) + positif(PPEREVSALP))
                      * positif(abs(PPERPROP)))
              * (1 - positif(LIGPPEJP)))* positif(INDLIGPPE)
              + positif(PPESAISITPP) * positif(PPEACP))
              * INDPPEP
              * LIG0 * LIG2 ;

regle 114902:
application : iliad, batch;
LIGPPENSV = positif(positif(positif(1 - null(PPE_AVRPRO1V+0))
              * positif(positif(PPETOTX) + positif(PPEREVSALV))
                     * positif(INDLIGPPE))
                    + positif(PPESAISITPV + PPESAISINBJV))
                   * INDPPEV
                   * LIG0 * LIG2 ;

LIGPPENSC = positif(positif(positif(1 - null(PPE_AVRPRO1C+0))
              * positif(positif(PPETOTX) + positif(PPEREVSALC))
                   * positif(INDLIGPPE))
                    + positif(PPESAISITPC + PPESAISINBJC))
                   * INDPPEC
                   * LIG0 * LIG2 ;

LIGPPENSP = positif(positif(positif(1-null(PPE_AVRPRO1P+0))
              * positif(positif(PPETOTX) + positif(PPEREVSALP))
                   * positif(INDLIGPPE))
                    + positif(PPESAISITPP + PPESAISINBJP))
                   * INDPPEP
                   * LIG0 * LIG2 ;

regle 114901:
application : iliad,batch;
LIGPPEHV = positif_ou_nul(1820 - PPENBHV) * present(PPENBHV)
                        * INDPPEV
                        * positif(INDLIGPPE) * LIG0 * LIG2 ;
LIGPPEHC = positif_ou_nul(1820 - PPENBHC) * present(PPENBHC)
                        * INDPPEC
                        * positif(INDLIGPPE) * LIG0 * LIG2 ;
LIGPPEHP = positif(
              positif_ou_nul(1820 - PPENBH1) * present(PPENBH1)
            + positif_ou_nul(1820 - PPENBH2) * present(PPENBH2)
            + positif_ou_nul(1820 - PPENBH3) * present(PPENBH3)
            + positif_ou_nul(1820 - PPENBH4) * present(PPENBH4)
                   )
            * INDPPEP
            * positif(INDLIGPPE) * LIG0 * LIG2 ;

LIGPPEJV = positif_ou_nul(360 - PPENJV) * positif(INDLIGPPE) * LIG0 * LIG2
           * present(PPENJV)
           * positif(PPENJV)
           + positif(PPESAISITPV) * positif(PPEACV) ;
LIGPPEJC = positif_ou_nul(360 - PPENJC) * positif(INDLIGPPE) * LIG0 * LIG2
           * positif(PPENJC)
           * present(PPENJC)
           + positif(PPESAISITPC) * positif(PPEACC) ;
LIGPPEJP = positif_ou_nul(360 - PPENJP) * positif(INDLIGPPE) * LIG0 * LIG2
           * positif(PPENJP)
           * present(PPENJP)
           + positif(PPESAISITPP) * positif(PPEACP) ;

regle 1113200:
application : batch , iliad ;

LIG_REPORT = positif(LIGRNIDF + somme(i=0..5:LIGRNIDFi)
             + LIGDEFBA + LIGDRFRP + LIG3250 + LIGIRECR + LIGDRCVM 
             + LIGDLMRN + LIGBNCDF
             + somme(i=V,C,P:LIGMIBDREPi + LIGMBDREPNPi + LIGSPEDREPi + LIGSPDREPNPi)
             + LIGLOCNEUF + somme(i=1..6:LIGLOCNEUFi) 
	     + LIGPATNATR + LIGRDUFLOTOT + LIGRPINELTOT
	     + LIGRCELFD + LIGRCELFABC + LIGRCEL2012 + LIGRCELJBGL + LIGRCELJOQR + LIGRCELJP
             + LIGRCEL + LIGRCELNBGL + LIGRCELCOM + LIGRCELNQ + LIGRCELHJK + LIGRCELHNO
	     + LIGRCELHLM + LIGRRCEL1 +  LIGRRCEL2 +  LIGRRCEL3 +  LIGRRCEL4
             + LIGRCODOU
	     + LIGRCODJT + LIGRCODJU + LIGRLOCIDFG + LIGREPLOCIE + LIGNEUV + LIGRNEUV + LIGVIEU
             + LIGCOMP01
	     + LIGREPQKG + LIGREPQNH + LIGREPQUS + LIGREPQWB + LIGREPMMQE
             + LIGREPLI + LIGREPMC + LIGREPKU
	     + LIGREPLH + LIGREPMB + LIGREPKT + LIGREPQV + LIGREPQO + LIGREPQP 
	     + LIGREPQR + LIGREPQF + LIGREPQG + LIGREPQI + LIGREPPAK + LIGREPPBL
	     + LIGREPPDO + LIGREPPEK + LIGREPPFL + LIGREPPHO + LIGREPPIZ + LIGREPPJA + LIGREPPLB
	     + LIGREPTB + LIGREPPM + LIGREPPN + LIGREPPO + LIGREPPP + LIGREPPR + LIGREPPS
	     + LIGREPPT + LIGREPPU + LIGREPPW + LIGREPPX + LIGREPPY 
	     + LIGREPRG + LIGREPRI + LIGREPRM + LIGREPRC
	     + LIGREPRR + LIGREPRUP + LIGREPRVQ + LIGREPRWR + LIGREPRYT + LIGREPNW 
             + LIGREPSA + LIGREPSB + LIGREPSC + LIGREPSE + LIGREPSF + LIGREPSG + LIGREPSH
             + LIGREPSJ + LIGREPSM + LIGREPSU + LIGREPSV + LIGREPSW + LIGREPSY
             + LIGREPDOMOUT 
             + LIGPME3 + LIGPME2 + LIGPME1 + LIGPMECU
             + LIGRSN + LIGRSN2 + LIGRSN1 + LIGRSN0
             + LIGPLAFRSN + LIGPLAFRSN4 + LIGPLAFRSN3
             + LIGREPDON + LIGREPDONR + LIGREPDONR1 
             + LIGREPDONR2 + LIGREPDONR3 + LIGREPDONR4 
             + LIGREPOU + LIGREP7PA + LIGREP7PB + LIGREP7PC + LIGREP7PD + LIGREP7PE
             + LIGREPDOM + LIGREPNEUV + LIGREPCODJT + LIGREPLOCNT + LIGRESIREP + LIGREPMEU + LIGREPREPAR + LIGLOCRES
             + LIGDFRCM + LIGPME + LIGREPCORSE + LIGREPRECH + LIGREPCICE + LIGDEFPLOC
	     + LIGFOREST + LIGNFOREST + LIGREP7UP + LIGREP7UA + LIGREP7UT + LIGREP7UB)  
                 * LIG2 ;

regle 111681:
application : iliad, batch;
LIGRNIDF = positif(abs(RNIDF)) * (1 - null(4-V_REGCO)) * LIG1 * LIG2 ;
LIGRNIDF0 = positif(abs(RNIDF0)) * positif(positif(abs(RNIDF))+positif(FLAGRETARD08+FLAGDEFAUT11)) * (1 - null(4-V_REGCO)) * LIG1 * LIG2 ;
LIGRNIDF1 = positif(abs(RNIDF1)) * positif(positif(abs(RNIDF))+positif(FLAGRETARD08+FLAGDEFAUT11)) * (1 - null(4-V_REGCO)) * LIG1 * LIG2 ;
LIGRNIDF2 = positif(abs(RNIDF2)) * positif(positif(abs(RNIDF))+positif(FLAGRETARD08+FLAGDEFAUT11)) * (1 - null(4-V_REGCO)) * LIG1 * LIG2 ;
LIGRNIDF3 = positif(abs(RNIDF3)) * positif(positif(abs(RNIDF))+positif(FLAGRETARD08+FLAGDEFAUT11)) * (1 - null(4-V_REGCO)) * LIG1 * LIG2 ;
LIGRNIDF4 = positif(abs(RNIDF4)) * positif(positif(abs(RNIDF))+positif(FLAGRETARD08+FLAGDEFAUT11)) * (1 - null(4-V_REGCO)) * LIG1 * LIG2 ;
LIGRNIDF5 = positif(abs(RNIDF5)) * positif(positif(abs(RNIDF))+positif(FLAGRETARD08+FLAGDEFAUT11)) * (1 - null(4-V_REGCO)) * LIG1 * LIG2 ;

regle 1113250:
application : batch, iliad ;

LIG3250 = positif(DALNP) * LIG1  * LIG2 ;

regle 111030:
application : iliad,batch;
LIGLOCNEUF = positif(REPINV) * LIG1;
LIGLOCNEUF1 = positif(RIVL1) * LIG1;
LIGLOCNEUF2 = positif(RIVL2) * LIG1;
LIGLOCNEUF3 = positif(RIVL3) * LIG1;
LIGLOCNEUF4 = positif(RIVL4) * LIG1;
LIGLOCNEUF5 = positif(RIVL5) * LIG1;
LIGLOCNEUF6 = positif(RIVL6) * LIG1;
LIGLOCRES = positif(REPINVRES) * LIG1;
LIGLOCRES1 = positif(RIVL1RES) * LIG1;
LIGLOCRES2 = positif(RIVL2RES) * LIG1;
LIGLOCRES3 = positif(RIVL3RES) * LIG1;
LIGLOCRES4 = positif(RIVL4RES) * LIG1;
LIGLOCRES5 = positif(RIVL5RES) * LIG1;

regle 111386:
application : iliad, batch;

LIGDUFI = positif(DUFLOFI) * LIG1 * LIG2 ;
LIGDUFLOGIH = positif(DDUFLOGIH) * LIG1 * LIG2 ;
LIGDUFLOEKL = positif(DDUFLOEKL) * LIG1 * LIG2 ;
LIGPIQABCD = positif(DPIQABCD) * LIG1 * LIG2 ;
LIGDUFLOT = LIGDUFI + LIGDUFLOGIH + LIGDUFLOEKL ;
LIGPINEL = LIGPIQABCD ;
regle 111387:
application : iliad, batch;

LIGRDUEKL = positif(RIVDUEKL) * LIG1 * LIG2 ;
LIGRPIQBD = positif(RIVPIQBD) * LIG1 * LIG2 ;
LIGRPIQAC = positif(RIVPIQAC) * LIG1 * LIG2 ;
LIGRDUGIH = positif(RIVDUGIH) * LIG1 * LIG2 ;
LIGRDUFLOTOT = LIGRDUEKL + LIGRDUGIH ;
LIGRPINELTOT = LIGRPIQBD + LIGRPIQAC ;
regle 111388:
application : iliad, batch;

LIGCELLA = positif(DCELRREDLA) * LIG1 * LIG2 ;

LIGCELLB = positif(DCELRREDLB) * LIG1 * LIG2 ;

LIGCELLE = positif(DCELRREDLE) * LIG1 * LIG2 ;

LIGCELLM = positif(DCELRREDLM) * LIG1 * LIG2 ;

LIGCELLN = positif(DCELRREDLN) * LIG1 * LIG2 ;

LIGCELLC = positif(DCELRREDLC) * LIG1 * LIG2 ;

LIGCELLD = positif(DCELRREDLD) * LIG1 * LIG2 ;

LIGCELLS = positif(DCELRREDLS) * LIG1 * LIG2 ;

LIGCELLT = positif(DCELRREDLT) * LIG1 * LIG2 ;

LIGCELLF = positif(DCELRREDLF) * LIG1 * LIG2 ;

LIGCELLZ = positif(DCELRREDLZ) * LIG1 * LIG2 ;

LIGCELLX = positif(DCELRREDLX) * LIG1 * LIG2 ;

LIGCELMG = positif(DCELRREDMG) * LIG1 * LIG2 ;

LIGCELMH = positif(DCELRREDMH) * LIG1 * LIG2 ;

LIGCELHS = positif(DCELREPHS) * LIG1 * LIG2 ;

LIGCELHR = positif(DCELREPHR) * LIG1 * LIG2 ;

LIGCELHU = positif(DCELREPHU) * LIG1 * LIG2 ;

LIGCELHT = positif(DCELREPHT) * LIG1 * LIG2 ;

LIGCELHZ = positif(DCELREPHZ) * LIG1 * LIG2 ;

LIGCELHX = positif(DCELREPHX) * LIG1 * LIG2 ;

LIGCELHW = positif(DCELREPHW) * LIG1 * LIG2 ;

LIGCELHV = positif(DCELREPHV) * LIG1 * LIG2 ;

LIGCELHF = positif(DCELREPHF) * LIG1 * LIG2 ;

LIGCELHE = positif(DCELREPHE) * LIG1 * LIG2 ;

LIGCELHD = positif(DCELREPHD) * LIG1 * LIG2 ;

LIGCELHH = positif(DCELREPHH) * LIG1 * LIG2 ;

LIGCELHG = positif(DCELREPHG) * LIG1 * LIG2 ;

LIGCELHB = positif(DCELREPHB) * LIG1 * LIG2 ;

LIGCELHA = positif(DCELREPHA) * LIG1 * LIG2 ;

LIGCELGU = positif(DCELREPGU) * LIG1 * LIG2 ;

LIGCELGX = positif(DCELREPGX) * LIG1 * LIG2 ;

LIGCELGT = positif(DCELREPGT) * LIG1 * LIG2 ;

LIGCELGS = positif(DCELREPGS) * LIG1 * LIG2 ;

LIGCELGW = positif(DCELREPGW) * LIG1 * LIG2 ;

LIGCELGP = positif(DCELREPGP) * LIG1 * LIG2 ;

LIGCELGL = positif(DCELREPGL) * LIG1 * LIG2 ;

LIGCELGV = positif(DCELREPGV) * LIG1 * LIG2 ;

LIGCELGK = positif(DCELREPGK) * LIG1 * LIG2 ;

LIGCELGJ = positif(DCELREPGJ) * LIG1 * LIG2 ;

LIGCELYH = positif(DCELREPYH) * LIG1 * LIG2 ;

LIGCELYL = positif(DCELREPYL) * LIG1 * LIG2 ;

LIGCELYG = positif(DCELREPYG) * LIG1 * LIG2 ;

LIGCELYF = positif(DCELREPYF) * LIG1 * LIG2 ;

LIGCELYK = positif(DCELREPYK) * LIG1 * LIG2 ;

LIGCELYE = positif(DCELREPYE) * LIG1 * LIG2 ;

LIGCELYD = positif(DCELREPYD) * LIG1 * LIG2 ;

LIGCELYJ = positif(DCELREPYJ) * LIG1 * LIG2 ;

LIGCELYC = positif(DCELREPYC) * LIG1 * LIG2 ;

LIGCELYB = positif(DCELREPYB) * LIG1 * LIG2 ;

LIGCELYI = positif(DCELREPYI) * LIG1 * LIG2 ;

LIGCELYA = positif(DCELREPYA) * LIG1 * LIG2 ;

LIGCELHM = positif(DCELHM) * LIG1 * LIG2 ;

LIGCELHL = positif(DCELHL) * LIG1 * LIG2 ;

LIGCELHNO = positif(DCELHNO) * LIG1 * LIG2 ;

LIGCELHJK = positif(DCELHJK) * LIG1 * LIG2 ;

LIGCELNQ = positif(DCELNQ) * LIG1 * LIG2 ; 

LIGCELNBGL = positif(DCELNBGL) * LIG1 * LIG2 ; 

LIGCELCOM = positif(DCELCOM) * LIG1 * LIG2 ; 

LIGCEL = positif(DCEL) * LIG1 * LIG2 ; 

LIGCELJP = positif(DCELJP) * LIG1 * LIG2 ; 

LIGCELJBGL = positif(DCELJBGL) * LIG1 * LIG2 ; 

LIGCELJOQR = positif(DCELJOQR) * LIG1 * LIG2 ; 

LIGCEL2012 = positif(DCEL2012) * LIG1 * LIG2 ; 

LIGCELFD = positif(DCELFD) * LIG1 * LIG2 ;

LIGCELFABC = positif(DCELFABC) * LIG1 * LIG2 ;

regle 1113882:
application : iliad,batch;

LIGRCEL =  positif(RIVCEL1) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIGRCELNBGL =  positif(RIVCELNBGL1) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIGRCELCOM =  positif(RIVCELCOM1) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIGRCELNQ =  positif(RIVCELNQ1) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIGRCELHJK =  positif(RIVCELHJK1) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIGRCELHNO =  positif(RIVCELHNO1) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIGRCELHLM =  positif(RIVCELHLM1) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIGRCELJP =  positif(RIVCELJP1) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIGRCELJOQR =  positif(RIVCELJOQR1) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIGRCELJBGL =  positif(RIVCELJBGL1) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIGRCEL2012 = positif(RIV2012CEL1) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIGRCELFABC =  positif(RIVCELFABC1) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIGRCELFD =  positif(RIVCELFD1) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;


LIGRRCEL1 = positif(RRCELMG + RRCELMH + RRCEL2012) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;
LIGRRCEL11 = positif(RRCELMG) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;
LIGRRCEL12 = positif(RRCELMH) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;
LIGRRCEL13 = positif(RRCEL2012) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIGRRCEL2 = positif(RRCEL2011 + RRCELLF + RRCELLZ + RRCELLX) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;
LIGRRCEL21 = positif(RRCELLF) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;
LIGRRCEL22 = positif(RRCELLZ) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;
LIGRRCEL23 = positif(RRCELLX) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;
LIGRRCEL24 = positif(RRCEL2011) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIGRRCEL3 = positif(RRCEL2010 + RRCELLC + RRCELLD + RRCELLS + RRCELLT) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;
LIGRRCEL31 = positif(RRCELLC) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;
LIGRRCEL32 = positif(RRCELLD) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;
LIGRRCEL33 = positif(RRCELLS) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;
LIGRRCEL34 = positif(RRCELLT) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;
LIGRRCEL35 = positif(RRCEL2010) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIGRRCEL4 = positif(RRCEL2009 + RRCELLA + RRCELLB + RRCELLE + RRCELLM + RRCELLN) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;
LIGRRCEL41 = positif(RRCELLA) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;
LIGRRCEL42 = positif(RRCELLB) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;
LIGRRCEL43 = positif(RRCELLE) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;
LIGRRCEL44 = positif(RRCELLM) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;
LIGRRCEL45 = positif(RRCELLN) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;
LIGRRCEL46 = positif(RRCEL2009) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

regle 111389:
application : iliad,batch;
LIGPATNAT1 = LIG1 * LIG2 * (positif(PATNAT1) + null(PATNAT1) * positif(V_NOTRAIT - 20)) ;
LIGPATNAT2 = LIG1 * LIG2 * (positif(PATNAT2) + null(PATNAT2) * positif(V_NOTRAIT - 20)) ;
LIGPATNAT3 = LIG1 * LIG2 * (positif(PATNAT3) + null(PATNAT3) * positif(V_NOTRAIT - 20)) ;
LIGPATNAT4 = LIG1 * LIG2 * (positif(PATNAT4) + null(PATNAT4) * positif(V_NOTRAIT - 20)) ;

LIGPATNATR = positif(REPNATR + REPNATR1 + REPNATR2 + REPNATR3) * LIG1 ; 
LIGNATR1 = positif(REPNATR1) * LIG1 ; 
LIGNATR2 = positif(REPNATR2) * LIG1 ; 
LIGNATR3 = positif(REPNATR3) * LIG1 ; 
LIGNATR = positif(REPNATR) * LIG1 ; 
regle 111031:
application : iliad, batch ;

LIGREPKI = positif(REPKI) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPQK = positif(REPQK) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPQX = positif(REPQX) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPRD = positif(REPRD) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPXE = positif(REPXE) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPQKG = positif(REPKI + REPQK + REPQX + REPRD + REPXE) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPKH = positif(REPKH) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPQN = positif(REPQN) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPQJ = positif(REPQJ) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPQNH = positif(REPQJ + REPQN + REPKH) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPQU = positif(REPQU) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPQS = positif(REPQS) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPRA = positif(REPRA) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPXA = positif(REPXA) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPQUS = positif(REPQS + REPQU + REPRA + REPXA) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPQW = positif(REPQW) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPRB = positif(REPRB) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPXB = positif(REPXB) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPQWB = positif(REPQW + REPRB + REPXB) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPRC = positif(REPRC) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPXC = positif(REPXC) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPRXC = positif(REPRC + REPXC) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPMN = positif(REPMN) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPQE = positif(REPQE) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPRJ = positif(REPRJ) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPMMQE = positif(REPRJ + REPMN + REPQE) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPLI = positif(REPLI) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPMC = positif(REPMC) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPKU = positif(REPKU) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPLH = positif(REPLH) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPMB = positif(REPMB) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPKT = positif(REPKT) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPQV = positif(REPQV) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPQO = positif(REPQO) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPQP = positif(REPQP) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPQR = positif(REPQR) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPQF = positif(REPQF) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPQG = positif(REPQG) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPQI = positif(REPQI) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPPA = positif(REPPA) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPRK = positif(REPRK) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPPAK = positif(REPPA + REPRK) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPPB = positif(REPPB) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPRL = positif(REPRL) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPPBL = positif(REPPB + REPRL) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPPD = positif(REPPD) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPRO = positif(REPRO) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPPDO = positif(REPPD + REPRO) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPPE = positif(REPPE) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPRP = positif(REPRP) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPSK = positif(REPSK) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPAK = positif(REPAK) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPPEK = positif(REPPE + REPRP + REPSK + REPAK) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPPF = positif(REPPF) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPRQ = positif(REPRQ) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPSL = positif(REPSL) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPAL = positif(REPAL) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPPFL = positif(REPPF + REPRQ + REPSL + REPAL) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPPH = positif(REPPH) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPRT = positif(REPRT) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPSO = positif(REPSO) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPAO = positif(REPAO) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPPHO = positif(REPPH + REPRT + REPSO + REPAO) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPPI = positif(REPPI) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPNU = positif(REPNU) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPSZ = positif(REPSZ) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPBA = positif(REPBA) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPPIZ = positif(REPPI + REPNU + REPSZ + REPBA) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPPJ = positif(REPPJ) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPNV = positif(REPNV) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPTA = positif(REPTA) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPBB = positif(REPBB) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPPJA = positif(REPPJ + REPNV + REPTA + REPBB) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPPL = positif(REPPL) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPNY = positif(REPNY) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPTD = positif(REPTD) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPBG = positif(REPBG) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPPLB = positif(REPPL + REPNY + REPTD + REPBG) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPTB = positif(REPTB) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPBE = positif(REPBE) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPTBE = positif(REPTB + REPBE) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPPM = positif(REPPM) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPPN = positif(REPPN) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPPO = positif(REPPO) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPPP = positif(REPPP) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPPR = positif(REPPR) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPPS = positif(REPPS) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPPT = positif(REPPT) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPPU = positif(REPPU) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPPW = positif(REPPW) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPPX = positif(REPPX) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPPY = positif(REPPY) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPRG = positif(REPRG) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPRI = positif(REPRI) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPRM = positif(REPRM) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPRR = positif(REPRR) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPRU = positif(REPRU) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPSP = positif(REPSP) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPAP = positif(REPAP) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPRUP = positif(REPRU + REPSP + REPAP) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPRV = positif(REPRV) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPSQ = positif(REPSQ) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPAQ = positif(REPAQ) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPRVQ = positif(REPRV + REPSQ + REPAQ) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPRW = positif(REPRW) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPSR = positif(REPSR) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPHAR = positif(REPHAR) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPRWR = positif(REPRW + REPSR + REPHAR) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPRY = positif(REPRY) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPST = positif(REPST) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPAT = positif(REPAT) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPRYT = positif(REPRY + REPST + REPAT) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPNW = positif(REPNW) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPSA = positif(REPSA) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPAA = positif(REPAA) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPSAA = positif(REPSA + REPAA) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPSB = positif(REPSB) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPAB = positif(REPAB) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPSAB = positif(REPSB + REPAB) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPSC = positif(REPSC) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPAC = positif(REPAC) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPSAC = positif(REPSC + REPAC) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPSE = positif(REPSE) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPAE = positif(REPAE) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPSAE = positif(REPSE + REPAE) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPSF = positif(REPSF) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPAF = positif(REPAF) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPSAF = positif(REPSF + REPAF) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPSG = positif(REPSG) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPAG = positif(REPAG) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPSAG = positif(REPSG + REPAG) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPSH = positif(REPSH) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPAH = positif(REPAH) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPSAH = positif(REPSH + REPAH) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPSJ = positif(REPSJ) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPAJ = positif(REPAJ) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPSAJ = positif(REPSJ + REPAJ) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPSM = positif(REPSM) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPAM = positif(REPAM) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPSAM = positif(REPSM + REPAM) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPSU = positif(REPSU) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPAU = positif(REPAU) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPSAU = positif(REPSU + REPAU) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPSV = positif(REPSV) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPAV = positif(REPAV) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPSAV = positif(REPSV + REPAV) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPSW = positif(REPSW) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPAW = positif(REPAW) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPSAW = positif(REPSW + REPAW) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPSY = positif(REPSY) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPAY = positif(REPAY) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPSAY = positif(REPSY + REPAY) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;


LIGREPDOMOUT = positif(REPOMENTR3) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGREPDON = positif(REPDONR + REPDONR1 + REPDONR2 + REPDONR3 + REPDONR4) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPDONR1 = positif(REPDONR1) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPDONR2 = positif(REPDONR2) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPDONR3 = positif(REPDONR3) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPDONR4 = positif(REPDONR4) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPDONR = positif(REPDONR) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGREPDOM = positif(REPDOMENTR) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGRIDOMPRO = positif(RIDOMPRO) * LIG1 ;

LIGPME1 = positif(REPINVPME1) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGPME2 = positif(REPINVPME2) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGPME3 = positif(REPINVPME3) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGPMECU = positif(REPINVPMECU) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGRSN = positif(RINVTPME12 + RINVTPME13 + RINVTPME14) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGRSN2 = positif(RINVTPME12) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGRSN1 = positif(RINVTPME13) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGRSN0 = positif(RINVTPME14) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGPLAFRSN = positif(PLAFREPSN4+PLAFREPSN3) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGPLAFRSN4= positif(PLAFREPSN4) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;
LIGPLAFRSN3= positif(PLAFREPSN3) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 ;

LIGFOREST = positif(REPFOREST2 + REPFOREST3 + REPEST) * LIG1 * LIG2 * (1 - V_CNR) ;
LIGREPFOR2 = positif(REPFOREST2) * LIG1 * LIG2 * (1 - V_CNR) ;
LIGREPFOR3 = positif(REPFOREST3) * LIG1 * LIG2 * (1 - V_CNR) ;
LIGREPEST = positif(REPEST) * LIG1 * LIG2 * (1 - V_CNR) ;

regle 11101:
application : batch , iliad ;

EXOVOUS = present ( TSASSUV ) 
          + positif ( XETRANV )
          + positif ( EXOCETV ) 
          + present ( FEXV ) 
          + positif ( MIBEXV ) 
          + positif ( MIBNPEXV ) 
          + positif ( BNCPROEXV ) 
          + positif ( XSPENPV ) 
          + positif ( XBAV ) 
          + positif ( XBIPV ) 
          + positif ( XBINPV ) 
          + positif ( XBNV ) 
          + positif ( XBNNPV ) 
          + positif ( ABICPDECV ) * ( 1 - V_CNR )
          + positif ( ABNCPDECV ) * ( 1 - V_CNR )
          + positif ( HONODECV ) * ( 1 - V_CNR )
          + positif ( AGRIV )
          + positif ( BIPERPV ) 
          + positif ( BNCCREAV ) 
          ;

EXOCJT = present ( TSASSUC ) 
         + positif ( XETRANC )
         + positif ( EXOCETC ) 
         + present ( FEXC ) 
         + positif ( MIBEXC ) 
         + positif ( MIBNPEXC ) 
         + positif ( BNCPROEXC ) 
         + positif ( XSPENPC ) 
         + positif ( XBAC ) 
         + positif ( XBIPC ) 
         + positif ( XBINPC ) 
         + positif ( XBNC ) 
         + positif ( XBNNPC ) 
         + positif ( ABICPDECC ) * ( 1 - V_CNR )
         + positif ( ABNCPDECC ) * ( 1 - V_CNR )
         + positif ( HONODECC ) * ( 1 - V_CNR )
         + positif ( AGRIC )
         + positif ( BIPERPC ) 
         + positif ( BNCCREAC ) 
         ;

EXOPAC = present ( FEXP ) 
         + positif ( MIBEXP ) 
         + positif ( MIBNPEXP ) 
         + positif ( BNCPROEXP ) 
         + positif ( XSPENPP ) 
         + positif ( XBAP ) 
         + positif ( XBIPP ) 
         + positif ( XBINPP ) 
         + positif ( XBNP ) 
         + positif ( XBNNPP ) 
         + positif ( ABICPDECP ) * ( 1 - V_CNR )
         + positif ( ABNCPDECP ) * ( 1 - V_CNR )
         + positif ( HONODECP ) * ( 1 - V_CNR )
         + positif ( AGRIP )
         + positif ( BIPERPP ) 
         + positif ( BNCCREAP ) 
         ;

regle 11102:
application : batch , iliad ;

LIGTITREXVCP = positif(EXOVOUS)
               * positif(EXOCJT)
               * positif(EXOPAC)
	       * (1 - positif(LIG2501))
               * LIG1 * LIG2 ;

LIGTITREXV = positif(EXOVOUS)
             * (1 - positif(EXOCJT))
             * (1 - positif(EXOPAC))
	     * (1 - positif(LIG2501))
             * LIG1 * LIG2 ;

LIGTITREXC =  (1 - positif(EXOVOUS))
               * positif(EXOCJT)
               * (1 - positif(EXOPAC))
	       * (1 - positif(LIG2501))
               * LIG1 * LIG2 ;

LIGTITREXP =  (1 - positif(EXOVOUS))
               * (1 - positif(EXOCJT))
               * positif(EXOPAC)
	       * (1 - positif(LIG2501))
               * LIG1 * LIG2 ;

LIGTITREXVC =  positif(EXOVOUS)
               * positif(EXOCJT)
               * (1 - positif(EXOPAC))
	       * (1 - positif(LIG2501))
               * LIG1 * LIG2 ;

LIGTITREXVP =  positif(EXOVOUS)
               * (1 - positif(EXOCJT))
               * positif(EXOPAC)
	       * (1 - positif(LIG2501))
               * LIG1 * LIG2 ;

LIGTITREXCP =  (1 - positif(EXOVOUS))
               * positif(EXOCJT) 
               * positif(EXOPAC)
	       * (1 - positif(LIG2501))
               * LIG1 * LIG2 ;

regle 11103:
application : batch , iliad ;

EXOCET = EXOCETC + EXOCETV ;
LIGEXOCET = positif(EXOCET) * LIG1 * LIG2 ;

LIGMXBIP =  positif(MIBEXV + MIBEXC + MIBEXP) * LIG1 * LIG2 ;
LIGMXBINP =  positif(MIBNPEXV + MIBNPEXC + MIBNPEXP) * LIG1 * LIG2 ;
LIGSXBN =  positif(BNCPROEXV + BNCPROEXC + BNCPROEXP) * LIG1 * LIG2 ;
LIGXSPEN =  positif(XSPENPV + XSPENPC + XSPENPP) * LIG1 * LIG2 ;
LIGXBIP =  positif(XBIPV + XBIPC + XBIPP) * LIG1 * LIG2 ;
LIGXBINP =  positif(XBINPV + XBINPC + XBINPP) * LIG1 * LIG2 ;
LIGXBP =  positif(XBNV + XBNC + XBNP) * LIG1 * LIG2 ;
LIGXBN =  positif(XBNNPV + XBNNPC + XBNNPP) * LIG1 * LIG2 ;

LIGXTSA =  positif(present(TSASSUV) + present(TSASSUC)) * LIG1 * LIG2 ;
LIGXIMPA =  positif(XETRANV + XETRANC) * LIG1 * LIG2 ;
LIGXFORF =  positif(present(FEXV) + present(FEXC) + present(FEXP)) * LIG1 * LIG2 ;
LIGXBA =  positif(XBAV + XBAC + XBAP) * LIG1 * LIG2 ;

LIGBICAP = positif(ABICPDECV + ABICPDECC + ABICPDECP) * LIG1 * (1 - positif(null(2-V_REGCO) + null(4-V_REGCO))) * LIG2 ;
LIGBNCAP = positif(ABNCPDECV + ABNCPDECC + ABNCPDECP) * LIG1 * (1 - positif(null(2-V_REGCO) + null(4-V_REGCO))) * LIG2 ;
LIGHONO = positif(HONODECV + HONODECC + HONODECP) * LIG1 * (1 - positif(null(2-V_REGCO) + null(4-V_REGCO))) * LIG2 ;

LIGBAPERP =  positif(BAPERPV + BAPERPC + BAPERPP + BANOCGAV + BANOCGAC + BANOCGAP) * LIG1 * LIG2 ;
LIGBIPERP =  positif(BIPERPV + BIPERPC + BIPERPP) * LIG1 * LIG2 ;
LIGBNCCREA =  positif(BNCCREAV + BNCCREAC + BNCCREAP) * LIG1 * LIG2 ;

regle 11105:
application : batch , iliad ;

LIGPERP = (1 - positif(PERPIMPATRIE+0))
                 * positif(PERPINDV + PERPINDC + PERPINDP
                        + PERPINDCV + PERPINDCC + PERPINDCP)
                 * positif(PERPINDAFFV+PERPINDAFFC+PERPINDAFFP)
                  * (1 - null(PERP_COTV + PERP_COTC + PERP_COTP + 0) * (1 - INDIMPOS))
                  * (1 - positif(PERP_COND1+PERP_COND2))
                  * (1 - positif(LIG8FV))
                  * (1 - positif(LIG2501))
                  * LIG1 * (1-V_CNR) * LIG2
                  +0
                  ;
LIGPERPI = positif(PERPIMPATRIE+0)
                 * positif(PERPINDV + PERPINDC + PERPINDP
                        + PERPINDCV + PERPINDCC + PERPINDCP)
                 * positif(PERPINDAFFV+PERPINDAFFC+PERPINDAFFP)
                  * (1 - null(PERP_COTV + PERP_COTC + PERP_COTP + 0) * (1 - INDIMPOS))
                  * (1 - positif(PERP_COND1+PERP_COND2))
                  * (1 - positif(LIG8FV))
                  * (1 - positif(LIG2501))
                  * LIG1 * (1-V_CNR) * LIG2
                  +0
                  ;
LIGPERPM = (1 - positif(PERPIMPATRIE+0))
                 * positif(PERPINDV + PERPINDC + PERPINDP
                        + PERPINDCV + PERPINDCC + PERPINDCP)
                 * positif(PERPINDAFFV+PERPINDAFFC+PERPINDAFFP)
                  * (1 - null(PERP_COTV + PERP_COTC + PERP_COTP + 0) * (1 - INDIMPOS))
                  * positif(PERP_MUT)
                  * positif(PERP_COND1+PERP_COND2)
                  * (1 - positif(LIG8FV))
                  * (1 - positif(LIG2501))
                  * LIG1 * (1-V_CNR) * LIG2
                  +0
                  ;
LIGPERPMI = positif(PERPIMPATRIE+0)
                 * positif(PERPINDV + PERPINDC + PERPINDP
                        + PERPINDCV + PERPINDCC + PERPINDCP)
                 * positif(PERPINDAFFV+PERPINDAFFC+PERPINDAFFP)
                  * (1 - null(PERP_COTV + PERP_COTC + PERP_COTP + 0) * (1 - INDIMPOS))
                  * positif(PERP_MUT)
                  * positif(PERP_COND1+PERP_COND2)
                  * (1 - positif(LIG8FV))
                  * (1 - positif(LIG2501))
                  * LIG1 * (1-V_CNR) * LIG2
                  +0
                  ;

LIGPERPFAM = positif(PERPINDV + PERPINDCV) * positif(PERPINDAFFV)
              * positif(PERPINDC + PERPINDCC)* positif(PERPINDAFFC)
              * positif(PERPINDP + PERPINDCP) * positif(PERPINDAFFP)
              * LIG1 * (1-V_CNR) * LIG2
              * positif(LIGPERP + LIGPERPI + LIGPERPM + LIGPERPMI)
              ;

LIGPERPV = positif(PERPINDV + PERPINDCV) * positif(PERPINDAFFV)
           * (1 - positif(PERPINDC + PERPINDCC) * positif(PERPINDAFFC))
           * (1 - positif(PERPINDP + PERPINDCP) * positif(PERPINDAFFP))
           * LIG1 * (1-V_CNR) * LIG2
           * positif(LIGPERP + LIGPERPI + LIGPERPM + LIGPERPMI)
           ;

LIGPERPC = positif(PERPINDC + PERPINDCC) * positif(PERPINDAFFC)
          * (1 - positif(PERPINDV + PERPINDCV) * positif(PERPINDAFFV))
          * (1 - positif(PERPINDP + PERPINDCP) * positif(PERPINDAFFP))
          * LIG1 * (1-V_CNR) * LIG2
          * positif(LIGPERP + LIGPERPI + LIGPERPM + LIGPERPMI)
          ;

LIGPERPP = positif(PERPINDP + PERPINDCP) * positif(PERPINDAFFP)
           * (1 - positif(PERPINDV + PERPINDCV) * positif(PERPINDAFFV))
           * (1 - positif(PERPINDC + PERPINDCC) * positif(PERPINDAFFC))
           * LIG1 * (1-V_CNR) * LIG2
           * positif(LIGPERP + LIGPERPI + LIGPERPM + LIGPERPMI)
           ;

LIGPERPCP = positif(PERPINDP + PERPINDCP) * positif(PERPINDAFFP)
           * positif(PERPINDC + PERPINDCC) * positif(PERPINDAFFV)
           * (1 - positif(PERPINDV + PERPINDCV) * positif(PERPINDAFFV))
           * LIG1 * (1-V_CNR) * LIG2
           * positif(LIGPERP + LIGPERPI + LIGPERPM + LIGPERPMI)
           ;

LIGPERPVP = positif(PERPINDP + PERPINDCP) * positif(PERPINDAFFP)
           * positif(PERPINDV + PERPINDCV) * positif(PERPINDAFFV)
           * (1 - positif(PERPINDC + PERPINDCC) * positif(PERPINDAFFC))
           * LIG1 * (1-V_CNR) * LIG2
           * positif(LIGPERP + LIGPERPI + LIGPERPM + LIGPERPMI)
           ;

LIGPERPMAR = positif(PERPINDV + PERPINDCV)  * positif(PERPINDAFFV)
             * positif(PERPINDC + PERPINDCC)  * positif(PERPINDAFFC)
             * (1 - positif(PERPINDP + PERPINDCP) * positif(PERPINDAFFP))
             * LIG1 * (1-V_CNR) * LIG2
             * positif(LIGPERP + LIGPERPI + LIGPERPM + LIGPERPMI)
             ;


regle 117010:
application : batch, iliad;

ZIG_TITRECRP = positif(BCSG + V_CSANT) * positif(BRDS + V_RDANT) * positif(BPRS + V_PSANT) * (1 - positif(BCVNSAL + V_CVNANT))
                                       * (1 - (V_CNR * (1 - positif(ZIG_RF + max(0, NPLOCNETSF))))) * LIG2 ;

ZIGTITRECRPS = positif(BCSG + V_CSANT) * positif(BRDS + V_RDANT) * positif(BPRS + V_PSANT) * positif(BCVNSAL + V_CVNANT)
                                       * (1 - (V_CNR * (1 - positif(ZIG_RF + max(0, NPLOCNETSF))))) * LIG2 ;

ZIGTITRECRS = positif(BCSG + V_CSANT) * positif(BRDS + V_RDANT) * positif(BCVNSAL + V_CVNANT) * (1 - positif(BPRS + V_PSANT))
                * (1 - V_CNR) * LIG2 ;

ZIGTITRERS = (1 - positif(BCSG + V_CSANT)) * positif(BRDS + V_RDANT) * (1 - positif(BPRS + V_PSANT)) * positif(BCVNSAL + V_CVNANT)
              * (1 - V_CNR) * LIG2 ;

ZIG_TITRECR = positif(BCSG + V_CSANT) * positif(BRDS + V_RDANT) * (1 - positif(BPRS + V_PSANT)) * (1 - positif(BCVNSAL + V_CVNANT))
              * (1 - V_CNR) * LIG2 ;

ZIG_TITRECP = positif(BCSG + V_CSANT) * (1 - positif(BRDS + V_RDANT)) * positif(BPRS + V_PSANT) * (1 - positif(BCVNSAL + V_CVNANT))
               * (1 - V_CNR) * LIG2 ;

ZIG_TITRERP = (1 - positif(BCSG + V_CSANT)) * positif(BRDS + V_RDANT) * positif(BPRS + V_PSANT) * (1 - positif(BCVNSAL + V_CVNANT))
               * (1 - V_CNR) * LIG2 ;

ZIG_TITREC = positif(BCSG + V_CSANT) * (1 - positif(BRDS + V_RDANT)) * (1 - positif(BPRS + V_PSANT)) * (1 - positif(BCVNSAL + V_CVNANT)) 
              * (1 - V_CNR) * LIG2 ;

ZIG_TITRER = positif(BRDS + V_RDANT) * (1 - positif(BCSG + V_CSANT)) * (1 - positif(BPRS + V_PSANT)) * (1 - positif(BCVNSAL + V_CVNANT))
              * (1 - V_CNR) * LIG2 ;

ZIGTITRES = positif(BCVNSAL + V_CVNANT) * (1 - positif(BRDS + V_RDANT)) * (1 - positif(BCSG + V_CSANT)) * (1 - positif(BPRS + V_PSANT))
             * LIG2 ;

ZIG_TITREPN = positif(BPRS + V_PSANT) * (1 - V_CNR) * LIG2 ;

regle 117030:
application : batch, iliad ;

ZIGTITRE = positif((positif(BCSG + V_CSANT + BRDS + V_RDANT + BPRS + V_PSANT) * (1 - (V_CNR * (1 - positif(ZIG_RF+max(0,NPLOCNETSF))))) 
		       + positif (BCVNSAL + V_CVNANT + BCDIS + V_CDISANT))
		      * TYPE4) * (1 - positif(ANNUL2042)) ;

ZIGBASECS1 = positif(BCSG + V_CSANT) * positif(INDCTX) ;
ZIGBASERD1 = positif(BRDS + V_RDANT) * positif(INDCTX) ;
ZIGBASEPS1 = positif(BPRS + V_PSANT) * positif(INDCTX) ;
ZIGBASESAL1 = positif(BCVNSAL + V_CVNANT) * positif(INDCTX) ;

regle 117080:
application : batch, iliad;

CS_RVT = RDRV ;
RD_RVT = CS_RVT;
PS_RVT = CS_RVT;
IND_ZIGRVT =  0;

ZIG_RVTO = positif (CS_RVT + RD_RVT + PS_RVT + IND_ZIGRVT)
                   * (1 - V_CNR) * (1 - positif(ANNUL2042)) * LIG1 * LIG2 * null(3 - INDIRPS) ;
regle 117100:
application : batch, iliad;

CS_RCM =  RDRCM;
RD_RCM = CS_RCM;
PS_RCM = CS_RCM;
IND_ZIGRCM = positif(present(RCMABD) + present(RCMAV) + present(RCMHAD) + present(RCMHAB)  
                     + present(RCMTNC) + present(RCMAVFT) + present(REGPRIV)) 
	      * positif(V_NOTRAIT - 20) ;

ZIG_RCM = positif(CS_RCM + RD_RCM + PS_RCM + IND_ZIGRCM)
                   * (1 - V_CNR) * (1 - positif(ANNUL2042)) * LIG1 * LIG2 * null(3 - INDIRPS) ;
regle 117105:
application : batch, iliad;
CS_REVCS = RDNP ;
RD_REVCS = CS_REVCS;
PS_REVCS = CS_REVCS;
IND_ZIGPROF = positif(V_NOTRAIT - 20) * positif( present(RCSV)
                     +present(RCSC)
                     +present(RCSP));
ZIG_PROF = positif(CS_REVCS+RD_REVCS+PS_REVCS+IND_ZIGPROF)
           * (1 - positif(ANNUL2042)) * LIG1 * null(3 - INDIRPS) ;

regle 117110:
application : batch, iliad;

CS_RFG = RDRFPS ;
RD_RFG = CS_RFG;
PS_RFG = CS_RFG;
IND_ZIGRFG = positif(V_NOTRAIT - 20) * positif( present(RFORDI)
                     +present(RFDORD)
                     +present(RFDHIS)
                     +present(RFMIC) );

ZIG_RF = positif(CS_RFG + RD_RFG + PS_RFG + IND_ZIGRFG) * (1 - null(4 - V_REGCO)) * (1 - positif(ANNUL2042)) * LIG1 * LIG2 * null(3 - INDIRPS) ;
regle 117181:
application :batch,  iliad;

CS_RTF = RDPTP + RDNCP ;
RD_RTF = CS_RTF ;
PS_RTF = CS_RTF ;
IND_ZIGRTF=  positif(V_NOTRAIT - 20) * positif (present (PEA) + present( BPCOPTV ) + present( BPVRCM )) ;

ZIG_RTF = positif (CS_RTF + RD_RTF + PS_RTF + IND_ZIGRTF)
                   * (1 - V_CNR) * (1 - positif(ANNUL2042)) * LIG1 * LIG2 * null(3 - INDIRPS) ;

ZIGGAINLEV = positif(CVNSALC)*positif(CVNSALAV + CVNSALAC) * LIG1 * LIG2 ;
regle 117190:
application : batch, iliad;

CS_REVETRANG = 0 ;
RD_REVETRANG = SALECS + SALECSG + ALLECS + INDECS + PENECS + COD8SA + COD8SB ;
PS_REVETRANG = 0 ;


ZIG_REVETR = positif(SALECS + SALECSG + ALLECS + INDECS + PENECS + COD8SA +COD8SB )
                   * (1 - V_CNR) * LIG1 * LIG2 ;

regle 117200:
application : batch, iliad;

CS_RVORIGND =   ESFP;
RD_RVORIGND =   ESFP;
PS_RVORIGND =   ESFP;
IND_ZIGREVORIGIND = present(ESFP) ;

ZIG_RVORIGND = positif (CS_RVORIGND + RD_RVORIGND + PS_RVORIGND
                         + IND_ZIGREVORIGIND)
                   * (1 - V_CNR) * LIG1 * LIG2 ;
regle 117205:
application : batch, iliad ;

CS_RE168 = RE168 ;
RD_RE168 = RE168 ;
PS_RE168 = RE168 ;

CS_TAX1649 = TAX1649 ;
RD_TAX1649 = TAX1649 ;
PS_TAX1649 = TAX1649 ;

CS_R1649 = R1649 ;
RD_R1649 = R1649 ;
PS_R1649 = R1649 ;

CS_PREREV = PREREV ;
RD_PREREV = PREREV ;
PS_PREREV = PREREV ;

ZIGRE168 = positif(RE168) * (1 - V_CNR) * LIG2 ;
ZIGTAX1649 = positif(TAX1649) * (1 - V_CNR) * LIG2 ;

ZIGR1649 = positif(R1649) * (1 - V_CNR) * LIG1 * LIG2 ;
ZIGPREREV = positif(PREREV) * (1 - V_CNR) * LIG1 * LIG2 ;

regle 5000:
application : batch , iliad ;

LIGPS = positif(BCSG + BRDS + BPRS + BCVNSAL + BREGV + BCDIS 
                + BGLOA + BRSE1 + BRSE2 + BRSE3 + BRSE4 + BRSE5 + 0) 
	 * (1 - positif(ANNUL2042)) ;

LIGPSP = 1 - (null(LIGPS) * null(V_ANTCR)) ;

NONLIGPS = positif(positif(1 - LIGPS) + positif(null(V_NOTRAIT - 23) + null(V_NOTRAIT - 33) + null(V_NOTRAIT - 43) + null(V_NOTRAIT - 53) + null(V_NOTRAIT - 63))) ;

INDIRPS =  (1 * (1 - LIGPS) * positif(3 - ANTINDIRPS))
	 + (3 * (1- positif((1 - LIGPS) * positif(3 - ANTINDIRPS)))) ;

regle 117210:
application : batch, iliad;

CS_BASE = BCSG ;
RD_BASE = BRDS ;
PS_BASE = BPRS ;
ZIGBASECS = positif(BCSG + V_CSANT) ;
ZIGBASERD = positif(BRDS + V_RDANT) ;
ZIGBASEPS = positif(BPRS + V_PSANT) ;
ZIGBASECVN = positif(BCVNSAL + V_CVNANT) ;
ZIG_BASE = positif(BCSG + BRDS + BPRS + BCVNSAL + V_CSANT + V_RDANT + V_PSANT + V_CVNANT) * LIG2 ;
ZIGREGV = positif(BREGV) * LIG2 ;
ZIGCDIS = positif(BCDIS + V_CDISANT) * LIG2 ;
ZIGGLOA = positif(BGLOA) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG2 ;
ZIGGLOANR = positif(BGLOACNR) * LIG2 ;
ZIGGLOALL = positif(ZIGGLOA + ZIGGLOANR) * LIG2 ;
ZIGRSE1 = positif(BRSE1) * LIG2 ; 
ZIGRSE2 = positif(BRSE2) * LIG2 ;
ZIGRSE3 = positif(BRSE3) * LIG2 ;
ZIGRSE4 = positif(BRSE4) * LIG2 ;
ZIGRSE5 = positif(BRSE5) * LIG2 ;


ZIGRFRET = positif(COD8YK) * (1-positif(COD8XK)) * LIG2 ;
ZIGRFDEP = positif(COD8XK) * (1-positif(COD8YK)) * LIG2 ;

regle 117220:
application : batch, iliad;
ZIG_TAUXCRP  = ZIG_TITRECRP ;
ZIG_TAUXCR   = ZIG_TITRECR ;
ZIG_TAUXCP   = ZIG_TITRECP ;
ZIG_TAUXRP   = ZIG_TITRERP ;
ZIG_TAUXR    = ZIG_TITRER ;
ZIGTAUX1 = ZIGTITRECRPS ;
ZIGTAUX3 = ZIGTITRECRS ;
ZIGTAUX4 = ZIG_TITRECR ;

regle 117290:
application : batch, iliad;
ZIGMONTCS = positif(BCSG + V_CSANT) ;
ZIGMONTRD = positif(BRDS + V_RDANT) ;
ZIGMONTPS = positif(BPRS + V_PSANT) ;
ZIGMONTS = positif(BCVNSAL + V_CVNANT) ;
ZIG_MONTANT = positif (BCSG + BRDS + BPRS + BCVNSAL + V_CSANT + V_RDANT + V_PSANT + V_CVNANT) * (1 - positif(ANNUL2042)) ;

regle 117300:
application : batch , iliad ;

ZIG_INT =  positif (RETCS + RETRD + RETPS + RETCVN) * LIG2 ;

ZIGINT = positif(RETCDIS) * LIG2 ;
ZIGINTREGV = positif(RETREGV) * LIG2 ;

ZIGLOA = positif(RETGLOA) * LIG2 ;

ZIGINT1 = positif(RETRSE1) * LIG2 ;
ZIGINT2 = positif(RETRSE2) * LIG2 ;
ZIGINT3 = positif(RETRSE3) * LIG2 ;
ZIGINT4 = positif(RETRSE4) * LIG2 ;
ZIGINT5 = positif(RETRSE5) * LIG2 ;

ZIGINT22 = positif(RETCDIS22) ;
ZIGLOA22 = positif(RETGLOA22) ;
ZIGINTREGV22 = positif(RETREGV22) * LIG2 ;

ZIGINT122 = positif(RETRSE122) * LIG2 ;
ZIGINT222 = positif(RETRSE222) * LIG2 ;
ZIGINT322 = positif(RETRSE322) * LIG2 ;
ZIGINT422 = positif(RETRSE422) * LIG2 ;
ZIGINT522 = positif(RETRSE522) * LIG2 ;

regle 117330:
application : batch, iliad;
ZIG_PEN17281 = ZIG_PENAMONT * positif(NMAJC1 + NMAJR1 + NMAJP1 + NMAJCVN1) * LIG2 ;

ZIG_PENATX4 = ZIG_PENAMONT * positif(NMAJC4 + NMAJR4 + NMAJP4 + NMAJCVN4) * LIG2 ;
ZIG_PENATAUX = ZIG_PENAMONT * positif(NMAJC1 + NMAJR1 + NMAJP1 + NMAJCVN1) * LIG2 ;

ZIGNONR30 = positif(ZIG_PENATX4) * positif(1 - positif(R1649 + PREREV)) * LIG2 ;
ZIGR30 = positif(ZIG_PENATX4) * positif(R1649 + PREREV) * LIG2 ;

ZIGPENAREGV = positif(PREGV) * positif(NMAJREGV1) * LIG2 ;

ZIGPENACDIS = positif(PCDIS) * positif(NMAJCDIS1) * LIG2 ;

ZIGPENAGLO1 = positif(PGLOA) * positif(NMAJGLO1) * LIG2 ;

ZIGPENARSE1 = positif(PRSE1) * positif(NMAJRSE11) * LIG2 ;
ZIGPENARSE2 = positif(PRSE2) * positif(NMAJRSE21) * LIG2 ;
ZIGPENARSE3 = positif(PRSE3) * positif(NMAJRSE31) * LIG2 ;
ZIGPENARSE4 = positif(PRSE4) * positif(NMAJRSE41) * LIG2 ;
ZIGPENARSE5 = positif(PRSE5) * positif(NMAJRSE51) * LIG2 ;

ZIGPENACDIS4 = positif(PCDIS) * positif(NMAJCDIS4) * LIG2 ;

ZIGPENAGLO4 = positif(PGLOA) * positif(NMAJGLO4) * LIG2 ;

ZIGPENARSE14 = positif(PRSE1) * positif(NMAJRSE14) * LIG2 ;
ZIGPENARSE24 = positif(PRSE2) * positif(NMAJRSE24) * LIG2 ;
ZIGPENARSE34 = positif(PRSE3) * positif(NMAJRSE34) * LIG2 ;
ZIGPENARSE44 = positif(PRSE4) * positif(NMAJRSE44) * LIG2 ;
ZIGPENARSE54 = positif(PRSE5) * positif(NMAJRSE54) * LIG2 ;

regle 117350:
application : batch, iliad;
ZIG_PENAMONT = positif(PCSG + PRDS + PPRS + PCVN) * LIG2 ;
regle 117360:
application : batch, iliad;
ZIG_CRDETR = positif(CICSG + CIRDS + CIPRS) * LIG2 ;

regle 117380 :
application : batch , iliad ;

ZIGCOD8YL = positif(COD8YL) * TYPE2;
ZIGCOD8YT = positif(COD8YT) * TYPE2;
ZIGCDISPROV = positif(CDISPROV) * TYPE2 ;

ZIGREVXA = positif(REVCSXA) * TYPE2 ;

ZIGREVXB = positif(REVCSXB) * TYPE2 ;
ZIGREVXC = positif(REVCSXC + COD8XI) * TYPE2 ;

ZIGREVXD = positif(REVCSXD) * TYPE2 ;
ZIGREVXE = positif(REVCSXE + COD8XJ) * TYPE2 ;

ZIGPROVYD = positif(CSPROVYD) * TYPE2 ;

ZIGPROVYE = positif(CSPROVYE) * TYPE2 ;

ZIGPROVYF = positif(CSPROVYF + CSPROVYN) * TYPE2 ;
CSPROVRSE2 = CSPROVYF + CSPROVYN ;

ZIGPROVYG = positif(CSPROVYG) * TYPE2 ;

ZIGPROVYH = positif(CSPROVYH + CSPROVYP) * TYPE2 ;
CSPROVRSE4 = CSPROVYH + CSPROVYP ;
regle 117390 :
application : batch , iliad ;

ZIG_CTRIANT = positif(V_ANTCR) * TYPE2 ;

ZIGCSANT = positif(V_CSANT) * TYPE2* (1 - APPLI_OCEANS) ;

ZIGRDANT = positif(V_RDANT) * TYPE2 * (1 - APPLI_OCEANS);

ZIGPSANT = positif(V_PSANT) * TYPE2 * (1 - APPLI_OCEANS);

ZIGCVNANT = positif(V_CVNANT) * TYPE2 * (1 - APPLI_OCEANS);

ZIGCDISANT = positif(V_CDISANT) * TYPE2 * (1 - APPLI_OCEANS);

ZIGLOANT = positif(V_GLOANT) * TYPE2 * (1 - APPLI_OCEANS);

ZIGRSE1ANT = positif(V_RSE1ANT) * TYPE2 * (1 - APPLI_OCEANS);
ZIGRSE2ANT = positif(V_RSE2ANT) * TYPE2 * (1 - APPLI_OCEANS);
ZIGRSE3ANT = positif(V_RSE3ANT) * TYPE2 * (1 - APPLI_OCEANS);
ZIGRSE4ANT = positif(V_RSE4ANT) * TYPE2 * (1 - APPLI_OCEANS);
ZIGRSE5ANT = positif(V_RSE5ANT) * TYPE2 * (1 - APPLI_OCEANS);
regle 117410:
application : batch, iliad ;

ZIG_CTRIPROV = positif(COD8YT + PRSPROV + CSGIM + CRDSIM) * LIG2 ;

ZIG_CONTRIBPROV_A = positif(PRSPROV_A + CSGIM_A + CRDSIM_A) * LIG2 ;

regle 117430:
application : batch, iliad;
IND_COLC = positif(BCSG) * positif(PCSG + CICSG + CSGIM) * (1 - INDCTX) ;

IND_COLR = positif(BRDS) * positif(PRDS + CIRDS + CRDSIM) * (1 - INDCTX) ;

IND_COLP = positif(BPRS) * positif(PPRS + CIPRS + PRSPROV) * (1 - INDCTX) ;

INDCOLVN = positif(BCVNSAL) * positif(PCVN + COD8YT) * (1 - INDCTX) ;

INDREGV = positif(BREGV) * positif(PREGV) * (1 - INDCTX) ;

INDCOL = positif(IND_COLC + IND_COLR + IND_COLP + INDCOLVN) ;

IND_COLD = positif(BCDIS) * positif(PCDIS + CDISPROV) * (1 - INDCTX) ;

INDGLOA = positif(BGLOA) * positif(PGLOA+COD8YL) * (1 - INDCTX) ;

INDRSE1 = positif(BRSE1) * positif(PRSE1 + CIRSE1 + CSPROVYD) * (1 - INDCTX) ;
INDRSE2 = positif(BRSE2) * positif(PRSE2 + CIRSE2 + CSPROVYF + CSPROVYN) * (1 - INDCTX) ;
INDRSE3 = positif(BRSE3) * positif(PRSE3 + CIRSE3 + CSPROVYG) * (1 - INDCTX) ;
INDRSE4 = positif(BRSE4) * positif(PRSE4 + CIRSE4 + CSPROVYH + CSPROVYP) * (1 - INDCTX) ;
INDRSE5 = positif(BRSE5) * positif(PRSE5 + CIRSE5 + CSPROVYE) * (1 - INDCTX) ;

IND_CTXC = positif(CS_DEG) * positif(BCSG) * positif(INDCTX) ;

IND_CTXR = positif(CS_DEG) * positif(BRDS) * positif(INDCTX) ;

IND_CTXP = positif(CS_DEG) * positif(BPRS) * positif(INDCTX) ;

IND_CTXD = positif(CS_DEG) * positif(BCDIS) * positif(INDCTX) ;

INDRSE1X = positif(CS_DEG) * positif(BRSE1) * positif(INDCTX) ;
INDRSE2X = positif(CS_DEG) * positif(BRSE2) * positif(INDCTX) ;
INDRSE3X = positif(CS_DEG) * positif(BRSE3) * positif(INDCTX) ;
INDRSE4X = positif(CS_DEG) * positif(BRSE4) * positif(INDCTX) ;
INDRSE5X = positif(CS_DEG) * positif(BRSE5) * positif(INDCTX) ;
INDTRAIT = null(5 - V_IND_TRAIT) ;

INDT = positif(IND_COLC + IND_COLR + IND_COLP + IND_COLS + IND_CTXC + IND_CTXR + IND_CTXP + IND_CTXS) 
	* INDTRAIT ;

INDTS = positif(INDCOLS + INDCTXS) * INDTRAIT ;

INDTD = positif(IND_COLD + IND_CTXD) * INDTRAIT ;

INDE1 = positif(INDRSE1 + INDRSE1X) * INDTRAIT ;
INDE2 = positif(INDRSE2 + INDRSE2X) * INDTRAIT ;
INDE3 = positif(INDRSE3 + INDRSE3X) * INDTRAIT ;
INDE4 = positif(INDRSE4 + INDRSE4X) * INDTRAIT ;
INDE5 = positif(INDRSE5 + INDRSE5X) * INDTRAIT ;

regle 117440:
application : batch, iliad;
ZIG_NETAP =  positif (BCSG  + BRDS + BPRS + BCVNSAL + BREGV + BCDIS 
                      + BGLOA + BRSE1 + BRSE2 + BRSE3 + BRSE4 + BRSE5)
             * LIG2 ;
regle 117450:
application : batch, iliad;
ZIG_TOTDEG = positif (CRDEG) * positif(INDCTX) ;

ZIG_TITREP = ZIG_NETAP + ZIG_TOTDEG ;

ZIGANNUL = positif(INDCTX) * positif(ANNUL2042) ;

regle 117490:
application : batch, iliad ;

ZIG_INF8 = positif (CS_DEG) * positif (SEUIL_8 - CS_DEG) * LIG2 ;

regle 117660:
application : batch, iliad;
ZIG_REMPLACE  = positif((1 - positif(20 - V_NOTRAIT)) 
               * positif(V_ANREV - V_0AX)
               * positif(V_ANREV - V_0AZ)
               * positif(V_ANREV - V_0AY) + positif(V_NOTRAIT - 20))
               * LIG2 ;
regle 117710:
application : batch, iliad;
ZIG_DEGINF61 = positif(V_CSANT+V_RDANT+V_PSANT+0)  
               * positif(CRDEG+0)
               * positif(SEUIL_61-TOTCRA-CSNET-RDNET-PRSNET-CDISNET+0)
               * (1 - null(CSTOT+0))
               * LIG2 ;
regle 117820:
application : batch , iliad ;

ZIG_CSGDDO = positif(V_IDANT - DCSGD) * positif(IDCSG) * (1 - null(V_IDANT + DCSGD + 0)) * (1 - null(V_IDANT - DCSGD)) * positif(V_NOTRAIT - 20) * LIG2 ;

ZIG_CSGDRS = positif(DCSGD - V_IDANT) * positif(IDCSG) * (1 - null(V_IDANT + DCSGD + 0)) * (1 - null(V_IDANT - DCSGD)) * positif(V_NOTRAIT - 20) * LIG2 ;

ZIG_CSGDC = positif(ZIG_CSGDDO + ZIG_CSGDRS + null(V_IDANT - DCSGD)) * (1 - null(V_IDANT + DCSGD + 0)) * positif(V_NOTRAIT - 20) * LIG2 ;

ZIG_CSGDCOR = positif(ZIG_CSGDDO + ZIG_CSGDRS) * (1 - null(V_IDANT + DCSGD + 0)) * (1 - null(V_IDANT - DCSGD)) * positif(V_NOTRAIT - 20) * LIG2 ;

ZIGCSGDCOR1 = ZIG_CSGDCOR * null(ANCSDED2 - V_ANREV + 1) ;
ZIGCSGDCOR2 = ZIG_CSGDCOR * null(ANCSDED2 - V_ANREV + 2) ;
ZIGCSGDCOR3 = ZIG_CSGDCOR * null(ANCSDED2 - V_ANREV + 3) ;
ZIGCSGDCOR4 = ZIG_CSGDCOR * null(ANCSDED2 - V_ANREV + 4) ;
ZIGCSGDCOR5 = ZIG_CSGDCOR * null(ANCSDED2 - V_ANREV + 5) ;
ZIGCSGDCOR6 = ZIG_CSGDCOR * null(ANCSDED2 - V_ANREV + 6) ;

regle 117822:
application : batch , iliad ;

ZIGLODD = positif(V_GLOANT - DGLOD) * positif(IDGLO) * (1 - null(V_IDGLOANT + DGLOD + 0)) * (1 - null(V_IDGLOANT - DGLOD)) * positif(V_NOTRAIT - 20) * LIG2 ;

ZIGLORS = positif(DGLOD - V_GLOANT) * positif(IDGLO) * (1 - null(V_IDGLOANT + DGLOD + 0)) * (1 - null(V_IDGLOANT - DGLOD)) * positif(V_NOTRAIT - 20) * LIG2 ;

ZIGLOCO = positif(ZIGLODD + ZIGLORS + null(V_IDGLOANT - DGLOD)) * (1 - null(V_IDGLOANT + DGLOD + 0)) * positif(V_NOTRAIT - 20) * LIG2 ;

ZIGLOCOR = positif(ZIGLODD + ZIGLORS) * (1 - null(V_IDGLOANT + DGLOD + 0)) * (1 - null(V_IDGLOANT - DGLOD)) * positif(V_NOTRAIT - 20) * LIG2 ;

ZIGLOCOR1 = ZIGLOCOR * null(ANCSDED2 - V_ANREV + 1) ;
ZIGLOCOR2 = ZIGLOCOR * null(ANCSDED2 - V_ANREV + 2) ;
ZIGLOCOR3 = ZIGLOCOR * null(ANCSDED2 - V_ANREV + 3) ;
ZIGLOCOR4 = ZIGLOCOR * null(ANCSDED2 - V_ANREV + 4) ;
ZIGLOCOR5 = ZIGLOCOR * null(ANCSDED2 - V_ANREV + 5) ;
ZIGLOCOR6 = ZIGLOCOR * null(ANCSDED2 - V_ANREV + 6) ;

ZIGRSEDD = positif(V_RSE1ANT + V_RSE2ANT + V_RSE3ANT + V_RSE4ANT + V_RSE5ANT - DRSED) * positif(IDRSE) * (1 - null(V_IDRSEANT + DRSED + 0)) 
	    * (1 - null(V_IDRSEANT - DRSED)) * positif(V_NOTRAIT - 20) * LIG2 ;

ZIGRSERS = positif(DRSED - (V_RSE1ANT + V_RSE2ANT + V_RSE3ANT + V_RSE4ANT + V_RSE5ANT)) * positif(IDRSE) * (1 - null(V_IDRSEANT + DRSED + 0)) 
	    * (1 - null(V_IDRSEANT - DRSED)) * positif(V_NOTRAIT - 20) * LIG2 ;

ZIGRSECO = positif(ZIGRSEDD + ZIGRSERS + null(V_IDRSEANT - DRSED)) * (1 - null(V_IDRSEANT + DRSED + 0)) * positif(V_NOTRAIT - 20) * LIG2 ;

ZIGRSECOR = positif(ZIGRSEDD + ZIGRSERS) * (1 - null(V_IDRSEANT + DRSED + 0)) * (1 - null(V_IDRSEANT - DRSED)) * positif(V_NOTRAIT - 20) * LIG2 ;

ZIGRSECOR1 = ZIGRSECOR * null(ANCSDED2 - V_ANREV + 1) ;
ZIGRSECOR2 = ZIGRSECOR * null(ANCSDED2 - V_ANREV + 2) ;
ZIGRSECOR3 = ZIGRSECOR * null(ANCSDED2 - V_ANREV + 3) ;
ZIGRSECOR4 = ZIGRSECOR * null(ANCSDED2 - V_ANREV + 4) ;
ZIGRSECOR5 = ZIGRSECOR * null(ANCSDED2 - V_ANREV + 5) ;
ZIGRSECOR6 = ZIGRSECOR * null(ANCSDED2 - V_ANREV + 6) ;

regle 117850:
application : batch, iliad;
ZIG_PRIM = positif(NAPCR) * LIG2 ;
regle 117130:
application : batch, iliad;

CS_BPCOS = RDNCP ;
RD_BPCOS = CS_BPCOS ;
PS_BPCOS = CS_BPCOS ;

ZIG_BPCOS = positif(CS_BPCOS + RD_BPCOS + PS_BPCOS) * (1 - V_CNR) * LIG1 * LIG2 ;

regle 117801:
application : batch , iliad ;

ANCSDED2 = (V_ANCSDED * (1 - null(933 - V_ROLCSG)) + (V_ANCSDED + 1) * null(933 - V_ROLCSG)) * positif(V_ROLCSG + 0)
           + V_ANCSDED * (1 - positif(V_ROLCSG + 0)) ;

ZIG_CSGDPRIM = (1 - positif(V_CSANT + V_RDANT + V_PSANT + V_IDANT)) * positif(IDCSG) * LIG2 ;

ZIG_CSGD99 = ZIG_CSGDPRIM * (1 - null(V_IDANT + DCSGD + 0)) * positif(DCSGD) * positif(20 - V_NOTRAIT) * LIG2 ;

ZIGDCSGD1 = ZIG_CSGD99 * null(ANCSDED2 - (V_ANREV + 1)) * LIG2 ;
ZIGDCSGD2 = ZIG_CSGD99 * null(ANCSDED2 - (V_ANREV + 2)) * LIG2 ;
ZIGDCSGD3 = ZIG_CSGD99 * null(ANCSDED2 - (V_ANREV + 3)) * LIG2 ;
ZIGDCSGD4 = ZIG_CSGD99 * null(ANCSDED2 - (V_ANREV + 4)) * LIG2 ;
ZIGDCSGD5 = ZIG_CSGD99 * null(ANCSDED2 - (V_ANREV + 5)) * LIG2 ;
ZIGDCSGD6 = ZIG_CSGD99 * null(ANCSDED2 - (V_ANREV + 6)) * LIG2 ;

ZIGIDGLO = positif(IDGLO) * (1 - null(V_IDGLOANT + DGLOD + 0))  * positif(20 - V_NOTRAIT) * LIG2 ;

ZIGIDGLO1 = ZIGIDGLO * null(ANCSDED2 - (V_ANREV + 1)) ;
ZIGIDGLO2 = ZIGIDGLO * null(ANCSDED2 - (V_ANREV + 2)) ;
ZIGIDGLO3 = ZIGIDGLO * null(ANCSDED2 - (V_ANREV + 3)) ;
ZIGIDGLO4 = ZIGIDGLO * null(ANCSDED2 - (V_ANREV + 4)) ;
ZIGIDGLO5 = ZIGIDGLO * null(ANCSDED2 - (V_ANREV + 5)) ;
ZIGIDGLO6 = ZIGIDGLO * null(ANCSDED2 - (V_ANREV + 6)) ;

ZIGIDRSE = positif(IDRSE) * (1 - null(V_IDRSEANT + DRSED + 0)) * positif(20 - V_NOTRAIT) * LIG2 ;

ZIGDRSED1 = ZIGIDRSE * null(ANCSDED2 - (V_ANREV + 1)) ;
ZIGDRSED2 = ZIGIDRSE * null(ANCSDED2 - (V_ANREV + 2)) ;
ZIGDRSED3 = ZIGIDRSE * null(ANCSDED2 - (V_ANREV + 3)) ;
ZIGDRSED4 = ZIGIDRSE * null(ANCSDED2 - (V_ANREV + 4)) ;
ZIGDRSED5 = ZIGIDRSE * null(ANCSDED2 - (V_ANREV + 5)) ;
ZIGDRSED6 = ZIGIDRSE * null(ANCSDED2 - (V_ANREV + 6)) ;

regle 113530:
application : batch, iliad ;

LIGPVSURSI = positif(PVSURSI + CODRWA) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO));

LIGBPTPGJ = positif(BPTP19WGWJ) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO));

LIGIREXITI = positif(IREXITI) * (1 - positif(IREXITS)) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIGIREXI19 = positif(IREXITI19) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIGIREXITS = positif(IREXITS) * (1 - positif(IREXITI)) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIGIREXS19 = positif(IREXITS19) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIGIREXIT = positif(PVIMPOS + CODRWB) * positif(PVSURSI + CODRWA) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIGPV3WBI = positif(PVIMPOS + CODRWB) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIGEXITAX3 = positif(EXITTAX3) * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) * LIG1 * LIG2 ;

LIG_SURSIS = positif( LIGPVSURSI + LIGBPTPGJ + LIGIREXITI
                      + LIGIREXI19 + LIGIREXITS + LIGIREXS19 + LIGIREXIT + LIGEXITAX3
                      + LIGSURIMP ) * LIG1 * LIG2 ; 

regle 113531:
application : batch, iliad;
LIG_CORRECT = positif_ou_nul(IBM23) * INDREV1A8 * LIG1 * LIG2 ;
regle 113532:
application : batch, iliad;
LIG_R8ZT = positif(V_8ZT) * LIG1 * LIG2 ;
regle 113533:
application : batch , iliad ;
                 
LIGTXMOYPOS = positif(present(RMOND)+positif(VARRMOND)*present(DEFZU)) * (1 - positif(DEFRIMOND)) * LIG1 * LIG2 ;

LIGTXMOYNEG = positif(DMOND) * (1 - positif(DEFRIMOND)) * LIG1 * LIG2 ;

LIGTXPOSYT = positif(RMOND + DEFZU - DMOND) * positif(IPTXMO) * positif(DEFRIMOND) * LIG1 * LIG2 ;

LIGTXNEGYT = (1-positif(LIGTXPOSYT)) * positif_ou_nul(DMOND - RMOND - DEFZU) * positif(IPTXMO) * positif(DEFRIMOND) * LIG1 * LIG2 ;

regle 114000:
application : batch , iliad ;
                 
LIGAMEETREV = positif(INDREV1A8) * LIG1 * LIG2 ;
regle 114300:
application : iliad,batch;
                 
LIGMIBNPNEG = positif((MIBNPRV+MIBNPRC+MIBNPRP+MIB_NETNPCT) * (-1)) * LIG2 ;

LIGMIBNPPOS = positif(MIBNPRV+MIBNPRC+MIBNPRP+MIB_NETNPCT) * (1 - positif(LIG_BICNPF)) * LIG2 ;

LIG_MIBP = positif(somme(i=V,C,P:MIBVENi) + somme(i=V,C,P:MIBPRESi) + abs(MIB_NETCT) + 0) * (1 - null(4 - V_REGCO)) ;
regle 114400:
application : iliad,batch;
                 
LIGSPENPNEG = positif(SPENETNPF * (-1)) 
                     * (1 - positif(
 present( BNCAABV )+ 
 present( BNCAADV )+ 
 present( BNCAABC )+ 
 present( BNCAADC )+ 
 present( BNCAABP )+ 
 present( BNCAADP )+ 
 present( DNOCEP )+ 
 present( ANOVEP )+ 
 present( DNOCEPC )+ 
 present( ANOPEP )+ 
 present( DNOCEPP )+ 
 present( ANOCEP )+ 
 present( DABNCNP6 )+ 
 present( DABNCNP5 )+ 
 present( DABNCNP4 )+ 
 present( DABNCNP3 )+ 
 present( DABNCNP2 )+ 
 present( DABNCNP1 )
		     )) * LIG2 ;
LIGSPENPPOS = (positif(SPENETNPF)+positif(BNCNPV+BNCNPC+BNCNPP)*null(SPENETNPF)) 
	    * positif_ou_nul(ANOCEP - (DNOCEP + DABNCNP6 +DABNCNP5 +DABNCNP4 +DABNCNP3 +DABNCNP2 +DABNCNP1)+0) 
                     * (1 - positif(
 present( BNCAABV )+ 
 present( BNCAADV )+ 
 present( BNCAABC )+ 
 present( BNCAADC )+ 
 present( BNCAABP )+ 
 present( BNCAADP )+ 
 present( DNOCEP )+ 
 present( ANOVEP )+ 
 present( DNOCEPC )+ 
 present( ANOPEP )+ 
 present( DNOCEPP )+ 
 present( ANOCEP )+ 
 present( DABNCNP6 )+ 
 present( DABNCNP5 )+ 
 present( DABNCNP4 )+ 
 present( DABNCNP3 )+ 
 present( DABNCNP2 )+ 
 present( DABNCNP1 )
		     )) * LIG2 ;
regle 114909:
application : batch , iliad ;

LIGTXMOYPS = positif(TXMOYIMP) * (1 - positif(V_CNR))
	       * (1 - positif(null(2 - V_REGCO) + null(4 - V_REGCO) 
                              + positif(present(NRINET) + present(NRBASE) + present(IMPRET) + present(BASRET))))
               * IND_REV * LIG2 * positif(20 - V_NOTRAIT) ;

regle 114600:
application : iliad, batch;


LIGREPTOUR = positif(RINVLOCINV + REPINVTOU + INVLOCXN + COD7UY) * LIG1 ;

LIGLOCHOTR = positif(INVLOCHOTR + INVLOGHOT) * LIG1 ;


LIGLOGDOM = positif(DLOGDOM) * LIG1 * LIG2 ;

LIGLOGSOC = positif(DLOGSOC) * LIG1 * LIG2 ;

LIGDOMSOC1 = positif(DDOMSOC1) * LIG1 * LIG2 ;

LIGLOCENT = positif(DLOCENT) * LIG1 * LIG2 ;

LIGCOLENT = positif(DCOLENT) * LIG1 * LIG2 ;

LIGREPHA  = positif(RINVLOCREA + INVLOGREHA + INVLOCXV + COD7UZ) * LIG1 * LIG2 ;

regle 114700:
application : iliad, batch ;

LIGREDAGRI = positif(DDIFAGRI) * LIG1 * LIG2 ;
LIGFORET = positif(DFORET) * LIG1 * LIG2 ;
LIGCOTFOR = positif(DCOTFOR) * LIG1 * LIG2 ; 

LIGREP7UP = positif(REPCIF) * LIG1 * LIG2 ;
LIGREP7UA = positif(REPCIFAD) * LIG1 * LIG2 ;
LIGREP7UT = positif(REPCIFSIN) * LIG1 * LIG2 ;
LIGREP7UB = positif(REPCIFADSIN) * LIG1 * LIG2 ;

LIGNFOREST = positif(REPSIN + REPFORSIN + REPFORSIN2 + REPFORSIN3 + REPNIS) * LIG1 * LIG2 ;
LIGREPSIN = positif(REPSIN) * LIG1 * LIG2 ;
LIGSINFOR = positif(REPFORSIN) * LIG1 * LIG2 ;
LIGSINFOR2 = positif(REPFORSIN2) * LIG1 * LIG2 ;
LIGSINFOR3 = positif(REPFORSIN3) * LIG1 * LIG2 ;
LIGREPNIS = positif(REPNIS) * LIG1 * LIG2 ;

LIGFIPC = positif(DFIPC) * LIG1 * LIG2 ;
LIGFIPDOM = positif(DFIPDOM) * LIG1 * LIG2 ;
LIGCINE = positif(DCINE) * LIG1 * LIG2 ;
LIGRIRENOV = positif(DRIRENOV) * LIG1 * LIG2 ;
LIGREPAR = positif(NUPROPT) * LIG1 * LIG2 ;
LIGREPREPAR = positif(REPNUREPART) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 * (1 - V_CNR) ;
LIGREPARN = positif(REPAR) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 * (1 - V_CNR) ;
LIGREPAR1 = positif(REPAR1) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 * (1 - V_CNR) ;
LIGREPAR2 = positif(REPAR2) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 * (1 - V_CNR) ;
LIGREPAR3 = positif(REPAR3) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 * (1 - V_CNR) ;
LIGREPAR4 = positif(REPAR4) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 * (1 - V_CNR) ;
LIGREPAR5 = positif(REPAR5) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 * (1 - V_CNR) ;

LIGRESTIMO = (present(RIMOPPAUANT) + present(RIMOSAUVANT) + present(RESTIMOPPAU) + present(RESTIMOSAUV) + present(RIMOPPAURE) + present(RIMOSAUVRF)
              + present(COD7SY) + present(COD7SX)) * LIG1 * LIG2 ;

LIGRSA = positif(PPERSATOT) * positif(PPETOTX) * LIG1 * LIG2 ;

LIGRCODOU = positif(COD7OU + 0) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;

LIGRCODJT = positif(LOCMEUBJT + 0) * positif(RCODJT1 + RCODJT2 + RCODJT3 + RCODJT4 + RCODJT5 + RCODJT6 + RCODJT7 + RCODJT8)
             * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;

LIGRCODJU = positif(LOCMEUBJU + 0) * positif(RCODJU1 + RCODJU2 + RCODJU3 + RCODJU4 + RCODJU5 + RCODJU6 + RCODJU7 + RCODJU8)
             * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;

LIGRLOCIDFG = positif(LOCMEUBID + LOCMEUBIF + LOCMEUBIG) * positif(RLOCIDFG1 + RLOCIDFG2 + RLOCIDFG3 + RLOCIDFG4 + RLOCIDFG5 + RLOCIDFG6 + RLOCIDFG7 + RLOCIDFG8)
	     * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;

LIGREPLOCIE = positif(LOCMEUBIE) * positif(REPLOCIE1 + REPLOCIE2 + REPLOCIE3 + REPLOCIE4 + REPLOCIE5 + REPLOCIE6 + REPLOCIE7 + REPLOCIE8)
	     * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;

LIGNEUV = positif(LOCRESINEUV + INVNPROF1 + INVNPROF2) * positif(RESINEUV1 + RESINEUV2 + RESINEUV3 + RESINEUV4 + RESINEUV5 + RESINEUV6 + RESINEUV7 + RESINEUV8) 
	     * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;

LIGRNEUV = positif(MEUBLENP) * positif(RRESINEUV1 + RRESINEUV2 + RRESINEUV3 + RRESINEUV4 + RRESINEUV5 + RRESINEUV6 + RRESINEUV7 + RRESINEUV8) 
	     * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;

LIGVIEU = positif(RESIVIEU) * positif(RESIVIEU1 + RESIVIEU2 + RESIVIEU3 + RESIVIEU4 + RESIVIEU5 + RESIVIEU6 + RESIVIEU7 + RESIVIEU8) 
	     * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;

LIGVIAN = positif(RESIVIANT) * positif(RESIVIAN1 + RESIVIAN2 + RESIVIAN3 + RESIVIAN4 + RESIVIAN5 + RESIVIAN6 + RESIVIAN7 + RESIVIAN8) 
	     * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;

LIGMEUB = positif(VIEUMEUB) * positif(RESIMEUB1 + RESIMEUB2 + RESIMEUB3 + RESIMEUB4 + RESIMEUB5 + RESIMEUB6 + RESIMEUB7 + RESIMEUB8)
	     * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;

LIGREPOU = positif(REPMEUOU) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;

LIGREPCODJT = positif(REPLNPV + REPMEUPE) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGREP7PE = positif(REPMEUPE) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGREPLNPV = positif(REPLNPV) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;

LIGREPLOCNT = positif(REPLNPW + REPMEUPD + REPLOCNT) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGREPLOCJS = positif(REPLOCNT) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGREP7PD = positif(REPMEUPD) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGREPLOCJU = positif(REPLNPW) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;

LIGRESIREP = positif(REPMEUIZ + REPRESINEUV + REPMEUPC + REPLNPX) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGREPLOCIZ = positif(REPMEUIZ) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGREPLOCIJ = positif(REPRESINEUV) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGREP7PC = positif(REPMEUPC) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGREPLNPX = positif(REPLNPX) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;

LIGREPMEU = positif(REPINVRED + REPMEUIH + REPLOCN1 + REPMEUPB + REPLNPY) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGREPINV = positif(REPINVRED) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGREPLOCIH = positif(REPMEUIH) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGREPLOC1 = positif(REPLOCN1) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGREP7PB = positif(REPMEUPB) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGREPLNPY = positif(REPLNPY) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;

LIGREPNEUV = positif(MEUBLERED + REPREDREP + REPMEUIX + REPLOCN2 + REPMEUPA + REPLNPZ) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGREPRED = positif(MEUBLERED) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGREPRESI = positif(REPREDREP) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGREPLOCIX = positif(REPMEUIX) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGREPLOC2 = positif(REPLOCN2) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGREP7PA = positif(REPMEUPA) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGREPLNPZ = positif(REPLNPZ) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;

regle 114750:
application : iliad, batch ;

LIGREDMEUB = positif(DREDMEUB) * LIG1 * LIG2 ;
LIGREDREP = positif(DREDREP) * LIG1 * LIG2 ;
LIGILMIX = positif(DILMIX) * LIG1 * LIG2 ;
LIGILMIY = positif(DILMIY) * LIG1 * LIG2 ;

LIGILMPA = positif(DILMPA) * LIG1 * LIG2 ;
LIGILMPB = positif(DILMPB) * LIG1 * LIG2 ;
LIGILMPC = positif(DILMPC) * LIG1 * LIG2 ;
LIGILMPD = positif(DILMPD) * LIG1 * LIG2 ;
LIGILMPE = positif(DILMPE) * LIG1 * LIG2 ;

LIGINVRED = positif(DINVRED) * LIG1 * LIG2 ;
LIGILMIH = positif(DILMIH) * LIG1 * LIG2 ;
LIGILMJC = positif(DILMJC) * LIG1 * LIG2 ;
LIGILMIZ = positif(DILMIZ) * LIG1 * LIG2 ;
LIGILMJI = positif(DILMJI) * LIG1 * LIG2 ;
LIGILMJS = positif(DILMJS) * LIG1 * LIG2 ;
LIGMEUBLE = positif(DMEUBLE) * LIG1 * LIG2 ;
LIGPROREP = positif(DPROREP) * LIG1 * LIG2 ;
LIGREPNPRO = positif(DREPNPRO) * LIG1 * LIG2 ;
LIGMEUREP = positif(DREPMEU) * LIG1 * LIG2 ;
LIGILMIC = positif(DILMIC) * LIG1 * LIG2 ;
LIGILMIB = positif(DILMIB) * LIG1 * LIG2 ;
LIGILMIA = positif(DILMIA) * LIG1 * LIG2 ;
LIGILMJY = positif(DILMJY) * LIG1 * LIG2 ;
LIGILMJX = positif(DILMJX) * LIG1 * LIG2 ;
LIGILMJW = positif(DILMJW) * LIG1 * LIG2 ;
LIGILMJV = positif(DILMJV) * LIG1 * LIG2 ;

LIGILMOE = positif(DILMOE) * LIG1 * LIG2 ;
LIGILMOD = positif(DILMOD) * LIG1 * LIG2 ;
LIGILMOC = positif(DILMOC) * LIG1 * LIG2 ;
LIGILMOB = positif(DILMOB) * LIG1 * LIG2 ;
LIGILMOA = positif(DILMOA) * LIG1 * LIG2 ;

LIGRESIMEUB = positif(DRESIMEUB) * LIG1 * LIG2 ;
LIGRESIVIEU = positif(DRESIVIEU) * LIG1 * LIG2 ;
LIGRESINEUV = positif(DRESINEUV) * LIG1 * LIG2 ;
LIGLOCIDEFG = positif(DLOCIDEFG) * LIG1 * LIG2 ;
LIGCODJTJU = positif(DCODJTJU) * LIG1 * LIG2 ;
LIGCODOU = positif(DCODOU) * LIG1 * LIG2 ;

regle 114850:
application : iliad, batch;
LIGTAXASSUR = positif(present(CESSASSV) + present(CESSASSC)) * (1 - positif(ANNUL2042)) * LIG1 ;
LIGTAXASSURV = present(CESSASSV) * (1 - positif(ANNUL2042)) * LIG1 ;
LIGTAXASSURC = present(CESSASSC) * (1 - positif(ANNUL2042)) * LIG1 ;

LIGIPCAP = positif(present(PCAPTAXV) + present(PCAPTAXC)) * (1 - positif(ANNUL2042 + 0)) * LIG1 ;
LIGIPCAPV = present(PCAPTAXV) * (1 - positif(ANNUL2042 + 0)) * LIG1 ;
LIGIPCAPC = present(PCAPTAXC) * (1 - positif(ANNUL2042 + 0)) * LIG1 ;

LIGITAXLOY = present(LOYELEV) * (1 - positif(ANNUL2042)) * LIG1 ;

LIGIHAUT = positif(CHRAVANT) * (1 - positif(TEFFHRC + COD8YJ)) * (1 - positif(ANNUL2042)) * LIG1 ;

LIGHRTEFF = positif(CHRTEFF) * positif(TEFFHRC + COD8YJ) * (1 - positif(ANNUL2042)) * LIG1 ;

regle 115100:
application : iliad , batch;
LIGCOMP01 = positif(BPRESCOMP01) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
regle 115200:
application : iliad, batch;
LIGDEFBA = positif(DEFBA1 + DEFBA2 + DEFBA3 + DEFBA4 + DEFBA5 + DEFBA6) 
	       * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGDEFBA1 = positif(DEFBA1) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGDEFBA2 = positif(DEFBA2) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGDEFBA3 = positif(DEFBA3) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGDEFBA4 = positif(DEFBA4) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGDEFBA5 = positif(DEFBA5) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGDEFBA6 = positif(DEFBA6) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGDFRCM = positif(DFRCMN+DFRCM1+DFRCM2+DFRCM3+DFRCM4+DFRCM5) * LIG1 * LIG2 
	    * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGDFRCMN = positif(DFRCMN) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGDFRCM1 = positif(DFRCM1) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGDFRCM2 = positif(DFRCM2) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGDFRCM3 = positif(DFRCM3) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGDFRCM4 = positif(DFRCM4) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGDFRCM5 = positif(DFRCM5) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGDRCVM = positif(DPVRCM) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGDRFRP = positif(DRFRP) * LIG1 * (1-null(4-V_REGCO)) * LIG2 ;
LIGDLMRN = positif(DLMRN6 + DLMRN5 + DLMRN4 + DLMRN3 + DLMRN2 + DLMRN1) 
	      * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGDLMRN6 = positif(DLMRN6) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGDLMRN5 = positif(DLMRN5) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGDLMRN4 = positif(DLMRN4) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGDLMRN3 = positif(DLMRN3) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGDLMRN2 = positif(DLMRN2) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGDLMRN1 = positif(DLMRN1) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGBNCDF = positif(BNCDF1 + BNCDF2 + BNCDF3 + BNCDF4 + BNCDF5 + BNCDF6) 
	       * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGBNCDF6 = positif(BNCDF6) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGBNCDF5 = positif(BNCDF5) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGBNCDF4 = positif(BNCDF4) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGBNCDF3 = positif(BNCDF3) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGBNCDF2 = positif(BNCDF2) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGBNCDF1 = positif(BNCDF1) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGIRECR = positif(IRECR) * LIG1 * LIG2 ;

LIGMBDREPNPV = positif(MIBDREPNPV) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGMBDREPNPC = positif(MIBDREPNPC) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGMBDREPNPP = positif(MIBDREPNPP) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;

LIGMIBDREPV = positif(MIBDREPV) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGMIBDREPC = positif(MIBDREPC) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGMIBDREPP = positif(MIBDREPP) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;

LIGSPDREPNPV = positif(SPEDREPNPV) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGSPDREPNPC = positif(SPEDREPNPC) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGSPDREPNPP = positif(SPEDREPNPP) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;

LIGSPEDREPV = positif(SPEDREPV) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGSPEDREPC = positif(SPEDREPC) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGSPEDREPP = positif(SPEDREPP) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;

regle 1113760:
application : batch , iliad ;

LIG_MEMO = ( positif(LIGPRELIB + LIG_SURSIS + LIGREPPLU + LIGELURAS + LIGELURASC + LIGABDET + LIGABDETP + LIGABDETM
                     + LIGROBOR + LIGPVIMMO + LIGPVTISOC + LIGMOBNR 
                     + LIGDEPCHO + LIGDEPMOB + LIGCOD3SG + LIGCOD3SH + LIGCOD3SL + LIGCOD3SM)
             + positif(LIG3525 + LIGRCMSOC + LIGRCMIMPAT + LIGABIMPPV + LIGABIMPMV + LIGPV3SB) * (1 - null(2-V_REGCO)) * (1 - null(4-V_REGCO))
           ) * LIG1 * LIG2 ;

regle 1113666:
application : batch , iliad ;

SPECIALRISTOURNE = if(CONTRIBUABLE, FGUILLOT, negatif(10000)) ;

regle 1113870:
application : batch , iliad ;

LIGPRELIB = positif(present(PPLIB) + present(RCMLIB)) * LIG0 * LIG2 ;

LIG3525 = (1 - V_CNR) * positif(RTNC) * LIG1 * LIG2 ;

LIGELURAS = positif(ELURASV) * LIG1 * LIG2 ;
LIGELURASC = positif(ELURASC) * LIG1 * LIG2 ;

LIGREPPLU = positif(REPPLU) * LIG1 * LIG2 ;
LIGSURIMP = positif(SURIMP) * LIG1 * LIG2 ;
LIGPVIMPOS = positif(PVIMPOS) * LIG1 * LIG2 ;

LIGABDET = positif(GAINABDET) * LIG1 * LIG2 ;
LIGABDETP = positif(ABDETPLUS) * LIG1 * LIG2 ;
LIGABDETM = positif(ABDETMOINS) * LIG1 * LIG2 ;

LIGCOD3SG = positif(COD3SG) * LIG1 * LIG2 ;
LIGCOD3SH = positif(COD3SH) * LIG1 * LIG2 ;
LIGCOD3SL = positif(COD3SL) * LIG1 * LIG2 ;
LIGCOD3SM = positif(COD3SM) * LIG1 * LIG2 ;
LIGPV3SB = positif(PVBAR3SB) * LIG1 * LIG2 * (1 - null(4 - V_REGCO)) ;

LIGRCMSOC = positif(RCMSOC) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGRCMIMPAT = positif(RCMIMPAT) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGABIMPPV = positif(ABIMPPV) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGABIMPMV = positif(ABIMPMV) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;

LIGCVNSAL = positif(CVNSALC) * LIG1 * LIG2 ;
LIGCDIS = positif(GSALV + GSALC) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;
LIGROBOR = positif(RFROBOR) * LIG1 * LIG2 ;
LIGPVIMMO = positif(PVIMMO) * LIG1 * LIG2 ;
LIGPVTISOC = positif(PVTITRESOC) * LIG1 * LIG2 ;
LIGMOBNR = positif(PVMOBNR) * LIG1 * LIG2 ;

DEPCHO = (DEPCHOBAS + CIBOIBAIL + COD7SA + CINRJBAIL + COD7SB + CRENRJ + COD7SC + TRAMURWC + COD7WB + CINRJ + COD7RG + TRATOIVG + COD7VH
          + CIDEP15 + COD7RH + MATISOSI + COD7RI + TRAVITWT + COD7WU + MATISOSJ + COD7RJ + VOLISO + COD7RK + PORENT + COD7RL + CHAUBOISN 
          + COD7RN + POMPESP + COD7RP + POMPESR + COD7RR + CHAUFSOL + COD7RS + POMPESQ + COD7RQ + ENERGIEST + COD7RT + DIAGPERF + COD7TV 
          + RESCHAL + COD7TW + COD7RV + COD7RW + COD7RZ) * positif(V_NOTRAIT - 10) ;

DEPMOB = (DEPMOBIL + RDEQPAHA + RDTECH + COD7WD) * positif(V_NOTRAIT - 10) ;

DIFF7WY = positif(abs(DEPCHOBAS - VAR7WY_P) * null(5-V_IND_TRAIT) + DIFF7WY_A);
DIFF7WZ = positif(abs(DEPMOBIL - VAR7WZ_P) * null(5-V_IND_TRAIT) + DIFF7WZ_A);
DIFF7WD = positif(abs(COD7WD - VAR7WD_P) * null(5-V_IND_TRAIT) + DIFF7WD_A);

LIGDEPCHO = DIFF7WY * positif(DEPCHO) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;

LIGDEPMOB = positif(DIFF7WZ + DIFF7WD) * positif(DEPMOB) * LIG1 * LIG2 * (1 - null(2 - V_REGCO)) * (1 - null(4 - V_REGCO)) ;

LIGDEFPLOC = positif(DEFLOC1 + DEFLOC2 + DEFLOC3 + DEFLOC4 + DEFLOC5 + DEFLOC6 + DEFLOC7 + DEFLOC8 + DEFLOC9 + DEFLOC10) 
		 * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGPLOC1 = positif(DEFLOC1) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGPLOC2 = positif(DEFLOC2) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGPLOC3 = positif(DEFLOC3) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGPLOC4 = positif(DEFLOC4) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGPLOC5 = positif(DEFLOC5) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGPLOC6 = positif(DEFLOC6) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGPLOC7 = positif(DEFLOC7) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGPLOC8 = positif(DEFLOC8) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGPLOC9 = positif(DEFLOC9) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;
LIGPLOC10 = positif(DEFLOC10) * LIG1 * (1 - null(4-V_REGCO)) * LIG2 ;

regle 115101:
application : batch , iliad;

LIGDCSGD = positif(DCSGD) * null(5 - V_IND_TRAIT) * INDCTX * LIG1 * LIG2 ;

regle 115102:
application :  batch , iliad;


LIGREPCORSE = positif(REPCORSE) * LIG1 * LIG2 ;

LIGREPRECH = positif(REPRECH) * LIG1 * LIG2 ;

LIGREPCICE = positif(REPCICE) * LIG1 * LIG2 ; 

LIGPME = positif(REPINVPME3 + REPINVPME2 + REPINVPME1 + REPINVPMECU) 
	   * LIG1 * LIG2 * (1 - positif(V_CNR)) 
           * (1 - null(2-V_REGCO)) * (1 - null(4-V_REGCO)) ;

regle 115103:
application : batch , iliad;
LIGIBAEX = positif(REVQTOT) * LIG1 * LIG2 
	     * (1 - INDTXMIN) * (1 - INDTXMOY) 
	     * (1 - null(2-V_REGCO) * (1 - LIG1522))
	     * (1 - null(4-V_REGCO)) ;

regle 115105:
application :  iliad, batch;
LIGANNUL2042 = LIG2 * LIG0 ;

LIG121 = positif(DEFRITS) * LIGANNUL2042 ;
LIG931 = positif(DEFRIRCM)*positif(RCMFR) * LIGANNUL2042 ;
LIG936 = positif(DEFRIRCM)*positif(REPRCM) * LIGANNUL2042 ;
LIG1111 = positif(DFANTIMPU) * LIGANNUL2042 ;
LIG1112 = positif(DFANTIMPU) * positif(DEFRF4BC) * positif(RDRFPS) * LIGANNUL2042 ;

regle 115107:
application : batch, iliad ;
LIGTRCT = positif(V_TRCT) ;
LIGISFTRCT = present(ISFBASE) * positif(V_TRCT) ;

regle 115108:
application : batch, iliad ;

LIGVERSUP = positif(AUTOVERSSUP) ;

regle 115109:
application : iliad, batch;

INDRESTIT = positif(IREST + 0) ;

INDIMPOS = positif(null(1 - NATIMP) + 0) ;


regle isf 99902:
application : iliad, batch;
NBLIGNESISF = positif(LIGISFBASE) * 3 
	    + positif(LIGISFDEC) * 3
	    + positif(LIGISFBRUT) * 6 
	    + positif(LIGISFRED) * 2
	    + positif(LIGISFREDPEN8) * 2
	    + positif(LIGISFDON) * 2
	    + positif(LIGISFRAN) 
	    + positif(LIGISFCEE)
	    + positif(LIGISFINV) * 2 
	    + positif(LIGISFPMED)
	    + positif(LIGISFPMEI)
	    + positif(LIGISFIP)
	    + positif(LIGISFCPI)
	    + positif(LIGISFIMPU) * 3
	    + positif(LIGISFPLAF) * 5
	    + positif(LIGISFE) * 3
	    + positif(LIGISFNOPEN) * 1 
	    + positif(LIGISFCOR) * 1
	    + positif(LIGISFRET) * 2 
	    + positif(LIGISF9749) 
	    + positif(LIGNMAJISF1) * 2 
            + positif(LIGISFANT) * 2 
	    + positif(LIGISFNET) * 3
	    + positif(LIGISF9269) * 3 
	    + positif(LIGISFANNUL) * 3 
	    + positif(LIGISFDEG) * 2 
	    + positif(LIGISFDEGR) * 2 
	    + positif(LIGISFZERO) * 3 
	    + positif(LIGISFNMR) * 4 
	    + positif(LIGISFNMRIS) * 3
	    + positif(LIGISF0DEG) * 2 
	    + positif(LIGISFNMRDEG) * 3
	    + positif(LIGISFNMRDEG) * 3 
	    + positif(LIGISFINF8) * 3 
	    + positif(LIGISFNEW) * 2 
            + positif(LIGISFTRCT) + 0 ;

LIGNBPAGESISF = positif( NBLIGNESISF - 41 + 0 ) ;

regle isf 99901:
application : iliad, batch;

LIGISF = (1 - positif(ISF_LIMINF + ISF_LIMSUP)) * present(ISFBASE) * positif(DISFBASE) ;

LIG_AVISISF = (1 - positif(ISF_LIMINF + ISF_LIMSUP)) * present(ISFBASE);

INDIS14 = si (  (V_NOTRAIT+0 = 14)
	     ou (V_NOTRAIT+0 = 16)
	     ou (V_NOTRAIT+0 = 26)
	     ou (V_NOTRAIT+0 = 36)
             ou (V_NOTRAIT+0 = 46)
             ou (V_NOTRAIT+0 = 56)
             ou (V_NOTRAIT+0 = 66)
             )
        alors (1)
        sinon (0)
        finsi;

INDIS26 = si (  (V_NOTRAIT+0 = 26)
	     ou (V_NOTRAIT+0 = 36)
             ou (V_NOTRAIT+0 = 46)
             ou (V_NOTRAIT+0 = 56)
             ou (V_NOTRAIT+0 = 66)
             )
        alors (1)
        sinon (0)
        finsi;

INDCTX23 = si (  (V_NOTRAIT+0 = 23)
                 ou (V_NOTRAIT+0 = 33)
		 ou (V_NOTRAIT+0 = 43)
		 ou (V_NOTRAIT+0 = 53)
		 ou (V_NOTRAIT+0 = 63)
             )
	  alors (1)
	  sinon (0)
	  finsi;

IND9HI0 = INDCTX23 * null( 5-V_IND_TRAIT ) * present(ISFBASE);

LIGISFBASE =  LIGISF * (1 - positif(ANNUL2042)) ;

LIGISFDEC = positif(ISF1) * positif(ISFDEC) * LIGISF * (1 - positif(ANNUL2042)) ;

LIGISFBRUT = positif(ISFBRUT) * (1 - positif(ANNUL2042)) * LIGISF * (1-null(5-V_IND_TRAIT))  
	      * positif(ISFDONF + ISFDONEURO + ISFPMEDI + ISFPMEIN + ISFFIP + ISFFCPI)

	    + positif(ISFBRUT) * (1 - positif(ANNUL2042)) * null(5-V_IND_TRAIT)  
	      * positif(present(ISFDONF) + present(ISFDONEURO)
	                + present(ISFPMEDI) + present(ISFPMEIN) + present(ISFFIP) + present(ISFFCPI));

LIGISFRAN = positif(ISFDONF) * (1 - positif(ANNUL2042)) * (1-null(5-V_IND_TRAIT)) * LIGISF +
            present(ISFDONF) * positif(DISFBASE) * (1 - positif(ANNUL2042)) * null(5-V_IND_TRAIT) ;

LIGISFCEE = positif(ISFDONEURO) * (1 - positif(ANNUL2042)) * (1-null(5-V_IND_TRAIT)) * LIGISF +
            present(ISFDONEURO) * positif(DISFBASE) * (1 - positif(ANNUL2042)) * null(5-V_IND_TRAIT) ;

LIGISFDON = positif(LIGISFRAN + LIGISFCEE) * LIGISF ;

LIGISFPMED = positif(ISFPMEDI) * (1 - positif(ANNUL2042)) * (1-null(5-V_IND_TRAIT)) * LIGISF +
             present(ISFPMEDI) * positif(DISFBASE) * (1 - positif(ANNUL2042)) * null(5-V_IND_TRAIT) ;

LIGISFPMEI = positif(ISFPMEIN) * (1 - positif(ANNUL2042)) * (1-null(5-V_IND_TRAIT)) * LIGISF +
             present(ISFPMEIN) * positif(DISFBASE) * (1 - positif(ANNUL2042)) * null(5-V_IND_TRAIT) * LIGISF ;

LIGISFIP = positif(ISFFIP) * (1 - positif(ANNUL2042)) * (1-null(5-V_IND_TRAIT)) * LIGISF +
           present(ISFFIP) * positif(DISFBASE) * (1 - positif(ANNUL2042)) * null(5-V_IND_TRAIT) ;

LIGISFCPI = positif(ISFFCPI) * (1 - positif(ANNUL2042)) * (1-null(5-V_IND_TRAIT)) * LIGISF +
            present(ISFFCPI) * positif(DISFBASE) * (1 - positif(ANNUL2042)) * null(5-V_IND_TRAIT) ;

LIGISFINV = positif(LIGISFPMED + LIGISFPMEI + LIGISFIP + LIGISFCPI) * LIGISF ;

LIGISFRED = positif(LIGISFINV + LIGISFDON) * LIGISF 
             * (1 - positif(null((CODE_2042 + CMAJ_ISF)- 8) + null(CMAJ_ISF - 34)) * (1 - COD9ZA))  ;

LIGISFREDPEN8 = positif(LIGISFINV + LIGISFDON) * LIGISF 
             * positif(null ((CODE_2042 + CMAJ_ISF)- 8) + null(CMAJ_ISF - 34))
             * (1 - COD9ZA) ;

LIGISFPLAF = positif( ISFPLAF ) * (1-null(5-V_IND_TRAIT))
	     * LIGISF * (1 - positif(ANNUL2042))
	     + present( ISFPLAF )  * positif(DISFBASE) * (1 - positif(ANNUL2042)) * null(5-V_IND_TRAIT) ;

LIGISFE = positif(DISFBASE) * positif(ISFETRANG) 
	  * (1 - positif(ANNUL2042)) * (1-null(5-V_IND_TRAIT)) * LIGISF 
          + positif(DISFBASE) * present(ISFETRANG) 
	  * (1 - positif(ANNUL2042)) * null(5-V_IND_TRAIT) ;

LIGISFIMPU = positif(DISFBASE) * positif(ISFETRANG+ISFPLAF)
            * (1 - positif (ISFDONF + ISFDONEURO + ISFPMEDI + ISFPMEIN + ISFFIP + ISFFCPI)) 
            * LIGISF * (1 - positif(ANNUL2042)) * (1-null(5-V_IND_TRAIT))
	    + positif(DISFBASE) * positif( present(ISFETRANG) + present(ISFPLAF))
            * (1 - positif (ISFDONF + ISFDONEURO + ISFPMEDI + ISFPMEIN + ISFFIP + ISFFCPI)) 
	    * LIGISF * (1 - positif(ANNUL2042)) * null(5-V_IND_TRAIT)
	    * (1-positif(LIGISFRED + LIGISFREDPEN8));

LIGISFCOR =   present(ISF4BIS)*positif(DISFBASE) * positif(PISF)
               * (1 - positif( SEUIL_12 - ISF4BIS)*(1-null(ISF4BIS))) 
	       * (1 - positif(ANNUL2042)) * LIGISF 
	       * (1-positif(V_NOTRAIT-20))
	       + positif(V_NOTRAIT-20) * LIGISF * (1 - positif(ANNUL2042));
	     
LIGISFNOPEN = present(ISF5)*positif(DISFBASE)* (1 - positif(PISF))
		 * (1 - positif(LIGISFCOR))
	         * LIGISF * (1 - positif(ANNUL2042)) ;

LIGISFRET = positif( RETISF) * (1 - positif(ANNUL2042)) * LIGISF 
	    * (1 - positif( SEUIL_12 - ISF4BIS)*(1-null(ISF5)));

LIGNMAJISF1 = positif( NMAJISF1) * (1 - positif(ANNUL2042)) * LIGISF 
	      * (1 - positif( SEUIL_12 - ISF4BIS)*(1-null(ISF5)));

LIGISF17281 = positif( NMAJISF1) * (1 - positif(ANNUL2042)) * LIGISF
               * (1 - positif( SEUIL_12 - ISF4BIS)*(1-null(ISF5)))
               * (1 - positif(V_FLAGR34 + null(CMAJ_ISF - 34))) ;

LIGISF17285 = positif( NMAJISF1) * (1 - positif(ANNUL2042)) * LIGISF
               * (1 - positif( SEUIL_12 - ISF4BIS)*(1-null(ISF5)))
               * positif(V_FLAGR34 + null(CMAJ_ISF - 34)) ;

LIGISF9749 = positif(LIGNMAJISF1) * (1 - positif(LIGISFRET)) ;

LIGISFNET = (positif(PISF)*positif(DISFBASE) * (1-null(5-V_IND_TRAIT))
               * (1 - positif( SEUIL_12 - ISF4BIS)*(1-null(ISF5)))
	       * (1 - positif(ANNUL2042)) * LIGISF 
	     + (null(5-V_IND_TRAIT)) * positif(LIGISFRET + LIGNMAJISF1)
	       * positif(ISFNAP) * (1 - positif( SEUIL_12 - ISFNAP)))
	    * (1 - positif(INDCTX23)) ;

LIGISFZERO = null(ISF5) * (1 - positif(ANNUL2042)) * positif(20-V_NOTRAIT) * LIGISF ;


LIGISFNMR = positif( SEUIL_12 - ISF5) * (1 - null(ISF5)) 
           * (1 - positif(INDCTX23)) * positif(20 - V_NOTRAIT) 
	    * LIGISF * (1 - positif(ANNUL2042)) ;


LIGISFANT =  positif(V_ANTISF) * positif(V_NOTRAIT-20) ; 

LIGISFDEGR = (null(2- (positif(SEUIL_8 - ISFDEGR) + positif_ou_nul(ISF5-SEUIL_12))) 
              + null(V_ANTISF))
	      * INDCTX23 * null(5-V_IND_TRAIT) * (1 - positif(ANNUL2042)) ;

LIGISFDEG = (1 - positif(LIGISFDEGR)) * IND9HI0 * positif(ISFDEG) ; 

LIGISFNMRDEG = (1 - positif(LIGISFDEGR)) * (1 - null(ISF5))
               * positif(SEUIL_12 - ISF4BIS) * positif(DISFBASE) 
	       * INDCTX23 * null(5-V_IND_TRAIT) * (1 - positif(ANNUL2042)) ; 

LIGISF9269 = (1 - positif(LIGISFRET + LIGNMAJISF1)) * (1 - positif( SEUIL_12 - ISFNAP)) * INDIS26 ;

LIGISFNMRIS = positif(SEUIL_12 - ISFNAP) 
	     * INDIS26 * positif(V_NOTRAIT - 20) * (1 - positif(ANNUL2042)) ;

LIGISF0DEG = IND9HI0 * null(ISF4BIS) * (1 - positif(ANNUL2042)) ;

LIGISFINF8 = IND9HI0 * positif(LIGISFDEGR) * (1 - positif(ANNUL2042)) ;


LIGISFNEW = present(ISFBASE) * (1 - positif(20-V_NOTRAIT)) * null(5 - V_IND_TRAIT) * (1 - positif(ANNUL2042)) ;

LIGISFANNUL = present(ISFBASE) * positif(ANNUL2042) ;

