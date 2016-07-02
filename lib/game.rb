class Game
  def initialize(tribe_one, tribe_two)
    @tribes = [tribe_one, tribe_two]
  end

  def tribes
    @tribes
  end

  def add_tribe(tribe)
    @tribes << tribe
  end

  # Choose a winning Tribe from the @tribes array
  def immunity_challenge
    @tribes.sample
  end

  def clear_tribes
    @tribes.clear
  end

  # Create one new Tribe from all remaining Contestants
  def merge(new_name)
    combined_members = @tribes.map(&:members).flatten
    clear_tribes
    merged_tribe = Tribe.new :name => new_name, :members => combined_members
    add_tribe(merged_tribe)
    merged_tribe
  end

  # Choose an immunity-winning member from the remaining Tribes.
  def individual_immunity_challenge
    @tribes.sample.members.sample
  end
end
