class Book < ActiveRecord::Base
  belongs_to :user
  attr_accessible :desc, :state, :title , :photo , :user
  has_attached_file :photo, :styles => { :small => "300x300>" },
                  :url  => "/assets/books/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/books/:id/:style/:basename.:extension"

validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end


