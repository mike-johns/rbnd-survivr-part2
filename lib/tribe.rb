class Tribe
  attr_reader :name, :members
  def initialize(options = {})
    @name = options[:name]
    @members = options[:members]
    puts @name
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
    return chopping_block
  end
end
