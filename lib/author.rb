class Author
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
      story.author = self unless story.author == self
    end

    def bibliography
      self.stories.collect {|s| s.name} # You need all stories to be instances of Story because they must respond to #
      # @stories.collect(&:name)  Symbol to Proc
    end

    def categories # HAS MANY categories
      self.stories.collect{|s| s.category}.uniq
    end


end # End of Class
