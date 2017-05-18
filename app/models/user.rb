class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :age, presence: true, uniqueness: true

  scope :name_like, -> (name) {
    where(User.arel_table[:name].matches("%#{name}%"))
  }
  scope :younger_than, -> (age) {
    where('age < ?', age)
  }
end
