require_relative 'connector'

module Marvel
  module Getter
    include Marvel::Connector
    def get(type, name, class_name, *args)
      arr = []
      retrieve(type, name, args).each do |data|
        arr << class_name.new(data)
      end
      if arr.length == 1
        return arr.first
      else
        return arr
      end
    end
  end
end
