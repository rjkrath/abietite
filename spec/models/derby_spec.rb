require 'spec_helper'

describe Derby do

  describe 'validations' do
    it { should validate_presence_of(:derby_id) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:end_at) }
    it { should validate_presence_of(:begin_at) }
  end

end
