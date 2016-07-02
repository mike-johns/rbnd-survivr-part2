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

  def cast_votes(finalists)
    # Create array to hold each finalist's votes
    votes = []
    finalists.each do |finalist|
      votes << [finalist, 0]
    end

    # Each member randomly votes for one of the finalists
    random_vote = Random.new
    @members.each do |member|
      x = random_vote.rand(2)
      votes[x][1] += 1
      puts "#{member.to_s.capitalize.white} casts a Final Jury vote for #{votes[x][0].to_s.capitalize.green}"
    end

    # Also store results in hash to satisfy tests
    vote_hash = {}
    votes.each do |finalist, total|
      vote_hash[finalist] = total
    end
    vote_hash
  end

  def report_votes(results)
    results.each {|finalist, vote_count| puts "#{finalist.to_s.capitalize}: #{vote_count} votes"}
  end

  def announce_winner(results)
    results.each do |finalist, vote_count|
      if vote_count >= 4
        puts "\nThe winner is... #{finalist.to_s.capitalize}!".green
        return finalist
      end
    end
  end
end
