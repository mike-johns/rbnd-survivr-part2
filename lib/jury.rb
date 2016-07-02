class Jury
  def initialize
    @members = []
  end

  def add_member(contestant)
    @members << contestant
  end

  def members
    @members
  end

  def members=(val)
    @members = val
  end

  def create_final_vote_array(finalists)
    @votes = []
    finalists.each do |finalist|
      @votes << [finalist, 0]
    end
  end

  def create_results_hash
    vote_hash = {}
    @votes.each do |finalist, total|
      vote_hash[finalist] = total
    end
    vote_hash
  end

  def place_random_votes
    random_number = Random.new
    @members.each do |jury_member|
      chosen_finalist_index = random_number.rand(@votes.size)
      @votes[chosen_finalist_index][1] += 1
      puts "#{jury_member.to_s.capitalize.white} casts a vote for #{@votes[chosen_finalist_index][0].to_s.capitalize.green} to win!"
    end
  end

  def cast_votes(finalists)
    create_final_vote_array(finalists)
    place_random_votes
    create_results_hash
  end

  def report_votes(results)
    results.each do |finalist, vote_count|
      puts "#{finalist.to_s.capitalize}: #{vote_count} votes"
    end
  end

  def announce_winner(results)
    results.each do |finalist, vote_count|
      if vote_count >= 4
        puts "\nThe winner is... #{finalist.to_s.capitalize}!\n".green
        return finalist
      end
    end
  end
end
