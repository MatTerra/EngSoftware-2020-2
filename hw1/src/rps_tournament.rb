require_relative './rock_paper_scissors'

class RockPaperScissorsTournament
  def rps_tournament_winner(tournaments)
    if RockPaperScissorsGame.is_game(tournaments[0])
      return RockPaperScissorsGame.new.rps_game_winner(
        [RockPaperScissorsGame.new.rps_game_winner(tournaments[0]),
         RockPaperScissorsGame.new.rps_game_winner(tournaments[1])])
    end
    RockPaperScissorsGame.new.rps_game_winner(
      [self.rps_tournament_winner(tournaments[0]),
       self.rps_tournament_winner(tournaments[1])]
    )
  end
end
