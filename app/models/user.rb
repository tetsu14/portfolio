class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :validatable
  has_many :notes
  has_many :likes
  has_many :like_notes, through: :likes, source: :note
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true

  has_many :relationships, foreign_key: :follower_id
  has_many :inverse_follows, foreign_key: :following_id, class_name: Relationship
  has_many :inverse_follows, foreign_key: :following_id, class_name: Relationship
  has_many :followers, through: :inverse_follows
	def set_image(file)
	  if !file.nil?
      file_name = file.original_filename
       File.open("public/user_images/#{file_name}", 'wb'){|f| f.write(file.read)}
       self.user_image = file_name
    end
		
	end

  def followed_by? user
    inverse_follows.where(follower_id: user.id).exists?
  end
end
