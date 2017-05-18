class Search::User < Search::Base
  ATTRIBUTES = %i(name age).freeze

  attr_accessor *ATTRIBUTES

  def initialize(attr = {})
    super attr if attr.present?
  end

  def matches
    users = base_criteria
    users = users.name_like(name) if name.present?
    users = users.younger_than(age) if age.present?
    users
  end

  private

  def base_criteria
    ::User.all
  end
end
