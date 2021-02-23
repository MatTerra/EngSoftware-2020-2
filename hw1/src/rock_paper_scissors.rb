class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

class RockPaperScissorsGame

  def initialize
    @strategies = ["R", "P", "S"]
  end

  def rps_game_winner(game)
    @game = game
    raise WrongNumberOfPlayersError unless @game.length == 2
    @game.each() do |player|
      raise NoSuchStrategyError unless has_valid_strategy(player)
    end

    if player_2_wins
      return @game[1]
    end
    @game[0]
  end

  def self.is_game(game)
    return game[0][0].is_a?(String)
  end

  private

  def player_2_wins
    get_strategy_value(get_player_strategy(2)) \
      == get_strategy_value(get_player_strategy(1)) + 1 \
    or get_strategy_value(get_player_strategy(2)) + 2 \
      == get_strategy_value(get_player_strategy(1))
  end

  def get_strategy_value(strategy)
    @strategies.index(strategy)
  end

  def get_player_strategy(player)
    @game[player-1][1].capitalize
  end

  def has_valid_strategy(player)
    @strategies.include? player[1].capitalize
  end

end