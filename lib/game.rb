class Game
  attr_accessor :tribes
  def initialize (tribe_1, tribe_2)
    @tribes = [tribe_1, tribe_2]
  end


  def add_tribe (tribe_3)
    @tribes << tribe_3
  end

  def immunity_challenge
    Tribe.new
  end

  def clear_tribes
    @tribes.clear
  end

  def merge (tribe)
    Tribe.new(name:"merged_tribe", members: (@tribes.first.members + @tribes.last.members).sample(12))
  end

  def individual_immunity_challenge
    Contestant.new("immunity")
  end
end
