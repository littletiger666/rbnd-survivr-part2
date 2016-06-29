class Game
  attr_accessor :tribes
  def initialize (tribe_1, tribe_2)
    @tribes = [tribe_1, tribe_2]
  end


  def add_tribe (tribe)
    @tribes << tribe
  end

  def immunity_challenge
    @tribes.sample
  end

  def clear_tribes
    @tribes.clear
  end

  def merge (tribe)
    merged_tribe = Tribe.new(name:tribe, members: (merged_members))
    clear_tribes
    add_tribe(merged_tribe)
    return @tribes.first
  end

  def merged_members
    members = []
    @tribes.each {|tribe| members << tribe.members.map { |member| member }}
    return members.flatten!
  end

  def individual_immunity_challenge
    merged_members.sample
  end
end
