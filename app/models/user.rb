class User < ActiveRecord::Base
    
    attr_accessible :email , :password, :password_confirmation
    has_many :books , :dependent => :destroy
    before_validation :downcase_email
    has_secure_password  
    validates_presence_of :password, :on => :create 
    validates :email, :presence => true, :uniqueness => true,
                      :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i} 
    validates :password,  :length => { :in => 6..20 , :too_short => "must have at least %{count} characters" , :too_long  => "must have at most %{count} characters"}

    private

    ## method to turn email into lower case characters
    def downcase_email
      self.email = self.email.downcase if self.email.present?
    end

end
