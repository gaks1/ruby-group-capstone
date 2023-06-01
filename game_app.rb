require_relative 'author'
require_relative 'game'

class GameApp

  def initialize
    @games = []
    @authors = []
  end


  def  list_authors
    puts 'No authors added yet!' if authors.empty?
    authors.each_with_index do |author, index|
      puts "#{index + 1} Name: #{author.name}"
    end
  end

  def list_games
    puts 'No games added yet!' if games.empty?
    games.each do |game|
      puts "Published on: #{game.publish_date}"
      puts "Platform: #{game.platform}"
      puts "Last played on: #{game.last_played_at}"
      puts ''
    end
  end

  def check_multiplayer
    puts 'Is this a multiplayer game?'
    puts '1. Yes'
    puts '2. No'
    option = gets.chomp.to_i
    if option == 1
      'Multiplayer'
    else
      'Singleplayer'
    end
  end


  def create_game()
    puts 'Publish Date e.g dd/mm/yyyy: '
    publish_date = gets.chomp
    puts 'Last played date e.g dd/mm/yyyy: '
    last_played_at = gets.chomp
    platform = check_multiplayer
    game = Game.new(publish_date, platform, last_played_at)
    @games << game
  end  

  def add_author
    puts ''
    puts '.....................'
    puts 'Enter author name:'
    puts '.....................'
    puts ''
    puts 'First Name: '
    first_name = gets.chomp
    puts 'Last Name: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    game = Game.new(publish_date, platform, last_played_at)
    @games << game
    game.add_author(author)
    @authors << author
    puts '====================='
    puts 'Author added successfully'
  end

  def select_author()
    puts '*Press* 1 to add new author for the game or *Press* 2 to select an existing author'
    author_option = gets.chomp.to_i
    if author_option == 1
      add_author(publish_date, platform, last_played_at)
    elsif author_option == 2
      puts 'Select an author:'
      authors.each_with_index do |author, index|
        puts "#{index + 1} Name: #{author.name}"
      end
      author_index = gets.chomp.to_i
      game = Game.new(publish_date, platform, last_played_at)
      @games << game
      game.add_author(authors[author_index - 1])
      puts '====================='
      puts 'Author added successfully'
    else
      puts 'Invalid choice'
    end
  end


  def add_game()
    if @authors.empty?
      puts ''
      puts 'No authors added yet!'
      add_author(publish_date, platform, last_played_at)
    else
      select_author(publish_date, platform, last_played_at)
    end
    end

end
