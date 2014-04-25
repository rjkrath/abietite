require 'spec_helper'

describe DailyOffer do

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image_path) }
    it { should validate_presence_of(:offer_link) }
    it { should validate_presence_of(:price) }

    it { should validate_presence_of(:author) }
  end

  describe '.find_or_create' do
    let!(:offer) { FactoryGirl.create(:daily_offer) }

    context 'when the daily offer already exists' do
      it 'returns the offer' do
        new_offer =
        expect(DailyOffer.find_or_create(title: offer.title)).to eq(offer)
      end
    end

    context 'when the daily offer does not already exist' do
      context 'when the author does not exist' do
        let(:attributes) do
          {
            title: 'Moo',
            image_path: 'Path',
            offer_link: 'Link',
            price: '$15.00',
            author: { name: 'My Moo', catalog_link: 'Link' }
          }
        end

        it 'creates the author' do
          DailyOffer.stub(:create)

          expect{
            DailyOffer.find_or_create(attributes)
          }.to change{ Author.count }.by(1)
        end

        it 'assigns that author to the offer' do
          offer = DailyOffer.find_or_create(attributes)

          expect(offer.author.name).to eq('My Moo')
        end
      end

      context 'when the derby entry does not exist' do
        it 'does not assign a derby entry to the offer' do

        end
      end

      context 'when the derby entry and the author exist' do
        it 'creates the offer with the proper attributes' do

        end
      end
    end
  end

end
