

vg=~/sandbox/vg/bin/vg

rm random.fa*
cd ref
cat `ls | grep ".fa$" | shuf ` > random.fa && sed -i '/^\s*$/d' random.fa
mv random.fa ../
cd ../
${vg} msga -C -D -f random.fa -X 3 -K16 -B 1000 -t 4 -P 0.2 > random.vg
