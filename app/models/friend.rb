class Friend < ActiveRecord::Base
  attr_accessible :name, :avatar
  validates_presence_of :name

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  },
   :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => "/images/:id/:style.:extension"
end
