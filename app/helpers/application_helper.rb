# -*- coding: utf-8 -*-

module ApplicationHelper
  def anonymous?
    return @user == 'anonymous'
  end
  
  def production? 
    ENV['RAILS_ENV'] == 'production'
  end

  def verbose_date date
    months = [  'января',   'февраля',    'марта',
                'апреля',   'мая',        'июня',
                'июля',     'августа',    'сентября',
                'октября',  'ноября',     'декабря'    ]
    now = Time.now.getlocal
    date = date.getlocal  
    if now.day == date.day
      if [now.month, now.year] == [date.month, date.year]
        result = 'сегодня '
      end
    elsif date.day == (now.day - 1)
      if [now.month, now.year] == [date.month, date.year]
        result = 'вчера '
      end
    else
      month = months[date.month - 1]
      result = "#{date.day} #{month} #{date.year} "
    end
    return result + 'в ' + date.strftime('%H.%M')
  end

  def verbose_replies number, type='default'
    if type == 'new'
      result = number.to_s + ' сообщени'
      number_mod = number % 10
      if number_mod == 1 and number != 11
        return result += 'й'
      else
        return result += 'х'
      end
    else
      result = 'сообщени'
      number_mod = number % 10
      if (2..4).include? number_mod and not (12..14).include? number
        return result + 'я'
      elsif number_mod != 1 or number == 11
        return result + 'й'    
      else
        return result + 'е'
      end
    end
  end

  def bold text
      "<b>#{text}</b>"
  end

  def italic text
    "<i>#{text}</i>"
  end

  def underline text
    "<u>#{text}</u>"
  end

  def spoiler text
    "<span class='spoiler'>#{text}</span>"
  end

  def quote text
    "<span class='quote'>&gt; #{text.strip}</span><br />"
  end

  def parse_back(text)
    text.gsub! '<br />',    "\n"
    text.gsub! /<\/*?b>/,   '**'
    text.gsub! /<\/*?i>/,   '*'
    text.gsub! /<\/*?u>/,   '__'
    text.gsub! /<\/*?span( class='spoiler')*?>/,   '%%'
    return text
  end
end