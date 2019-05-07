module Marvel
  module Helper
    def array_or_first(arr)
      if arr.length == 1
        return arr.first
      else
        return arr
      end
    end
  end
end
