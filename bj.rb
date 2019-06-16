require_relative './player.rb'
require_relative './cards.rb'
require_relative './bank.rb'

class BlackJack

  attr_accessor :player_deck, :dealer_deck, :game_deck

  def initialize
    @player_deck = {}
    @dealer_deck = {}
    @game_deck = Cards.new
    @round_bank = Bank.new

  end

  def player_create
    puts "Enter your name: "
    pl_name = gets.chomp
    @player = Player.new(pl_name)
    puts "New player was created: #{@player.player_name}"
    @dealer = Player.new('Martin')
    puts "You will game with dealer. Dealer: #{@dealer.player_name}"
    puts "Your start moneys is: #{@player.moneys}"
    puts "Dealer start moneys is: #{@dealer.moneys}"
  end

  def random_card2
    size = @game_deck.deck.length
    puts "size = #{size}" 
    @player_deck2 = @game_deck.deck[size.to_s]
    puts "@game_deck.deck  = #{@game_deck.deck['size'] }"
  
    puts "@player_deck2  = #{@player_deck2}"
  
  end

  def state(game_moment)
    puts "|--------------- Game --------------------|"
    puts "|--------------------------Moneys in bank: #{@round_bank}---|"
    puts "| [#{@player.player_name}] moneys:#{@player.moneys} | [#{@dealer.player_name}] moneys:#{@dealer.moneys} |"    
    puts "|--------------- Cards on hands ----------|"
    puts "| [#{@player.player_name}] has |#{@player_deck.keys}| "
    puts "-------------------------------------------"
    if game_moment == 1
      puts "| [#{@dealer.player_name}] has |#{@dealer_deck.keys}| "
    else
      puts "| [#{@dealer.player_name}] has | *** *** | "
    end      
    puts "-------------------------------------------"     
  end

  def menu
    puts "---------- game menu -----------------"
    puts "Enter 'go' to turn in cards"
    puts "Enter 'pass' to pass"    
    puts "Enter 'one' to give one more cards"
    puts "-------------------------------------------"     
  end
  
  def game_process
    # create new deck for game  
    @game_deck.create_new_deck
    # view current state
    
    menu
    
    loop do # process for one game
      
      next_step = gets.chomp
      break if next_step == 'stop' # for my exit from game
      
      case next_step 
        when 'go' then 
          @player.moneys = 90
          @dealer.moneys = 90
          @round_bank = 20
          hand_over_player # first card to player  
          hand_over_dealer # first card to dealer
          hand_over_player # second card to player 
          hand_over_dealer # second card to dealer
          state(0) # view current state (0 - game in, not visible dealer cards.  1 - open cards) 
          points_moneys # calculate points 
           
        when 'pass' then 1 # pass 
          
        when 'one' then 
          hand_over_player
          state(0)
          points_moneys # calculate points 
        when 'test' then puts "test"
          
      #puts "rc = #{@rc}" 
      #rcval = @game_deck.deck[@rc]
      #puts "@game deck.dack = #{@game_deck.deck}"
      #puts "@game deck.deck[rc] = #{@game_deck.deck["#{@rc}"]}"
      
        @player_deck[@random_card] = @random_card_val
        game_deck.deck.delete(@random_card) 
      
        #@dealer_deck << @game_deck.random_card
        #@player_deck << @game_deck.random_card
        #@dealer_deck << @game_deck.random_card
        end
      
    end
     # state
  end

  # calculate
  def points_moneys
    puts "@player.points = #{@player.points}"
    puts "@dealer.points = #{@dealer.points}"
    
    points = 0
    @player_deck.each_value {|value| points = value + points }
    @player.points = points
    
    points = 0
    @dealer_deck.each_value {|value| points = value+points }
    @dealer.points = points
    puts "@player.points (after calculate) = #{@player.points}"
    puts "@dealer.points (after calculate) = #{@dealer.points}"
    
  end
  # hand over card to player
  
  def hand_over_player 
    puts "Players getting 1 random cards..."
    @random_card = @game_deck.random_card # def random card
    random_card_val = @game_deck.deck[@random_card]
    @player_deck[@random_card] = random_card_val
    game_deck.deck.delete(@random_card) 
    puts "@player_deck = #{@player_deck}"

  end

  def hand_over_dealer
    @random_card = @game_deck.random_card # def random card
    random_card_val = @game_deck.deck[@random_card]
    @dealer_deck[@random_card] = random_card_val
    game_deck.deck.delete(@random_card) 
    puts "@dealer_deck = #{@dealer_deck}"
  end
  
  def rounds
    puts "------------ Black Jack ------------"
    loop do
    puts "Do you want to game? (y/n)"
    #puts "Rules... (r)"
    choice = gets.chomp
      break if choice == "n"
      case choice
      when 'y' then
        puts "New game created"
        player_create # creation new player, with own bank
        game_process 
     # when 'r' then puts "Blackjack is the American variant of game known as Twenty-One"
     end
    end
  end





end

game = BlackJack.new
game.rounds
