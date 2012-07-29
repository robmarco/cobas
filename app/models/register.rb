class Register < ActiveRecord::Base
  attr_accessible :date_register, :description, :number_enter, 
  								:time_respond, :who, :avatars_attributes

  has_many :responds, :dependent => :destroy

  validates_presence_of :date_register, :description, :time_respond, :who

  # For avatars
  has_many :avatars, :dependent => :destroy
  accepts_nested_attributes_for :avatars, :allow_destroy => :true

  def days_until_respond
		(d = ((self.date_register + self.time_respond) - Date.today).to_i) < 0 ? 0 : d
  end

end
