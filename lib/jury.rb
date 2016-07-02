class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(contestant)
    @members << contestant
  end

  def cast_votes(finalists)
    votes = Hash.new
    finalists.each { |finalist| votes[finalist] = 0 }
    @members.each do |member|
      vote = finalists.sample
      puts "#{member.to_s.capitalize.white} casts a vote for #{vote.to_s.capitalize.green} to win!"
      votes[vote] += 1
    end
    votes
  end

  def report_votes(results)
    results.each do |finalist, vote_count|
      puts "#{finalist.to_s.capitalize}: #{vote_count} votes"
    end
  end

  def announce_winner(results)
    winner = results.max_by { |k, v| v }[0]
    puts "\nThe winner is... #{winner.to_s.capitalize}!\n".green
    winner
  end
end
