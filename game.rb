require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date, :authors

  def initialize(publish_date, last_played_at, multiplayer = 'false', _authors = [])
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at.to_s)
  end

  def add_author(author)
    @author = author
  end

  private

  def can_be_archived?
    super && (DateTime.now.year - @last_played_at.year) > 2
  end
end
