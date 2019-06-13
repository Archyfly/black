# формируем колоду
class Cards

  attr_accessor :deck

  def initialize
    @deck = {}
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
  end

end
