require 'spec_helper'

describe Author do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:catalog_link) }
  end

  describe '.find_or_create' do
    context 'when the author already exists' do
      let(:author) { FactoryGirl.create(:author) }

      it 'returns the existing author' do
        expect(Author.find_or_create(name: author.name)).to eq(author)
      end
    end

    context 'when the author does not exist' do
      it 'creates a new author' do
        expect{
          Author.find_or_create(name: 'Mr Moo', catalog_link: 'link')
        }.to change{Author.count}.by(1)
      end
    end
  end
end
