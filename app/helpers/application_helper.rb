# -*- coding: utf-8 -*-

module ApplicationHelper
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
    #if now.day == date.day
    #  if [now.month, now.year] == [date.month, date.year]
    #    result = 'сегодня '
    #  end
    #elsif date.day == (now.day - 1)
    #  if [now.month, now.year] == [date.month, date.year]
    #    result = 'вчера '
    #  end
      month = months[date.month - 1]
      result = "#{date.day} #{month} #{date.year} "
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
      result = number.to_s + ' сообщени'
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

  def parse text
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

    def link href, text 
      "<a href='#{href}'>#{text}</a>"
    end

    def post_link id
      "<div class='post_link'><a href='##{id}'>&gt;&gt;#{id}</a></div>"
    end

    def quote text
      "<span class='quote'>#{text}</span>"
    end

    url_regexp = /&lt;a.*href=['|"](.+?)['|"].*&gt;(.+?)&lt;\/a&gt;/
    text.strip!
    text.gsub! '&', '&amp;'
    text.gsub! '<', '&lt;'
    text.gsub! '>', '&gt;'
    text.gsub! /\*\*(.+?)\*\*/, bold('\1')
    text.gsub! /\*(.+?)\*/,     italic('\1')
    text.gsub! /__(.+?)__/,     underline('\1')
    text.gsub! /%%(.+?)%%/,     spoiler('\1')
    text.gsub! url_regexp,      link('\1', '\2')
    text.gsub! /&gt;&gt;(\d+)/, post_link('\1')
    text.gsub! /^&gt;(.+)$/,    quote('\1')
    text.gsub! /\n(\n)+/,       '<br /><br />'
    text.gsub! /\n/,            '<br />'
    text.gsub! /&lt;a href=['|"](.*?)['|"]&gt;&lt;\/a&gt;/, ''
    return text
  end
end
