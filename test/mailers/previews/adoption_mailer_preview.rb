# Preview all emails at http://localhost:3000/rails/mailers/adoption_mailer
class AdoptionMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/adoption_mailer/interested
  def interested
    AdoptionMailer.interested
  end

end
