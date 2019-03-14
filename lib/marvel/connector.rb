require_relative 'client'

module Marvel
  module Connector
    def get_array(type, name, class_name, *args)
      arr = []
      get(type, name, args).each do |data|
        arr << class_name.new(data)
      end
      if arr.length == 1
        return arr.first
      else
        return arr
      end
    end

    private
    
    def get(type, name, *args)
      params = Marvel::Client.auth_params
      params["#{name[3..-1]}".to_sym] = args
      RestClient.get("#{Marvel::BASE_PATH}#{type}", {params: params}).body.json.data.results
    end
  end
end
