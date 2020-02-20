# Models
class User
  include Mongoid::Document
  store_in collection: 'User'
  field :email, type: String
  field :password, type: String
  field :firstName, type: String
  field :lastName, type: String
  field :puzzles, type: Array
end
