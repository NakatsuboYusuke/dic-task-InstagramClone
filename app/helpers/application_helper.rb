module ApplicationHelper
  # for common view or common controller

  def convert_birthday_time(birthday)
    birthday.strftime("%Y年%m月%d日")
    # AM => 午前 PM => 午後 に変換したい
  end

end
