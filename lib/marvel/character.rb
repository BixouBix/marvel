module Marvel
  class Character
    attr_reader :id
    class << self
      def method_missing(name, *args)
        if name.match /^by_/
          params = Marvel::Client.auth_params
          params["#{name[3..-1]}".to_sym] = args
          res = RestClient.get("#{Marvel::BASE_PATH}characters", {params: params}).body.json
          # results = res.data.results
          characters = res.data.results.each do |info|
            self.new(info)
          end
          char = if characters.length == 1
            characters.first
          else
            characters
          end
          return char
        else
          super
        end
      end
    end
    def initialize(data)
      # ap "Initializing with #{data.name}"
      # # ap data
      # # # @id = data.id
      # # # @name = data.name
    end

    def comics
      ap "Searching for comics"
    end
  end

end
# char = Marvel::Character.by_name('thanos')
# chars = Marvel::Character.by_nameStartsWith('tha')
