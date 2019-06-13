require_relative './player.rb'
require_relative './cards.rb'
require_relative './bank.rb'

class BlackJack

  attr_accessor :player_deck, :dealer_deck, :game_deck

  def initialize
    @player_deck = []
    @dealer_deck = []
    @game_deck = Cards.new
  end

  def player_create
    puts "Enter your name: "
    pl_name = gets.chomp
    @player = Player.new(pl_name)
    puts "New player was created: #{@player.player_name}"
    @dealer = Player.new('Martin')
    puts "You will game with dealer. Dealer: #{@dealer.player_name}"
    puts "Your start bank is: #{@player.moneys}"
    puts "Dealer start bank is: #{@dealer.moneys}"
  end

  def graph
    puts "_____________________ Game ______________"
    puts "_[#{@player.player_name}]_current moneys:#{@player.moneys}_|_[#{@dealer.player_name}]_current moneys:#{@dealer.moneys}_"    
    puts "_____________________ decks _____________"
    puts "_[#{@player_deck}]_____________________|______________[#{@dealer_deck}]______________"    
    
    puts "________________________________"
  end

  def game_process
    # create deck  
    @game_deck.create_new_deck
    graph

    # 2 random cards to players
    @player_deck << @game_deck.random_card
    @dealer_deck << @game_deck.random_card
    
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
