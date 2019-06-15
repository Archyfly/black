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

  def graph
    puts "|--------------- Game --------------------|"
    puts "| [#{@player.player_name}] moneys:#{@player.moneys} | [#{@dealer.player_name}] moneys:#{@dealer.moneys} |"    
    puts "|--------------- Cards on hands ----------|"
    puts "| [#{@player.player_name}] has |#{@player_deck}| "
    puts "-------------------------------------------"
    puts "| [#{@dealer.player_name}] has |#{@dealer_deck}| "
    puts "-------------------------------------------"     
    
    #puts "________________________________"
  end

  def game_process
    # create deck  
    @game_deck.create_new_deck
    graph
    loop do
    # 2 random cards to players
      
      puts "Players getting 2 random cards..."
      @rc = @game_deck.random_card
      puts "rc = #{@rc}" 
      rcval = @game_deck.deck[@rc]
      puts "@game deck.dack = #{@game_deck.deck}"
      puts "@game deck.deck[rc] = #{@game_deck.deck["#{@rc}"]}"
      
        @player_deck[@rc] = rcval
        game_deck.deck.delete(@rc) 
      
        #@dealer_deck << @game_deck.random_card
        #@player_deck << @game_deck.random_card
        #@dealer_deck << @game_deck.random_card
        
      next_step = gets.chomp
      break next_step = 'final'
    end
      graph
    
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
