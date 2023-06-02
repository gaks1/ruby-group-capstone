require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, last_played_at = DateTime.now, multiplayer = 'false')
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = DateTime.parse(last_played_at.to_s)
  end

  def add_author(author)
    @author = author
  end

  private

  def can_be_archived?
    super && (DateTime.now.year - @last_played_at.year) > 2
  end

  public

  def to_hash
    {
      id: @id,
      last_played_at: @last_played_at,
      publish_date: @publish_date,
      multiplayer: @multiplayer
    }
  end
end
