# формируем колоду
class Cards

  attr_accessor :deck

  def initialize
    @deck = {}
  end

  def create_new_deck  
    
    piks = ['King', 'Dama', 'Valet', 'TYZ']
    masts = ['kresty', 'piki', 'chervy', 'byben']
    masts.each do |mast| 
      i = 2
      while i < 11 
        @deck["#{i}_#{mast}"] = i 
        i += 1
      end
    end
  end




end
