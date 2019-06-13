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
    pl_name = gets.chomp.capitalize!
    p_name = Player.new(pl_name)
    puts "New player was created: #{p_name.player_name}"


  end

  def game_in

    @game_deck.create_new_deck



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
        game_in
     # when 'r' then puts "Blackjack is the American variant of game known as Twenty-One"
     end
    end
  end





end

game = BlackJack.new
game.rounds