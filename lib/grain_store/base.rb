module GrainStore
  class Base
    def client
      raise NotImplementedError
    end

    def get
      raise NotImplementedError
    end

    def set
      raise NotImplementedError
    end

    def delete
      raise NotImplementedError
    end
  end
end
