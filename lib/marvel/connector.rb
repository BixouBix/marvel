require_relative 'client'

module Marvel
  module Connector
    def retrieve(type, name, *args)
      params = Marvel::Client.auth_params
      params["#{name[3..-1]}".to_sym] = args
      RestClient.get("#{Marvel::BASE_PATH}#{type}", {params: params}).body.json.data.results
    end
  end
end
