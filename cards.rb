# формируем колоду
class Cards

  attr_accessor :deck, :deck_rand

  def initialize
    @deck = {}
    @game_deck = {}
    @deck_rand = []
  end

  def create_new_deck  
    pics = ['K', 'D', 'V']
    masts = ['+', '^', '<3', '<>']
    #mast_ascii = [60.chr + 51.chr, 43.chr, 60.chr+62.chr, 62.chr+45.chr+62.chr]
    #mast_ascii.each {|x| puts x}
    masts.each do |mast|
      i = 2
      while i < 11 
        @deck["#{i}#{mast}"] = i 
        i += 1
      end

      pics.each do |pic|
        @deck["#{pic}#{mast}"] = 10
      end
    # при проверке суммы изменяем значение, просто выщелкиваем туза
    @deck["TYZ#{mast}"] = 1

    end
    # проверка создания колоды
    puts "New deck created, #{@deck}, #{@deck.size}"
    @deck.each_key { |key| deck_rand << key }
    # проверка создания массива карт 
    puts "New deck_rand created, #{@deck_rand}, #{@deck_rand.size}"
    #@game_deck = @deck
  end

# проверка рэндом выборки. Учесть, что карты отлаживаются по колодам, из основной колоды выщелкиваются
  def random_card
    
    @selected_card = @deck_rand[rand(@deck_rand.size)]
    @deck.delete(@selected_card) 
    
    puts @selected_card
    puts @deck[@selected_card]
    puts @deck.size    
    #puts "deck updated. new deck #{@deck}"
    return @selected_card
  end
end
