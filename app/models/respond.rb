class Respond < ActiveRecord::Base
  attr_accessible :date_respond, :description, :number_quit, :register_id, :assets_attributes

  belongs_to :register

  validates_presence_of :date_respond, :description, :register_id

  # For Assets
  has_many :assets, :dependent => :destroy
  accepts_nested_attributes_for :assets, :allow_destroy => :true
end
