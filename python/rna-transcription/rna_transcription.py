def to_rna(dna_strand):
    t = { "G": "C", "C": "G", "T": "A", "A": "U" }
    return "".join([t[n] for n in dna_strand])
