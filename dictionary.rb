class Dictionary

  def initialize
    @terms = {}
  end

  def entries
    @terms
  end

  def add(hash)
    if hash.class == Hash
      @terms = hash.merge(@terms)
    else
      @terms[hash] = nil
    end
  end

  def keywords
    @terms.keys
  end

  def include?(keyword)
    if @terms.include?(keyword)
      return true
    else
      return false
    end
  end

  def find(string)
    @terms.select do |key, value|
      key.include?(string)
    end
  end

end
