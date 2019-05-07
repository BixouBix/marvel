require_relative 'client'

require_relative 'helper'

module Marvel
  module Connector
    include Marvel::Helper
    

    def get_array(type, name, class_name, *args)
      arr = []
      get(type, name, args).each do |data|
        arr << class_name.new(data)
      end

      array_or_first(arr)
    end

    private

    def get(type, name, *args)
      params = Marvel::Client.auth_params
      params["#{name[3..-1]}".to_sym] = args
      RestClient.get("#{Marvel::BASE_PATH}#{type}", {params: params}).body.json.data.results
    end
  end
end
