module Notifiers
  class Voter
    def self.notify(offer)
      if offer.derby_entry
        derby_entry.voters.each do |voter|
          ::VoterNotifierMailer.deliver_offer(voter, derby_entry)
        end
      end

    end

  end
end
