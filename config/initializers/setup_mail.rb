ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "greenmediaagency.com",
  :user_name            => "notifications@greenmediaagency.com",
  :password             => "w3lcom3Gr33n",
  :authentication       => "plain",
  :enable_starttls_auto => true
}