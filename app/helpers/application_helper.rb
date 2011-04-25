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

    puts text.inspect
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
    text.gsub! /&gt_SOSNOOLEY;&gt;(\d+)/ do |idd|
      if @id_counter < 10
        @id_counter += 1
        id = idd[8..idd.length].to_i
        post = Post.find_by__id id
        thread = RThread.find_by__id(id) if not post
        if post
          thread = RThread.find_by__id post.thread_id
          url = ApplicationController.url_for(
            controller:   'threads', 
            action:       'show', 
            id:           thread._id,
            hash:         id
          )
          "<div class='post_link'><a href='#{url}'>&gt;&gt;#{id}</a></div>"
        elsif thread
          url = url_for(controller: 'threads', action: 'show', id: thread._id)
          "<div class='post_link'><a href='#{url}'>&gt;&gt;#{id}</a></div>"
        else
          idd
        end
      end
    end

    text.gsub! /^&gt;(.+)$/,  quote('\0')
    text.gsub! /\r\n(\r\n)+/, '<br /><br />'
    text.gsub! /\r\n/,        '<br />'
    return text
  end

  def parse_back text
    text.gsub! '<br />',    "\n"
    text.gsub! /<\/*?b>/,   '**'
    text.gsub! /<\/*?i>/,   '*'
    text.gsub! /<\/*?u>/,   '__'
    text.gsub! /<\/*?span( class='spoiler')*?>/,   '%%'
    return text
  end
end
