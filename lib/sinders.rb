require "sinders/version"

module Sinders
  def self.check(id, seconds)
    Thread.new { sleep seconds; reset_data_at id }
  end

  def self.reset_data_at(_id)
  end

  def self.transforms(data, till_midnight)
  end

  def self.get(_id)
    { key: 'VALUE' }
  end
end
