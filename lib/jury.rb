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
    votes = []
    finalists.each do |finalist|
      votes << [finalist, 0]
    end
    random_vote = Random.new
    @members.each do |member|
      x =random_vote.rand(2)
      votes[x][1] += 1
      puts "#{member.to_s}: #{votes[x][0].to_s}"
    end
    vote_hash = {}
    votes.each do |finalist, total|
      vote_hash[finalist] = total
    end
    vote_hash
  end
  def report_votes(results)
    results.each {|k, v| puts "#{k.to_s}: #{v} votes"}
  end
  def announce_winner(results)
    results.each do |k, v|
      return k if v >= 4
    end
  end
end
