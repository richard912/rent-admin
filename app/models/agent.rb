class Agent < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, 
    :path => ":rails_root/public/system/:class/:attachement/:id/:basename_:style.:extension",
    :url => "/system/:class/:attachement/:id/:basename_:style.:extension",
    :styles => {
      :thumb    => ['100x100#',  :jpg, :quality => 70],
      :preview  => ['480x480#',  :jpg, :quality => 70],
      :large    => ['600>',      :jpg, :quality => 70],
      :retina   => ['1200>',     :jpg, :quality => 30]
    },
    :convert_options => {
      :thumb    => '-set colorspace sRGB -strip',
      :preview  => '-set colorspace sRGB -strip',
      :large    => '-set colorspace sRGB -strip',
      :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
    }

  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
  # validates_attachment :avatar,
  #   :presence => true,
  #   :size => { :in => 0..10.megabytes },
  #   :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }

  # validates :name,
  #   :presence => true,
  #   :uniqueness => true

  def activate?
    value = self.status == 'Active' ? 'Inactive' : 'Active'
    self.status = value
    self.save
  end

end
