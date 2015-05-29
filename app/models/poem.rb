class Poem < ActiveRecord::Base
  belongs_to :author

# only for puts purposes
  def to_s
    [
      self.line_01,
      self.line_02,
      self.line_03,
    ].join("\n")
  end


  def self.write

    poems = self.all.sample(3).shuffle

    [
      poems[0].line_01,
      poems[1].line_02,
      poems[2].line_03,
    ]

  end

end
