class Tribe
  attr_reader :name
  attr_accessor :members
  def initialize (options={})
    @name = options[:name]
    @members = options[:members]
    puts "Tribe:#{@name}\n Heros:#{@members.map {|member| member.to_s}}".red
  end

  def to_s
    @name
  end

  def tribal_council (options={})
    person = @members.reject { |member| member == options[:immune] }.sample
    @members.delete (person)
    puts "#{person} has been eliminated!".light_red
    return person
  end

end
