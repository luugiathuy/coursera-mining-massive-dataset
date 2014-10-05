require 'matrix'

module PageRankHelper
  def self.solve_page_rank_equation(m, r0, beta, sum_rank = 1)
    tax_value = ((1-beta) / r0.size) * (sum_rank / 1)
    tax_vector = Vector.elements(Array.new(r0.size, tax_value))
    i = 0
    r = r0.clone
    loop do
      i = i + 1
      r_new = beta * m * r + tax_vector
      e = r_new - r
      r = r_new
      print i, ": ", r, "\n"
      break unless e.r > 1e-10
    end
    return r
  end
end
