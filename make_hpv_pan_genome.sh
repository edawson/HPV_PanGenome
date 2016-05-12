

vg=../vg/bin/vg

rm random.fa*
cd ref
## TODO We need to implement shuffling of these fastas
cat `ls | grep ".fa$"` > random.fa && sed -i '/^\s*$/d' random.fa
mv random.fa ../
cd ../
${vg} msga -C -D -f random.fa -X 2 -K16 -B 256 -t 4 -P 0.75 > random.vg
