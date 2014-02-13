require 'spec_helper'

describe DerbyEntry do

  describe 'validations' do
    it { should validate_presence_of(:entry_id) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image_path) }
    it { should validate_presence_of(:vote_count) }
    it { should validate_presence_of(:entered_at) }
  end

end
