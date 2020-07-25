class Address < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end