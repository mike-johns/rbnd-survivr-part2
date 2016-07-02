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
    vote_hash = {}
    finalists.each do |finalist|
      vote_hash[finalist] = 3.5
    end
    @members.each {|member| puts member.to_s}
    vote_hash
  end
  def report_votes(results)
    results.each {|k, v| puts "#{k.to_s}: #{v}"}
  end
  def announce_winner(results)
    results.each do |k, v|
      return k if v >= 4
    end
  end
end
