class User < ActiveRecord::Base
	def activate?
    value = self.status == 'Active' ? 'Inactive' : 'Active'
    self.status = value
    self.save
  end
end
