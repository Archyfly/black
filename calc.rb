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
    @player_deck.each_value {|value| 
      puts "pl points = #{points}"
      puts "pl value = #{value}"
      points += value 
    }
    @player.points = points
    
    points = 0
    @dealer_deck.each_value {|value|
     puts "dl points = #{points}"
      puts "dl value = #{value}"
     points += value
      }
    

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
      @dealer.points
      puts "dealer_points = #{@dealer.points}"
    elsif @aces_dealer == 1 && @dealer.points < 12
      puts "aces_dealer = #{@aces_dealer}"
      @dealer.points = @dealer.points + 10
      puts "dealer_points = #{@dealer.points}"
    elsif @aces_dealer == 2 && @dealer.points < 3
      puts "aces_dealer = #{@aces_dealer}"
      @dealer.points = @dealer.points + 10
      puts "dealer_points = #{@dealer.points}"
    else @aces_dealer > 2
      puts "aces_dealer = #{@aces_dealer}"
      @dealer.points = 21
      puts "dealer_points = #{@dealer.points}"
    end
  end  

  def test_with_aces_player
    if @aces_player == 0
      puts "aces_player = #{@aces_player}"
      @player.points
      puts "player_points = #{@player.points}"
    elsif @aces_player == 1 && @player.points < 12 #??????????? 
      puts "aces_player = #{@aces_player}"
      puts "player_points = #{@player.points}"
    elsif @aces_player == 2 && @player.points < 3
      puts "aces_player = #{@aces_player}"
      @player.points = @player.points + 10
      puts "player_points = #{@player.points}"
    else @aces_player > 2
      puts "aces_player = #{@aces_player}"
      @player.points = 21
      puts "player_points = #{@player.points}"
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

