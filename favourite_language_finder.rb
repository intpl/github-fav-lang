require 'github_api'

class FavouriteLanguageFinder
  def initialize(name)
    github_repos = Github.repos.list user: name

    language_numbers = github_repos.map(&:language).compact
    @results = count_occurrences(language_numbers)
  end

  def most_used
    @results.first.first
  end

  private def count_occurrences(arr)
    counts = Hash.new 0
    arr.each { |i| counts[i] += 1 }
    counts.sort_by {|k,v| v}.reverse
  end
end
