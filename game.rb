require './item'
require 'date'

class Game < Item
  attr_accessor :platform, :last_played_at

  def initialize(publish_date, last_played_at = Time.now.strftime('%d/%m/%Y'), platform = 'false', archived = 'false')
    super(publish_date, archived: archived)
    @platform = platform
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    super && (Date.today.year - Date.parse(@last_played_at).year) > 2
  end
end
