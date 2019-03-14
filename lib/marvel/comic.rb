require_relative 'connector'

module Marvel
  class Comic
    attr_reader :id, :title
    class << self
      include Marvel::Getter
      def method_missing(name, *args)
        if name.match /^by_/
          comics = get('comics', name, self, args)

          return comics
        else
          super
        end
      end
    end

    def initialize(data)
      @id = data.id
      @title = data.title
    end
  end
end
