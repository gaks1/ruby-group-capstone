require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, last_played_at = Time.now.strftime('%d/%m/%Y'), multiplayer = 'false')
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @archived = archived
  end

  def add_author(author)
    @author = author
  end

  private

  def can_be_archived?
    super && (Date.today.year - Date.parse(@last_played_at).year) > 2
  end
end