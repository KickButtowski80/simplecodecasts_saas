class ContactMailer < ActionMailer::Base
    
    default to:'pazpaz22@yahoo.com'
    def contact_email(name,email,body)
        @name = name
        @email = email
        @body = body 
        
        mail(from:email, subject:"Contact from Message")
    end
end