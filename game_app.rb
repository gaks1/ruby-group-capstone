require_relative 'game'
require_relative 'author'

class GameApp
  def initialize
    @authors = []
    @games = []
  end

  def list_authors
    if @authors.empty?
      puts 'No authors found'
    else
      puts 'Authors: '
      @authors.each { |author| puts "Fullname: #{author.last_name} #{author.first_name} " }
    end
  end

  def list_games
    puts 'No games found.' if @games.empty?
    @games.each do |game|
      puts "Published on : #{game.publish_date}"
      puts "Last Played on : #{game.last_played_at}"
      puts "Multiplayer? : #{game.multiplayer}"
      puts '.....................'
    end
  end

  def check_multiplayer
    puts 'Is the game multiplayer [Y/N]: '
    val = gets.chomp.upcase
    case val
    when 'Y'
      true
    when 'N'
      false
    else
      puts 'Invalid selection, please type either Y or N to proceed'
      check_permission
    end
  end

  def create_game
    puts 'Publish Date e.g dd/mm/yyyy: '
    publish_date = gets.chomp.to_s
    puts 'Last played date e.g dd/mm/yyyy: '
    last_played = gets.chomp.to_s
    multiplayer = check_multiplayer
  
    puts 'Enter author details:'
    puts 'First Name: '
    first_name = gets.chomp
    puts 'Last Name: '
    last_name = gets.chomp
    game = Game.new(publish_date, last_played, multiplayer)
    game.add_author(Author.new(first_name, last_name))
    @games << game
    puts 'Added game successfully'
  end  
  
  

  def add_author(publish_date, multi, lastplayed)
    puts ''
    puts '.....................'
    puts 'Enter author details'
    puts '.....................'
    puts ''
    puts 'First Name: '
    firstname = gets.chomp
    puts 'Last Name: '
    lastname = gets.chomp
    author = Author.new(first_name: firstname, last_name: lastname)
    game = Game.new(publish_date, lastplayed, multi)
    @games << game
    game.add_author(author)
    @authors << author
    puts '====================='
    puts 'Author added successfully'
  end

  def select_author_option(publish_date, multi, lastplayed)
    puts '*Press* 1 to add new author for the game or *Press* 2 to select from list of authors'
    author_option = gets.chomp.to_i
    if author_option == 1
      add_author(publish_date, multi, lastplayed)
    elsif author_option == 2
      display_authors
      puts ''
      puts 'Press the number to select the author.'
      sel_option = gets.chomp.to_i
      create_game(sel_option, publish_date, multi, lastplayed)
    else
      puts 'Invalid option selected, Try again'
      select_author_option
    end
  end

  def add_game(publish_date, multi, lastplayed)
    if @authors.empty?
      puts ''
      puts 'No authors found. Please add an author first.'
      add_author(publish_date, multi, lastplayed)
    else
      select_author_option(publish_date, multi, lastplayed)
    end
  end

  def display_authors
    @authors.each_with_index do |author, index|
      puts "#{index + 1}. #{author.last_name} #{author.first_name}"
    end
  end
end
