describe Category do
  let(:story){Story.new.tap{|s| s.name = "The Old Man and the Sea"}}
  let(:category){Category.new.tap{|c| c.name = "Fiction"}}
  it 'has a name' do
    #Expectation
    expect(category.name).to eq("Fiction")
  end

  describe '#stories' do
    it 'has an empty array of stories when initialized' do
      expect(category.stories).to match_array([])
    end
    it 'returns a frozen copt of the stories array' do

      expect(category.stories).to be_frozen
    end
  end


  describe '#add_story' do
    it 'can push story instances onto it' do
      category.add_story(story)

      expect(category.stories).to include(story)
    end
    it "reciprocates assigning this author as the story's author" do
      category.add_story(story)

      expect(story.category).to eq(category)
    end
    it 'only allows stories to be pushed onto it' do

    end
  end

  context 'has many authors through stories' do
    it 'returns the collection of unique category instances based on the stories' do
      king = Author.new{|c| c.name = "Stephen King"}
      patterson = Author.new{|c| c.name = "John Patterson"}

      story_1 = Story.new.tap{|s| s.name = "It"; s.author = king}
      story_2 = Story.new.tap{|s| s.name = "Mystery"; s.author = patterson}
      story_3 = Story.new.tap{|s| s.name = "A Moveable Feast"; s.author = patterson}

      category.add_story(story_1)
      category.add_story(story_2)
      category.add_story(story_3)

      expect(category.authors).to match_array([king, patterson])
    end
  end
end # End of Describe CategorCategory
