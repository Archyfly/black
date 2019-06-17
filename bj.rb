require_relative './player.rb'
require_relative './cards.rb'
require_relative './bank.rb'
require_relative './calc.rb'

class BlackJack
  include CalcPoints
  ACE = /(?i)(\W|^)(TYZ)(\W|$)/
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
    puts "--- What is your next step ? ------"
    puts "Enter 'one' to give one more cards"
    puts "Enter 'pass' to pass"
    puts "Enter 'open' to open cards"
    puts "-------------------------------------------"     
  end
  
  # RESET for one round
  def game_init
    state(0)
    @game_deck.create_new_deck
    @player_deck = {}
    @dealer_deck = {}
    @player.points = 0
    @dealer.points = 0
  end


  def game_process
  # create new deck for game  
  game_init
  # withdraw 10
  @player.moneys = @player.moneys - 10
  @dealer.moneys = @dealer.moneys - 10
  @round_bank = 20
    
  hand_over_player # first card to player  
  hand_over_dealer # first card to dealer
  hand_over_player # second card to player 
  hand_over_dealer # second card to dealer
  
  # view current state (0 - game in, not visible dealer cards.  1 - open cards) 
  state(0) 
  
  # process for one game
  # show menu for player next step    
  menu
  next_step = gets.chomp
  case next_step 
    when 'one' then 
      hand_over_player
      state(0)
      # dealer game - calc points for player and dealer. test dealer points, hand over card to dealer  if points < 17, else open cards
      points_moneys # calculate points 
      aces
      open_cards     
    when 'pass' then 1 # pass 
      # dealer game - calc points for player and dealer. test dealer points, hand over card to dealer  if points < 17, else open cards  
      open_cards
    when 'open' then 
      open_cards
      points_moneys
      aces
    end

  puts "Next round ? (yes/no)"
  next_round = gets.chomp
  case next_round 
    when 'yes' then game_process 
    when 'no' then rounds
    end
  end
  
  # hand over card to player
  def hand_over_player 
    puts "Player getting 1 random card..."
    @random_card = @game_deck.random_card # def random card
    random_card_val = @game_deck.deck[@random_card]
    @player_deck[@random_card] = random_card_val # to player
    @game_deck.deck.delete(@random_card) 
    puts "@player_deck = #{@player_deck}"

  end

  # hand over card to dealer
  def hand_over_dealer
    puts "Dealer getting 1 random card..."
    @random_card = @game_deck.random_card # def random card
    random_card_val = @game_deck.deck[@random_card]
    @dealer_deck[@random_card] = random_card_val # to dealer
    @game_deck.deck.delete(@random_card) 
    puts "@dealer_deck = #{@dealer_deck}"
  end
  
  # calc for dealer
  

  def open_cards
    puts "Open cards"
    state(1)
    aces
    points_moneys
    test_with_aces_dealer
    test_with_aces_player
    if @player.points > @dealer.points
      puts "Player #{@player.player_name} WIN!"
      @player.moneys = @player.moneys + @round_bank
    elsif @player.points < @dealer.points
      puts "Dealer #{@dealer.player_name} WIN!"
      @dealer.moneys = @dealer.moneys + @round_bank
    else @player.points == @dealer.points
      puts "Dealer #{@dealer.player_name} and player #{@player.player_name} has equally points. Draw..."
    end
    @round_bank = 0   
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
