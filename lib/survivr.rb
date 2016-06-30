require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"
require 'colorizr'


#After your tests pass, uncomment this code below
#=========================================================
# Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
#
# Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
  8.times do
    lost_tribe = @borneo.immunity_challenge
    puts "#{lost_tribe} lost!".green
    person = lost_tribe.tribal_council
  end
end

def phase_two
  3.times do
    winner = @borneo.individual_immunity_challenge
    puts "#{winner} is the winner!".blue
    person = @merge_tribe.tribal_council (options={immune: winner})
  end
end

def phase_three
  7.times do
    winner = @borneo.individual_immunity_challenge
    puts "#{winner} is the winner!".blue
    person = @merge_tribe.tribal_council (options={mmune: winner})
    @jury.add_member(person)
    puts "#{person} is lost and moved to the jury!".light_yellow
  end
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
# @borneo.tribes.first.members.each {|member| puts member.to_s}
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
# finalists.each {|member| puts member.to_s}
vote_results = @jury.cast_votes(finalists) #Jury members report votes
# puts vote_results
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
