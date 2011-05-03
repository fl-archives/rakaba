class Ids < ActiveRecord::Base
  serialize(:ids, Hash)

  def self.get_next_id(board_alias)
    record = Ids.first
    if not record.ids.has_key?(board_alias)
      record.ids[board_alias] = 0
    end
    record.ids[board_alias] += 1
    record.total += 1
    record.save
    return record.ids[board_alias]
  end
end
