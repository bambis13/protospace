class Tag < ActiveRecord::Base
  has_many :tags_maps, dependent: :destroy
  has_many :prototypes, through: :tags_maps
end
