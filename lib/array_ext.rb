class Array
  
  if RUBY_VERSION < "1.8.7"
    def shuffle!
      n = length
      for i in 0...n
        r = Kernel.rand(n-i)+i
        self[r], self[i] = self[i], self[r]
      end
      self
    end

    def shuffle
      dup.shuffle!
    end
  end
  
end