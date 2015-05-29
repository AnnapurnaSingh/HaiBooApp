require 'nokogiri'
require 'open-uri'
require 'json'

haikus = {}

(1..36).to_a.map do |num|

  url = "http://haikujournal.org/issue.php?id=#{num}&issue=#{num}"
  doc = Nokogiri::HTML(open(url))

  authors = doc.css('div[align="right"]')
  data = authors.map do |author|
    poem = author.next.next.next.next.next.next
    {
      author: author.text,
      poem: poem.text.split("\r\n")
    }
  end

  haikus[num] = data

  puts data

  sleep 5

end

File.write('haikus.json', haikus.to_json)

#wanna trace one of lines of HaiBoo back to author as well as see the original haiku in entirety(v.2, obvi). Need to further break down into:

# authors = {}
# haikus ={}
#   line1 = {}
#   line2 = {}
#   line3 = {}

# doc.html("<hr/>").each do |item|
#   author = item.at_html("div align="right"").text
#   haikus = item.at_html("div align="center"").text[/[0-9.]+/]
#   line1 = haikus.text.split("<br />")
#   line2 = haikus.text.split("<br />")
#   line3 = haikus.text.split("<br />")
#   authorsNHaikus.merge!(author => haikus)
#   puts "#{author} - #{haikus}"
# end


# File.write('stuff.json', authorsNHaikus.to_json)
# File.write('stuff.json', haikus.to_json)
# File.write('stuff.json', line1.to_json)
# File.write('stuff.json', line2.to_json)
# File.write('stuff.json', line3.to_json)

  #SAMPLE HAIKU BLOCK FROM ISSUE 1:
  # <hr/>
	# <div align="right">Gregory Stenta</div>
	# <br/><br/><br/>
	# <div align="center">moon shines on crushed grass<br />
  #   cat fight finishes my night<br />
  #   old tiger of mine</div>
	# <br/><br/><br/>
	# <hr />
