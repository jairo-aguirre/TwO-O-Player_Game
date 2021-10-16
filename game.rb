require_relative './player'

class Game
  def initialize
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @players = [@player1, @player2]
    # @turn = 1
  end

  def get_player_on_turn
    @players.first
  end

  def get_player_on_deck
    @players.last
  end

  def set_turn
      # puts
      # puts "------------- Turn ##{@turn} ------------------"
      # puts
      # @turn += 1
      @players.rotate!
  end

  def game_over
    # @players.select {|player| player.dead?}.count > 0
    # @players.select {|player| player.dead? == true}
    @player1.dead? || @player2.dead?
  end

  def math_question
    addends = Array.new()
    addends.push(rand(1..20))
    addends.push(rand(1..20))
    addends.push(addends.reduce(0, :+))
  end

  def winner!
    winner = @players.select {|player| player.lives > 0}
    puts winner[0].name
  end

  def play
    puts 'TwO-O-Player Math Game!'
    # puts game_over
    until game_over do
      puts '----- NEW TURN -----'

      player_on_turn = get_player_on_turn
      player_on_deck = get_player_on_deck
      
      player_on_turn.gives_a_try(math_question)
      
      puts "#{player_on_turn.name}: #{player_on_turn.lives}/3 vs #{player_on_deck.name}: #{player_on_deck.lives}/3"
      
      set_turn
    end

    winner!
  end
end