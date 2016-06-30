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

  def delete(member)
    @members.delete(member)
  end

  def tribal_council (options={})
    @members.reject { |member| member == options[:immune] }.sample
  end

end
