class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, #Validates that class Todo has a name parameter before the info goes into the database
                    length: { minimum: 5, maximum: 25 }
  validates :text, presence: true,
                   length: { minimum: 5, maximum: 1000}
end
