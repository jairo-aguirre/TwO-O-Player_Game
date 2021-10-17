class Player
  attr_reader :name
  attr_accessor :score, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def gives_a_try(question)
    puts "#{name}: What does #{question[0]} plus #{question[1]} equal?"
    
    answer = gets.chomp.to_i

    if answer == question[2]
      puts 'Yes! You are correct.'; puts
    else
      puts 'Seriously? No!'; puts
      @lives -= 1
    end
  end
  
  def dead?
    @lives == 0
  end
end