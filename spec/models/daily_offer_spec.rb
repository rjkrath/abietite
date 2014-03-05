require 'spec_helper'

describe DailyOffer do

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image_path) }
    it { should validate_presence_of(:offer_link) }
    it { should validate_presence_of(:price) }

    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:derby_entry) }
  end

end
