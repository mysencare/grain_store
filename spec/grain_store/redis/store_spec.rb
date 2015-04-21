require 'spec_helper'

describe GrainStore::Redis::Store do
  it { is_expected.to respond_to(:client) }
  it { is_expected.to respond_to(:get) }
  it { is_expected.to respond_to(:set) }
  it { is_expected.to respond_to(:delete) }

  it { is_expected.to respond_to(:list_push) }

  describe '#client' do
    its(:client) { is_expected.to be_a Redis }
  end

  describe 'redis commands' do
    let(:redis_client) { double('redis_client') }

    before do
      allow(subject).to receive(:client).and_return(redis_client)
    end

    describe '#get' do
      it 'calls the redis client #get with the key' do
        expect(redis_client).to receive(:send).with(:get, 'foo').and_return(double)
        subject.get('foo')
      end
    end

    describe '#set' do
      it 'calls the redis client #setex with key, value and default TTL' do
        expect(redis_client).to receive(:send).with(:setex, 'foo', 86400*42, 'bar').
                                  and_return(true)
        subject.set('foo', 'bar')
      end
    end

    describe '#delete' do
      it 'calls the redis client #del with key' do
        expect(redis_client).to receive(:send).with(:del, 'foo').and_return(true)
        subject.delete('foo')
      end
    end

    describe '#list_push' do
      it 'calls the redis client #rpsuh with key, value' do
        expect(redis_client).to receive(:send).with(:rpush, 'foo', 'bar').and_return(true)
        subject.list_push('foo', 'bar')
      end
    end

    describe 'exception raised' do
      it 'catch the RedisExceptions and raise another one' do
        allow(redis_client).to receive(:get).and_raise(ArgumentError)
        expect { subject.get('foo') }.to raise_error(GrainStore::Redis::Exception)
      end
    end
  end
end
