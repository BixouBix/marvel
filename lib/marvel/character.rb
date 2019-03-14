require_relative 'connector'

module Marvel
  class Character
    attr_reader :id, :name, :description, :comics

    class << self
      include Marvel::Connector
      def method_missing(name, *args)
        if name.match /^by_/
          characters = get_array('characters', name, self, args)
          return characters
        else
          super
        end
      end
    end

    def initialize(data)
      @name = data.name
      @id = data.id
      @description = data.description
      @comics_data = data.comics
    end

    def comics
      ap "Searching for comics"
    end
  end

end
# char = Marvel::Character.by_name('thanos')
# chars = Marvel::Character.by_nameStartsWith('tha')
