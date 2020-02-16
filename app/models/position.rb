# Models
class Position
  field :id, type: String
  field :x, type: Integer
  field :y, type: Integer
  field :top, type: Integer
  field :bottom, type: Integer
  field :left, type: Integer
  field :right, type: Integer
  field :piece, type: Piece
end