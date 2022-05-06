class Gift < ApplicationRecord
  enum type: %i[mug t_shirt hoodie sticker]
end
