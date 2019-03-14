require_relative 'connector'

module Marvel
  class Character

    attr_reader :id
    class << self
      include Marvel::Connector
      def method_missing(name, *args)
        if name.match /^by_/
          # get('characters', name, args)
          characters = get('characters', name, args).each do |data|
            make_character(data)
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


      def make_character(data)
        self.new({
            id: data.id,
            name: data.name,
            description: data.description,
            modified: data.modified,
            thumbnail: data.thumbnail
          })
      end
    end
    def initialize(info)

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
