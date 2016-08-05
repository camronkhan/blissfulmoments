class Message

	include ActiveModel::Model
	include ActiveModel::Conversion
	include ActiveModel::Validations

	attr_accessor :name, :email, :content

	# Validations
	validates :name, presence: true
	validates :email, presence: true
	validates :content, presence: true

end