class VoterNotifierMailer < ActionMailer::Base

  default from: "me@voting.com"

  def offer(voter, entry)
    @voter = voter
    @entry = entry

    mail(to: voter.email, subject: 'New offer')
  end
end
