module CalcPoints
 
  attr_accessor :points, :aces

  def calc_points
    puts @points = 0
    puts @player.points
    puts @dealer.points
    #aces
  end

   # calculate
  def points_moneys
    puts "@player.points = #{@player.points}"
    puts "@dealer.points = #{@dealer.points}"
    
    points = 0
    @player_deck.each_value {|value| points += value }
    @player.points = points
    
    points = 0
    @dealer_deck.each_value {|value| points += value }
    @dealer.points = points
    puts "@player.points (after calculate) = #{@player.points}"
    puts "@dealer.points (after calculate) = #{@dealer.points}"
    self.aces
  end

  def aces
    @aces_player = 0
    @aces_dealer = 0
    @player_deck.each_key { |key| @aces_player = @aces_player + 1 if key.include?("TYZ") } 
    @dealer_deck.each_key { |key| @aces_dealer = @aces_dealer + 1 if key.include?("TYZ") } 
          
    puts "@aces_player =  #{@aces_player}"
    puts "@aces_dealer =  #{@aces_dealer}"
  end

end

