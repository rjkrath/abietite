require 'spec_helper'

describe VoterNotifierMailer do

  describe '#offer' do
    it 'assigns the voter' do

    end

    it 'assigns the entry' do

    end

    describe 'email' do
      let(:voter) { FactoryGirl.create(:voter, email: 'me@me.com') }
      let(:entry) { double('entry', title: 'title') }
      let!(:mail) { VoterNotifierMailer.offer(voter, entry) }

      it "sends the email to the voter's email" do
        expect(mail.to).to include('me@me.com')
      end

      it 'has a static subject' do

      end
    end
  end


end
