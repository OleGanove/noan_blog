class Contact < MailForm::Base
  attribute :name, 		:validate => true
  attribute :email,		:validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message, 	:validate => true
  attribute :nickname,	:captcha  => true
  
  def headers 
  	{
  	:subject => "Kontakt Formular",
  	:to => "noginator@gmx.de",
  	:from => %("#{name}" <#{email}>)
  	}
  end
end