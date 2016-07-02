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
  def to_s
    @name
  end
  def tribal_council(options = {})
    council_has_spoken = false
    while council_has_spoken == false do
      chopping_block = @members.sample
      if chopping_block != options[:immune]
        @members.delete(chopping_block)
        council_has_spoken = true
      end
    end
    puts "#{chopping_block.to_s.capitalize.red} has been voted out."
    return chopping_block
  end
end
