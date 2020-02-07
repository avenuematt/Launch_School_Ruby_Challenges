class InvalidCodonError < StandardError; end

class Translation
  CODONS = { 'AUG' => 'Methionine', 'UUU' => 'Phenylalanine',
             'UUC' => 'Phenylalanine', 'UUA' => 'Leucine',
             'UUG' => 'Leucine', 'UCU' => 'Serine', 'UCC' => 'Serine',
             'UCA' => 'Serine', 'UCG' => 'Serine', 'UAU' => 'Tyrosine',
             'UAC' => 'Tyrosine', 'UGU' => 'Cysteine', 'UGC' => 'Cysteine',
             'UGG' => 'Tryptophan', 'UAA' => 'STOP' , 'UAG' => 'STOP',
             'UGA' => 'STOP' }

  def self.of_codon(codon)
    CODONS.fetch(codon) { fail InvalidCodonError }
  end

  def self.of_rna(strand)
    strand.scan(/.{3}/).each_with_object([]) do |codon, res|
      curr = of_codon(codon)
      return res if curr == 'STOP'
      res << curr
    end
  end
end
