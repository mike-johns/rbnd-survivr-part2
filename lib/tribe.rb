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
end
