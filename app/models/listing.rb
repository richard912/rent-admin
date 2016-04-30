class Listing < ActiveRecord::Base
	has_one :listing_pic

	has_attached_file :avatar, 
    :path => ":rails_root/public/listing/:class/:attachement/:id/:basename_:style.:extension",
    :url => "/listing/:class/:attachement/:id/:basename_:style.:extension",
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

  def destroy
  	ListingPic.where('listing_id=?', self.id).destroy_all
  	self.delete
  end

	def activate?
    value = self.status == 'Active' ? 'Inactive' : 'Active'
    self.status = value
    self.save
  end

end
