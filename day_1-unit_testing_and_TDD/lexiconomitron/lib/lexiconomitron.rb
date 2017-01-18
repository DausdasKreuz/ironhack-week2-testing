require 'pry'

class Lexiconomitron
  def eat_t (str)
    str.split("").select {|i| !(i.downcase.include?("t"))}.join
  end

  def do_shazam (str)
    no_t = eat_t(str)
    ret = []
    part = no_t.split(" ")
    rev = []
    part.each do |item|
      rev.push(item.reverse)
    end
    ret.push(rev.first)
    ret.push(rev[-1])
  end

  def oompa_loompa (str)
    no_t = eat_t(str)
    words = no_t.split(" ")
    three_words = words.select {|item| item.length <= 3}
    three_words
  end

end
