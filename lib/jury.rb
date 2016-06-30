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
      puts "#{member} voted for #{random}".green
      @finalists[random] += 1
    end
    return @finalists
  end

  def report_votes (finalists)
    finalists.each_pair {|finalist, votes| puts "#{finalist} got #{votes} votes".light_red}
  end

  def announce_winner (result)
    winner = result.max_by{|finalist, votes| votes}.first
    puts "The final winner is #{winner}!".magenta
    return winner
  end

end
