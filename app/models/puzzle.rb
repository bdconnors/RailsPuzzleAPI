# Models
class Puzzle
  belongs_to :user
  include Mongoid::Document
  field :state, type: String
  field :col, type: Integer
  field :row, type: Integer
  field :img, type: String
  field :width, type: Integer
  field :height, type: Integer
  field :selected_piece, type: Integer
  field :selected_target, type: Integer
  field :correct_pieces, type: Integer
  field :incorrect_pieces, type: Integer
end