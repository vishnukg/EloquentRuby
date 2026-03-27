require_relative "reservation"


class MaitreD
  attr_reader :table_size

  def initialize(table_size:)
    @table_size = table_size
  end

  def accept?(existing_reservations, candidate)
    reserved = existing_reservations
      .select { |r| r.date == candidate.date }
      .sum(&:quantity)

    reserved + candidate.quantity <= table_size
  end
end
