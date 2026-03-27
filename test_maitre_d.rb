require_relative "test_helper"
require_relative "maitre_d"

class TestMaitreD < Minitest::Test
  def test_single_reservation_within_capacity_is_accepted
    maitre_d = MaitreD.new(table_size: 12)
    candidate = Reservation.new(date: "2023-09-14", quantity: 1)

    assert maitre_d.accept?([], candidate)
  end

  def test_reservation_exceeding_capacity_is_rejected
    maitre_d = MaitreD.new(table_size: 12)
    candidate = Reservation.new(date: "2023-09-14", quantity: 13)

    refute maitre_d.accept?([], candidate)
  end

  def test_reservation_exactly_at_capacity_is_accepted
    maitre_d = MaitreD.new(table_size: 12)
    candidate = Reservation.new(date: "2023-09-14", quantity: 12)

    assert maitre_d.accept?([], candidate)
  end

  def test_no_remaining_seats_after_existing_reservation_is_rejected
    maitre_d = MaitreD.new(table_size: 4)
    existing = [Reservation.new(date: "2023-09-14", quantity: 2)]
    candidate = Reservation.new(date: "2023-09-14", quantity: 3)

    refute maitre_d.accept?(existing, candidate)
  end

  def test_enough_remaining_seats_after_existing_reservation_is_accepted
    maitre_d = MaitreD.new(table_size: 10)
    existing = [Reservation.new(date: "2023-09-14", quantity: 2)]
    candidate = Reservation.new(date: "2023-09-14", quantity: 3)

    assert maitre_d.accept?(existing, candidate)
  end

  def test_multiple_existing_reservations_filling_table_is_rejected
    maitre_d = MaitreD.new(table_size: 10)
    existing = [
      Reservation.new(date: "2023-09-14", quantity: 3),
      Reservation.new(date: "2023-09-14", quantity: 2),
      Reservation.new(date: "2023-09-14", quantity: 3)
    ]
    candidate = Reservation.new(date: "2023-09-14", quantity: 3)

    refute maitre_d.accept?(existing, candidate)
  end

  def test_existing_reservation_on_different_date_does_not_count
    maitre_d = MaitreD.new(table_size: 4)
    existing = [Reservation.new(date: "2023-09-15", quantity: 2)]
    candidate = Reservation.new(date: "2023-09-14", quantity: 3)

    assert maitre_d.accept?(existing, candidate)
  end
end
