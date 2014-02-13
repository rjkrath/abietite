require 'spec_helper'

describe Voter do

  describe 'validations' do
    it { should validate_presence_of(:email) }
  end

end
