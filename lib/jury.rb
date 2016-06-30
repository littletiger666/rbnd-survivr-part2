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
      @finalists[finalist.name] = 0
    end

    @members.each do |member|
      random = finalists.sample.name
      puts "#{member} voted for #{random}".green
      @finalists[random] += 1
    end
    return @finalists
  end

  def report_votes (finalists)
    finalists.each do |finalist|
      puts "#{finalist[0]} gets #{finalist[1]} votes!".light_red
    end
  end

  def announce_winner (result)
    result.each do |vote|
      if vote[1] >= 4
        winner = vote[0]
        puts "The final winner is #{winner}!".magenta
        return winner
      end
    end
  end

end
