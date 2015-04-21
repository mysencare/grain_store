module GrainStore
  module Redis
    class Store < GrainStore::Base
      def client
        @client ||= ::Redis.new(host: GrainStore.configuration.host, port: GrainStore.configuration.port)
      end

      def get(key)
        execute(:get, key)
      end

      def set(key, value)
        execute(:setex, key, GrainStore.expiry_seconds, value)
      end

      def delete(key)
        execute(:del, key)
      end

      # additionnal
      def list_push(key, value)
        execute(:rpush, key, value)
      end

      private

      def execute(cmd, key, *values)
        begin
          client.send(cmd, key, *values)
        rescue => e
          fail(GrainStore::Redis::Exception, e.message)
        end
      end
    end
  end
end
