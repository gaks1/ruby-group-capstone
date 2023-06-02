require_relative 'game'
require_relative 'author'
require_relative 'game_data_saver'
require_relative 'game_data_loader'
require 'json'
require 'date'

class GameApp
  def initialize
    @authors = DataLoader.load_authors
    @games = DataLoader.load_games
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
      check_multiplayer
    end
  end

  def create_game
    puts 'Publish Date e.g dd/mm/yyyy: '
    publish_date = gets.chomp.to_s
    puts 'Last played date e.g dd/mm/yyyy: '
    last_played = gets.chomp.to_s
    multiplayer = check_multiplayer

    add_game(publish_date, multiplayer, last_played)
  end

  def add_game(publish_date, multiplayer, last_played)
    if authors.empty?
      puts 'No authors found. Please add an author first.'
      add_author(publish_date, multiplayer, last_played)
    else
      puts 'Select an option:'
      puts '1. Choose an existing author'
      puts '2. Add a new author'
      option = gets.chomp.to_i

      case option
      when 1
        display_authors
        puts 'Press the number to select the author.'
        sel_option = gets.chomp.to_i
        create_game_with_author(sel_option, publish_date, multiplayer, last_played)
      when 2
        add_author(publish_date, multiplayer, last_played)
      else
        puts 'Invalid option'
      end
    end
  end

  def add_author(publish_date, multi, last_played)
    puts ''
    puts '.....................'
    puts 'Enter author details'
    puts '.....................'
    puts ''
    puts 'First Name: '
    first_name = gets.chomp
    puts 'Last Name: '
    last_name = gets.chomp
    author = Author.new(first_name: first_name, last_name: last_name)

    game = Game.new(Date.parse(publish_date), last_played, multi)
    author.add_item(game)
    @authors << author
    @games << game
    puts 'Added game successfully'
    puts 'Author added successfully'
  end

  def create_game_with_author(author_index, publish_date, multiplayer, last_played)
    if author_index < 1 || author_index > authors.length
      puts 'Invalid author selection. Try again.'
    else
      author = authors[author_index - 1]

      game = Game.new(Date.parse(publish_date), last_played, multiplayer)
      author.add_item(game)

      games << game

      puts 'Added game successfully'
    end
  end

  def display_authors
    authors.each_with_index do |author, index|
      puts "#{index + 1}. #{author.last_name} #{author.first_name}"
    end
  end

  def save_session_and_exit
    DataSaver.save_games(games)
    DataSaver.save_authors(authors)
  end

  private

  attr_reader :games, :authors
end
