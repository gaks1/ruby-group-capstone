require './item'

class Game < Item
  attr_accessor :platform, :last_played_at

  def initialize(name, platform, last_played_at)
    super(name)
    @platform = platform
    @last_played_at = last_played_at
  end

  def can_be_archived?
    parent = super
    (parent && (Time.now - last_played_at) > (2 * 365 * 24 * 60 * 60))
  end
end
