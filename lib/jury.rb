class Jury
  attr_accessor :members
  def initialize
    @members = []
  end
  def add_member (member)
    @members << member
  end
  def cast_votes (finalists)
    @finalists = Hash.new
    finalists.each do |finalist|
      @finalists[finalist] = 0
    end

    @members.each do |member|
      random = finalists.sample
      puts "#{member} voted for #{random}"
      @finalists[random] += 1
    end
    return @finalists
  end

  def report_votes (final_votes)
    final_votes.each do |finalist|
      puts "#{finalist} gets #{final_votes[finalist]}"
    end
  end

  def announce_winner (final_votes)
    final_votes.first[0]
  end

end
