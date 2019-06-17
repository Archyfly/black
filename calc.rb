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
    
  end

  def aces
    @aces_player = 0
    @aces_dealer = 0
    @player_deck.each_key { |key| @aces_player = @aces_player + 1 if key.include?("TYZ") } 
    @dealer_deck.each_key { |key| @aces_dealer = @aces_dealer + 1 if key.include?("TYZ") } 
          
    puts "@aces_player =  #{@aces_player}"
    puts "@aces_dealer =  #{@aces_dealer}"
  end

  def test_with_aces_dealer
    if @aces_dealer == 0
      puts "aces_dealer = #{@aces_dealer}"
      @dealer_points
      puts "dealer_points = #{@dealer_points}"
    elsif @aces_dealer == 1 && @dealer_points <= 11 
      puts "aces_dealer = #{@aces_dealer}"
      hand_over_dealer
      puts "dealer_points = #{@dealer_points}"
    elsif @aces_dealer == 2 && @dealer_points < 3
      puts "aces_dealer = #{@aces_dealer}"
      @dealer_points = @dealer_points + 10
      puts "dealer_points = #{@dealer_points}"
    else @aces_dealer > 2
      puts "aces_dealer = #{@aces_dealer}"
      @dealer_points = 21
      puts "dealer_points = #{@dealer_points}"
    end
  end  

  def test_with_aces_player
    if @aces_player == 0
      puts "aces_player = #{@aces_player}"
      @player_points
      puts "player_points = #{@player_points}"
    elsif @aces_player == 1 && @player_points <= 11 
      puts "aces_player = #{@aces_player}"
      puts "player_points = #{@player_points}"
    elsif @aces_player == 2 && @player_points < 3
      puts "aces_player = #{@aces_player}"
      @player_points = @player_points + 10
      puts "player_points = #{@player_points}"
    else @aces_player > 2
      puts "aces_player = #{@aces_player}"
      @player_points = 21
      puts "player_points = #{@player_points}"
    end
  end  
        

  def calc_dealer
    if @dealer.points < 17
      hand_over_dealer
    else
      open_cards
    end
  end

end

