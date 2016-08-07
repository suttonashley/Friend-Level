module UsersHelper

  def point_ratio(points1,points2)
    return points1 if points2 == 0
    return points2 if points1 == 0
    points1 >= points2 ? points1/points2 : points2/points1
  end

end
