HPV Pangenome
------------
Eric Dawson

### Data provenance:
Type genomes were scraped from: [PAVE reference genomes](https://pave.niaid.nih.gov/#explore/reference_genomes/human_genomes) programatically using the scrape.py script.
They can also be downloaded directly from PAVE it turns out.

Variant genomes were scraped from: [PAVE variant genomes ](https://pave.niaid.nih.gov/#explore/variants/variant_genomes) using the scrape.py script.

### Quick Stats:
HPV: Human Papilloma Virus, a double-stranded DNA virus.  
Approximate size of HPV genome: approximately 8kb (reference genomes ~7000 - ~8500)  
Number of HPV genome sequences: 307  
Number of HPV "types": 197  
Number of HPV variants: 135  

197 + 137 != 307...
These sequences appear in both:  
        Genitaltype_.gb60955.fa
        Human11_PPH11.gb333026.fa
        Human16_PPH16.gb333031.fa
        Human26_.gb396956.fa
        Human30_.gb396973.fa
        Human31_PPH31A.gb333048.fa
        Human33_PPH33CG.gb333049.fa
        Human34_.gb396989.fa
        Human35H_.gb396997.fa
        Human45_.gb397022.fa
        Human52_.gb397038.fa
        Human53_.gb397046.fa
        Human54_HPU37488.gb1017782.fa
        Human56_.gb397053.fa
        Human58_PPH58.gb222386.fa
        Human61_HPU31793.gb1020282.fa
        Human66_HPU31794.gb1020290.fa
        Human67_.gb3228267.fa
        Human69_.gb6970418.fa
        Human70_HPU21941.gb1173493.fa
        Human73_.gb1491692.fa
        Human82_.gb6970427.fa
        Humancomplete_.gb4574720.fa
        Humantype_.gb557236.fa
        Humantype_PPHDNA.gb333087.fa


There are also additional sequences available in Nucleotide (use search query `"Papillomaviridae"[Organism] AND complete genome[Title] AND "human"[Title]` ).
These have been included as a single Fasta file (all_HPV_nucleotide.fa); it contains 1,128 full-genome sequences.

### HPV Taxonomy
Types differ by at least 10% sequence divergence.  
Subtypes differ by 2-10%.  
Variants differ by less than 2% sequence divergence to a known type.
More info [at PAVE](https://pave.niaid.nih.gov/#explore/taxonomy/taxonomy_concept)

### What is a "PanGenome"
A pangenome is a structure which stores the information present in multiple genomes
in a way that is useful for genomic analyses. A Mash sketch is a pangenome,
as is a Cortex cDBG, as is a variation graph.

### Building a pangenome with Mash

### Building a pangenome with vg
We could just build a giant graph that contains all sequences, but we'd like to collapese areas of common sequence into common paths.
This is also a non-trivial task, as the sequences can be quite divergent.

We can generate a more compact graph  by collapsing all subtypes into their corresponding type. To do so, we'll run a wrapper script
that preclusters sequences with Mash, then runs a graph assembly on all sequences within a certain Jaccard distance.
