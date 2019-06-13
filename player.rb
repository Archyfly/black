# class player for name, bank
class Player
  attr_accessor :player_name, :moneys, :player_deck

  def initialize(player_name)
    @player_name = player_name
    @player_moneys = 100
    @player_deck = {}
  end  
end
