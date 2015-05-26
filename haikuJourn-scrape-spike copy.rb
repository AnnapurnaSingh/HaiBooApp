require 'nokogiri'
require 'open-uri'

class Poet

  def initialize
    doc = Nokogiri::HTML(open("http://haikujournal.org/e-issues/"))

    # poems = doc.css('div align="center"').map do |poem|
    #   poem.text.split("<br>")[0..2]
    # end
    #
    # @poems = poems[44..93]
    #
    # author = doc.css('div align="right"').map do |author|
    #   @author = author
    # end

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
