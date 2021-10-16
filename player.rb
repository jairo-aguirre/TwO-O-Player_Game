class Player
  attr_reader :name
  attr_accessor :score, :lives

  def initialize(name)
    @name = name
    @score = 0
    @lives = 1
  end

  def gives_a_try(question)
    # puts "#{self.name}: What does #{question[0]} plus #{question[1]} equal?"
    puts "#{name}: What does #{question[0]} plus #{question[1]} equal?"
    
    answer = gets.chomp.to_i

    if answer == question[2]
      puts 'Yes! You are correct.'
      # @score += 1
    else
      puts 'Seriously? No!'
      @lives -= 1
    end

    # self.makes_shot(score)
  end
  
  # def makes_shot(points)
  #   puts "#{self.name} is scoring #{points} points"
  #   @score += points
  # end

  def dead?
    @lives == 0
  end
end