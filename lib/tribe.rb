require 'colorizr'

class Tribe
  attr_reader :name, :members

  def initialize(options = {})
    @name = options[:name]
    @members = options[:members]
    announce_tribe
  end

  def announce_tribe
    puts "\nThe #{@name.capitalize} Tribe has been formed.".yellow
  end

  def announce_member_voted_out(member)
    puts "#{member.to_s.capitalize.red} has been voted out."
  end

  def to_s
    @name
  end

  def tribal_council(options = {})
    council_has_spoken = false
    while council_has_spoken == false do
      chosen_member = @members.sample
      if chosen_member != options[:immune]
        @members.delete(chosen_member)
        council_has_spoken = true
      end
    end
    announce_member_voted_out(chosen_member)
    return chosen_member
  end
end
