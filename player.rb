# class player for name, bank
class Player
  attr_accessor :player_name, :moneys

  def initialize(player_name)
    @player_name = player_name
    @moneys = 100
    
  end  
end
