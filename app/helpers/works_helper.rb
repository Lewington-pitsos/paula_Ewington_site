module WorksHelper
  def save_place(cat, work, place)
    # recurisve function, pushes the current place down untill it is as low as possible wirhout conflicting, OR, if there is a conflict, pushes it up
    prev_slot = cat.works.where(position: place - 1)
    if prev_slot.empty? && place > 1
      # if the place is not the first possible place and the previous place slot isn't empty, it should try to slot the category in at the previous place
      if place > 1
        save_place(cat, work, place - 1)
      end
    else
      # otherwise, if the place has been taken it should increment the place of the work with the matching place and keep trying to save it untill we run out of place conflicts, then save the origional place as intended.
      same_place = cat.works.where(position: place)
      if !same_place.empty?
        save_place(cat, same_place.take, place + 1)
      end
      work.update_attribute(:position, place)
    end
  end

  def work_shuffle_down(position, id)
    # grabs an array of all works in this category with a higher position than the passed in position (orderd in ascending position order)
    # re-saves the position of each work IN ORDER
    cat = Category.find(id)
    cat.works.where("position > ?", position)
      .order(position: :asc)
      .each do |work|
        save_place(cat, work, work.position)
      end
  end
end
