module WorksHelper
  def save_place(cat, work, place)
    # recursive function, if the place has been taken it should increment the place of the work with the matching place and keep trying to save it untill we run out of place conflicts, then save the origional place as intended.
    same_place = cat.works.where(position: place)
    if !same_place.empty?
      save_place(cat, same_place.take, place + 1)
    end
    work.update_attribute(:position, place)
  end
end
