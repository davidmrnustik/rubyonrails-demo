class UserMailer < ActionMailer::Base
  default from: "david@serviciografico.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contactus.subject
  #
  def contactus
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.newsletter.subject
  #
  def newsletter(movie, user)
    @movie = movie
    @greeting = "Hi"

    mail  to: user.email,
          from: "david@serviciografico.com",
          subject: "A movie: #{@movie.proper_name}:"
  end
end
