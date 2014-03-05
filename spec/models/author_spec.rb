require 'spec_helper'

describe Author do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:catalog_link) }
  end

end
