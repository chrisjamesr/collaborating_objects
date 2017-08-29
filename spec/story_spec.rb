describe Story do
  let(:story){Story.new.tap{|s| s.name = "The Old Man and the Sea"}}
  let(:author){Author.new.tap{|a| a.name = "Ernest Hemmingway"}}
  let(:category){Category.new.tap{|c| c.name = "Fiction"}}


  it 'has a name' do

    expect(story.name).to eq("The Old Man and the Sea")
  end

  context 'with an author' do
    describe '#author='do
      it 'can set an author' do
        story.author = author
        expect(story.author).to eq(author)
      end
      it 'throws an error if you assign anything besides an instance of Author' do
        expect{story.author = "Ernest Hemmingway"}.to raise_error(AssociationTypeMismatchError)
      end

      it 'reciprocates the story into the authors stories collection' do
        story.author = author

        expect(author.stories).to match_array([story])
      end
    end
  end

  context 'with a category' do
    describe '#category='do
      it 'can set an category' do
        story.category = category
        expect(story.category).to eq(category)
      end
      it 'throws an error if you assign anything besides an instance of Category' do
        expect{story.category = "Fiction"}.to raise_error(AssociationTypeMismatchError)
      end

      it 'reciprocates the story into the category stories collection' do
        story.category = category

        expect(category.stories).to match_array([story])
      end
    end
  end
end  # end of Describe Story
