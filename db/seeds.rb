require 'json'

data = JSON(File.read('haikus.json'))

data.each do |number, issue|
  issue.each do |poem_entry|

    author_name = poem_entry['author']
    poem_body = poem_entry['poem']


    unless author = Author.find_by({name: author_name})
      author = Author.create({name: author_name})
    end

    Poem.create({
        author: author,
        line_01: poem_body[0],
        line_02: poem_body[1],
        line_03: poem_body[2],
    })

  end
end
