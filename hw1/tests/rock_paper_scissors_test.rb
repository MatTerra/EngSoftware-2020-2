require 'test/unit'
require_relative '../src/rock_paper_scissors'

class TestRPSGame < Test::Unit::TestCase
  def test_raise_if_more_than_2_players()
    assert_raise(WrongNumberOfPlayersError) do
      RockPaperScissorsGame.new.rps_game_winner([[], [], []])
    end
  end

  def test_raise_if_strategy_invalid()
    assert_raise(NoSuchStrategyError) do
      RockPaperScissorsGame.new.rps_game_winner([["p1", "r"],
                                                 ["p2", "d"]])
    end
  end

  def test_first_wins_if_same()
    assert_equal(["p1", "R"],
                 RockPaperScissorsGame.new.rps_game_winner([["p1", "R"],
                                                            ["p2", "r"]]))
  end

  def test_paper_win_rock()
    assert_equal(["p2", "p"],
                 RockPaperScissorsGame.new.rps_game_winner([["p1", "r"],
                                                            ["p2", "p"]]))
  end

  def test_scissors_win_paper()
    assert_equal(["p2", "s"],
                 RockPaperScissorsGame.new.rps_game_winner([["p1", "p"],
                                                            ["p2", "s"]]))
  end

  def test_rock_win_scissors()
    assert_equal(["p2", "r"],
                 RockPaperScissorsGame.new.rps_game_winner([["p1", "s"],
                                                            ["p2", "r"]]))
  end
end