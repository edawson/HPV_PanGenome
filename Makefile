VG:=../bin/vg
WABBIT:=../bin/wabbit
MASH=../bin/mash

all:
	echo "not implemented"

combi:
	mkdir combi && cd combi && ln -s ../ref/*.fa* . && ln -s ../variant/*.fa* .

hpv_pan_sketch.msh: combi
	$(MASH) sketch -s 10000 -k 12 -o $@ combi/*

hpv_close20.txt: combi hpv_pan_sketch.msh
	for i in combi/*; do \
		$(MASH) dist hpv_pan_sketch.msh $$i | sort -n -k 3 | head -n 20 >> $@; done

hpv_pan.vg:
	python 

pan.fq:

pan.gam:

.pre-build:


