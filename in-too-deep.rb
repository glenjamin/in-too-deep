class InTooDeep < Hash

  def freeze!
    @frozen = true
    each_value do |child|
      child.freeze! if child.is_a?(InTooDeep)
    end
  end

  def []=(key, value)
    super key.to_sym, value
  end

  def [](key)
    if has_key?(key.to_sym) or @frozen
      super key.to_sym
    else
      self[key] = InTooDeep.new
    end
  end

end
