class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(distance)
    total = 0
    # parallel assignment not good for rubocop...noted for future solves
    shorter, longer = @strand, distance
    longer, shorter = shorter, longer if @strand.size > distance.size

    shorter.chars.each_with_index do |value, idx|
      total += 1 if value != longer[idx]
    end

    total
  end
end
