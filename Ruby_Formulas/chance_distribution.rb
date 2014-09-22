module ChanceDistribution


  def get_grade(array)
    average = array.inject(:+)/array.length
    case average
      when 90..100
        "A"
      when 80..90 
        "B"
      when 70..80
        "C"
      when 60..70
        "D"
      when 0..70
        "F"
      else
      "ERROR"
    end
  end

end
