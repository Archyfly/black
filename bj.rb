require_relative './player.rb'
require_relative './cards.rb'
require_relative './bank.rb'

class BlackJack

  attr_accessor :player_deck, :dealer_deck, :game_deck

  def initialize
    @player_deck = {}
    @dealer_deck = {}
    @game_deck = Cards.new
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

  def state
    puts "|--------------- Game --------------------|"
    puts "| [#{@player.player_name}] moneys:#{@player.moneys} | [#{@dealer.player_name}] moneys:#{@dealer.moneys} |"    
    puts "|--------------- Cards on hands ----------|"
    puts "| [#{@player.player_name}] has |#{@player_deck}| "
    puts "-------------------------------------------"
    puts "| [#{@dealer.player_name}] has |#{@dealer_deck}| "
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
    # state 
    loop do # process for one game
      next_step = gets.chomp
      break if next_step == 'stop' # for my exit from game
      case next_step 
        when 'go' then turn_in_cards

        when 'pass' then 1 # pass 
        
        when 'one' then 1 # one more cards
      
      #puts "rc = #{@rc}" 
      #rcval = @game_deck.deck[@rc]
      #puts "@game deck.dack = #{@game_deck.deck}"
      #puts "@game deck.deck[rc] = #{@game_deck.deck["#{@rc}"]}"
      
        @player_deck[@rc] = rcval
        game_deck.deck.delete(@rc) 
      
        #@dealer_deck << @game_deck.random_card
        #@player_deck << @game_deck.random_card
        #@dealer_deck << @game_deck.random_card
        end
      
    end
     # state
  end
  
  def turn_in_cards
    puts "Players getting 2 random cards..."
    @rc = @game_deck.random_card # def random card
    rcval = @game_deck.deck[@rc]
    @player_deck[@rc] = rcval
    game_deck.deck.delete(@rc) 
    puts "@player_deck = #{@player_deck}"
    @rc = @game_deck.random_card # def random card
    rcval = @game_deck.deck[@rc]
    @dealer_deck[@rc] = rcval
    game_deck.deck.delete(@rc) 
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
