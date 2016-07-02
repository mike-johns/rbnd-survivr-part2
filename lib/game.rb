class Game
  def initialize(tribe_one, tribe_two)
    @tribes = [tribe_one, tribe_two]
  end
  def tribes
    @tribes
  end
  def add_tribe(tribe)
    @tribes << tribe
    @tribes
  end
  def immunity_challenge
    @tribes.sample
  end
  def clear_tribes
    @tribes.clear
  end
  def merge(new_name)
    all_members = []
    @tribes.each do |tribe|
      tribe.members.each do |contestant|
        all_members << contestant
      end
    end
    Tribe.new :name => new_name, :members => all_members
  end
  def individual_immunity_challenge
    x = Random.new
    @tribes[x.rand(@tribes.size)].members.sample
  end
end
