class AdoptionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.adoption_mailer.interested.subject
  #
  def interested(contact_data)
    @contact = contact_data
    @animal = Animal.find(@contact[:animal_id])
    mail to: @animal.user.email, subject: "Interesse em adotar #{@animal.name}"
  end
end