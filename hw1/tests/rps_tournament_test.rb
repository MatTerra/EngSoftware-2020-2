require 'test/unit'
require_relative '../src/rps_tournament'

class TestRPSTournament < Test::Unit::TestCase
  def test_two_games()
    assert_equal(["p4", "s"],
                 RockPaperScissorsTournament.new.rps_tournament_winner(
                   [[["p1", "p"], ["p2", "r"]], [["p3", "p"], ["p4", "s"]]]
                 ))
  end
  def test_four_games()
    assert_equal(["p4", "s"],
                 RockPaperScissorsTournament.new.rps_tournament_winner(
                   [[[["p1", "p"], ["p2", "r"]], [["p3", "p"], ["p4", "s"]]],
                    [[["p12", "p"], ["p22", "r"]], [["p32", "p"], ["p42", "s"]]]]
                 ))
  end
  def test_more_games()
    assert_equal(["p4", "s"],
                 RockPaperScissorsTournament.new.rps_tournament_winner(
                   [[[[["p1", "p"], ["p2", "r"]], [["p3", "p"], ["p4", "s"]]],
                     [[["p11", "p"], ["p21", "r"]], [["p31", "p"], ["p41", "s"]]]],
                    [[["p12", "p"], ["p22", "r"]], [["p32", "p"], ["p42", "s"]]]]
                 ))
  end
end