require_relative 'connector'

module Marvel
  class Comic
    attr_reader :id, :title, :description
    class << self
      include Marvel::Connector
      def method_missing(name, *args)
        if name.match /^by_/
          comics = get_array('comics', name, self, args)

          return comics
        else
          super
        end
      end
    end

    def initialize(data)
      @id = data.id
      @title = data.title
      @description = data.description
    end
  end
end
