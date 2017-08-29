class Category
  attr_accessor :name

  def initialize
    @stories = []    #  has_many stories
  end

  def stories
    @stories.dup.freeze
  end

  def add_story(story) # has_many interface
    raise AssociationTypeMismatchError, "#{story.class} received, Story expected." if !story.is_a?(Story)
    @stories << story
    story.category = self unless story.category == self
  end

  def authors # HAS MANY authors through stories
    self.stories.collect{|s| s.author}.uniq
  end

end # End of Class
