require 'spec_helper'

describe DerbyEntry do

  describe 'validations' do
    it { should validate_presence_of(:entry_id) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image_path) }
    it { should validate_presence_of(:vote_count) }
    it { should validate_presence_of(:entered_at) }

    it { should allow_value('23089').for(:entry_id) }
    it { should_not allow_value('not a number').for(:entry_id) }
  end

end
