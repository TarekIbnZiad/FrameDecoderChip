#------------------------src-----------------------------#
all: src_syf src.pat src_asimut src_boom src_boog src_loon src_formal_check src_placement src_routing src_extraction src_verification src_chip_layout src_symbolic2real 

src_syf          : srca.vbe \
                 srcj.vbe \
                 srcm.vbe \
                 srco.vbe \
                 srcr.vbe
	@echo "<-- Generated!"

src_asimut       : srca.pat \
                 srcj.pat \
                 srcm.pat \
                 srco.pat \
                 srcr.pat
	@echo "<-- Behavioral Simulation1 Done!"

src_boom         : srca_b.vbe srcj_b.vbe srcm_b.vbe srco_b.vbe srcr_b.vbe 
	@echo "<-- Boolean Network Optimization Done!"

ac_boom_asimut   : srca_b.pat srcj_b.pat srcm_b.pat srco_b.pat srcr_b.pat
	@echo "<-- Behavioral Simulation2 Done!"

src_boog         : srca_b.vst srcj_b.vst srcm_b.vst srco_b.vst srcr_b.vst
	@echo "<-- Logical Synthesis Done!"

ac_boog_asimut   : srca_b_net.pat srcj_b_net.pat srcm_b_net.pat srco_b_net.pat srcr_b_net.pat
	@echo "<-- Netlist Simulation1"

src_loon         : srca_b_l.vst srcj_b_l.vst srcm_b_l.vst srco_b_l.vst srcr_b_l.vst
	@echo "<-- Netlist Delay Optimization Done!"

ac_loon_asimut   : srca_b_l_net.pat srcj_b_l_net.pat srcm_b_l_net.pat srco_b_l_net.pat srcr_b_l_net.pat
	@echo "<-- Netlist Simulation2"

src_formal_check : srco_b_l_net.vbe
	@echo "<-- Formal Checking Done!"

ac_delay_asimut  : srco_b_l_net.pat
	@echo "<-- Delay Simulation Done!"

src_placement    : src_placement.ap 
	@echo "<-- Placement Done!" 

src_routing      : src_routing.ap 
	@echo "<-- Routing Done!" 

src_extraction   :src_extraction.al   
	@echo "<-- Netlist Extraction Done!" 

src_verification :src_verif
	@echo "<-- Post-Layout Verification Done!" 

src_chip_layout  : src_chip_layout.ap
	@echo "<-- Chip Assembly Done!" 

src_symbolic2real: sym2real
	@echo "<-- Symbolic to Real Conversion Done!" 

clean :
	rm -f *.vbe *.pat *_boom.out *_boog.out *b.vst *.xsc *.enc *_loon.out *b_l.vst *_flatbeh.out *_proof.out *.ap *.al *.drc *.cif
	@echo "<-- Clean all results"

#------------Finite State Machine Synthesis-----------------#

srca.vbe: src.fsm
	@echo "    Encoding Synthesis -> srca.vbe"
	syf -CEV -a src
 
srcj.vbe: src.fsm
	@echo "    Encoding Synthesis  -> srcj.vbe"
	syf -CEV -j src
 
srcm.vbe: src.fsm
	@echo "    Encoding Synthesis  -> srcm.vbe"
	syf -CEV -m src
 
srco.vbe: src.fsm
	@echo "    Encoding Synthesis  -> srco.vbe"
	syf -CEV -o src
 
srcr.vbe: src.fsm
	@echo "    Encoding Synthesis  -> srcr.vbe"
	syf -CEV -r src

#-----------Behavioral Simulation1--------------------------#

src.pat : patterns.c
	@echo "    Stimuli generation of patterns"
	genpat -v patterns

srca.pat: srca.vbe src.pat
	@echo "    Encoding Simulation -a -> srca.pat"
	asimut -zerodelay -b srca src srca
 
srcj.pat: srcj.vbe src.pat
	@echo "    Encoding Simulation -j -> srcj.pat"
	asimut -zerodelay -b srcj src srcj
 
srcm.pat: srcm.vbe src.pat
	@echo "    Encoding Simulation -m -> srcm.pat"
	asimut -zerodelay -b srcm src srcm
 
srco.pat: srco.vbe src.pat
	@echo "    Encoding Simulation -o -> srco.pat"
	asimut -zerodelay -b srco src srco
 
srcr.pat: srcr.vbe src.pat
	@echo "    Encoding Simulation -r -> srcr.pat"
	asimut -zerodelay -b srcr src srcr

#------------Boolean network optimization--------------------#

%_b.vbe: %.vbe
	@echo "    Boolean Optimization -> $@"
	boom -V -d 50 $* $*_b > $*_boom.out

#------------Behavioral Simulation2--------------------------#

%_b.pat: %.vbe %.pat
	@echo "    Behavioral Simulation2 -> $@"
	asimut -nores -b $*_b $*

#------------Logical Synthsis--------------------------------#

%.vst: %.vbe paramfile.lax 
	@echo "    Logical Synthsis -> $@"
	boog -l paramfile $* > $*_boog.out

#------------Netlist Simulation1-----------------------------#
#MBK_IN_LO=vst
%_b_net.pat: %_b.vbe %.pat
	@echo "    Netlist Simulation1 -> $@"
	asimut -nores -zerodelay $*_b $*

#------------Netlist Delay Optimization----------------------#
#MBK_OUT_LO=vst
%_l.vst: %.vst paramfile.lax 
	@echo "    Netlist Optimization -> $@"
	loon $* $*_l paramfile > $*_loon.out

#------------Netlist Simulation2-----------------------------#

%_b_l_net.pat: %_b_l.vst %.pat
	@echo "    Netlist Simulation2 -> $@"
	asimut -nores -zerodelay $*_b_l $*
 
#------------Netlist Checking--------------------------------#

%_b_l_net.vbe: %_b_l.vst %.vbe
	@echo "    Formal Checking -> $@"
	flatbeh $*_b_l $*_b_l_net > $*_flatbeh.out
	proof -d $* $*_b_l_net > $*_proof.out

#------------Delay Simulation--------------------------------#

%_b_l_net.pat: %_b_l.vst %.pat
	@echo "    Delay Simulation -> $@"
	asimut $*_b_l $* result_delay

#------------Placement---------------------------------------#

src_placement.ap: srco_b_l.vst paramfile.ioc 
	@echo "    Placement -> $@"
	ocp -v -ring -ioc paramfile srco_b_l srco_layout

#------------Routing-----------------------------------------#

src_routing.ap: srco_layout.ap srco_b_l.vst  
	@echo "    Routing -> $@"
	nero -V -p srco_layout srco_b_l srco_b_l

#------------Netlist Extraction------------------------------#
#MBK_OUT_LO=al
src_extraction.al: srco_b_l.ap   
	@echo "    Extraction -> $@"
	cougar -v srco_b_l srco_b_l_extract

#------------Post-Layout Verification------------------------#
#RDS_TECHNO_NAME=techno-symb.rds
src_verif: srco_b_l.vst srco_b_l_extract.al  
	@echo "    Verifying -> $@"
	lvx vst al srco_b_l srco_b_l_extract 

#------------Chip Assembly-----------------------------------#
src_chip_layout.ap: chip.vst  
	@echo "    Assembling -> $@"
	ring chip srco_chip

#------------S2R Conversion----------------------------------#
#RDS_TECHNO_NAME=techno-035.rds
sym2real: srco_chip.ap 
	@echo "    Converting -> $@"
	s2r -v -r srco_chip


