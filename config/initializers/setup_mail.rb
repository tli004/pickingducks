ActionMailer::Base.smtp_settings = {
  :address                => "smtp.gmail.com",
  :port                   => "587",
  :domain                 => "pickingduck.com",
  :user_name              => "cwood32k",
  :password               => "I like money!",
  :authentication         => "plain",
  :enable_starttls_auto   => true
}

ActionMailer::Base.default_url_options[:host] = "192.168.153.128:3000"
