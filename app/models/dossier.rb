class Dossier < ActiveRecord::Base
	after_create :initialize_state
  attr_accessible :description, :title, :state

  validates_presence_of :title, :description

  has_many :registers, :dependent => :destroy

	def recent_register
		self.registers.order("date_register DESC").limit(1).first 	
	end  

  private

  def initialize_state
  	self.state = "Abierto"
  	self.save
  end

end
