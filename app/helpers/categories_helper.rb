module CategoriesHelper
  def save_cat_place(cat, place)
    # recurisve function, pushes the current place down untill it is as low as possible wirhout conflicting, OR, if there is a conflict, pushes it up

    prev_slot = Category.where(position: place - 1)
    if prev_slot.empty? && place > 1
      # if the place is not the first possible place and the previous place slot isn't empty, it should try to slot the category in at the previous place
      if place > 1
        save_cat_place(cat, place - 1)
      end
    else
      # otherwise, if the current place has been taken it should increment the place of the work with the matching place and keep trying to save it untill we run out of place conflicts, then save the origional place as intended.
      same_place = Category.where(position: place)
      if !same_place.empty?
        save_cat_place(same_place.take, place + 1)
      end
      cat.update_attribute(:position, place)
    end
  end

  def cat_shuffle_down(position)
    # grabs an array of all cats with a higher position than the passed in positione (orderd in ascending position order)
    # re-saves the position of each category IN ORDER
    Category.where("position > ?", position)
      .order(position: :asc)
      .each do |cat|
        save_cat_place(cat, cat.position)
      end
  end
end
