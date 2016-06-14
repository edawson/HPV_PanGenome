VG:=../../bin/vg
WABBIT:=../../bin/vw

train_me_hpv16.fq:
	if [-e jobfile.txt ]; then $(RM) jobfile.txt; fi
	for i in `ls | grep '\.fa$$' | grep -v "fai" `; do \
		echo "../../scripts/make_reads.sh $$(pwd)/$$i" >> jobfile.txt; done
	python ../../LaunChair/launcher.py -i jobfile.txt -c 1 && $(RM) jobfile.txt
	cat n*.fq | ../../scripts/remove_numbers.sh | ../../scripts/shuf.py > $@

hpv16_pan.vg:
	$(VG) msga -D -L 10 -B 128 $$(echo -n $$(for i in *.fa; do echo -n "-f $$i "; done))  > $@
	$(VG) index -x hpv16_pan.xg -g hpv16_pan.gcsa -k 11 hpv16_pan.vg

train_me_hpv16.gam: train_me_hpv16.fq
	$(VG) map -x hpv16_pan.xg -g hpv16_pan.gcsa -t 1 -B 128 -L 10 -f $< > $@

train_me_hpv16.vecs.txt: train_me_hpv16.gam train_me_hpv16.fq
	$(VG) vectorize -w -i -M hpv16_mappings.text -x hpv16_pan.xg $< > $@

trained_hpv16_model.model: train_me_hpv16.vecs.txt train_me_hpv16.gam hpv16_pan.vg train_me_hpv16.fq
	if [-e .cache ]; then rm .cache; fi  && head -n 1000 $< | $(WABBIT) --ect 10 --binary --passes=20 -f $@ --cache_file .cache

test_hpv16.pred.txt: trained_hpv16_model.model train_me_hpv16.vecs.txt train_me_hpv16.gam hpv16_pan.vg train_me_hpv16.fq
	cat train_me_hpv16.vecs.txt |  $(WABBIT) -i $< -p /dev/stdout | tee test_hpv16.pred.txt | python ../../scripts/make_confusion_matrix.py --classes hpv16_mappings.text

minion_hpv16.pred.txt: trained_hpv16_model.model train_me_hpv16.vecs.txt train_me_hpv16.gam hpv16_pan.vg train_me_hpv16.fq
	cat minion_hpv16. |  $(WABBIT) -i $< -p /dev/stdout | tee test_hpv16.pred.txt | python ../../scripts/make_confusion_matrix.py --classes hpv16_mappings.text
