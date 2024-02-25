module StudentsHelper

  def grades_options
    options = {}
    (1..6).each do |n|
      options = options.merge({"小学#{n}年" => n})
    end
    (7..9).each do |n|
      options = options.merge({"中学#{n-6}年" => n})
    end
    (10..12).each do |n|
      options = options.merge({"高校#{n-9}年" => n})
    end
    options = options.merge({"既卒" => 13})
    return options
  end

  def levels_options
    return {"かなり前の内容から復習が必要" => 1, "復習が必要" => 2, "学校の授業に合わせたらいい" => 3, "少し予習も取り入れている" => 4}
  end
  
  def attitudes_options
    return {"全然集中しない" => 1, "やる気にムラがある" => 2, "いつも集中している" => 3}
  end

end
