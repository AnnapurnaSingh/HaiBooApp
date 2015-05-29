require 'nokogiri'
require 'open-uri'

class Poet

  def initialize
    doc = Nokogiri::HTML(open("http://www.toyomasu.com/haiku"))

    poems = doc.css('li').map do |poem|
      poem.text.split("\n\n\n")[0..2]
    end

    @poems = poems[44..93]
  end


  def write
    3.times.map do |num|
      @poems.sample[num]
    end
  end

end


# How do use
anna = Poet.new
anna.write
