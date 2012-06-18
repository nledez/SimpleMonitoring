require 'sequel'

class RbStatus < Sinatra::Base
  DB = ::Sequel.connect(DB_URL)

  get '/status' do
    # begin
      response['Access-Control-Allow-Origin'] = ORIGIN_ALLOWED if defined? ORIGIN_ALLOWED
      NODE_ID = 0 unless defined? NODE_ID
      RETRY = 10  unless defined? RETRY
      counter = after = 0
      status = DB[:status]
      status.filter(:node => NODE_ID).delete
      status.insert(:data => Time.now, :node => NODE_ID)
      sleep SLEEP_TIME if defined? SLEEP_TIME
      after = status.filter(:node => NODE_ID).all.count
      # while counter <= RETRY && after <= 0
      #   counter += 1
      #   after = status.filter(:node => NODE_ID).all.count.to_s
      # end
      if after > 0
        "#{VHOST_NAME} OK with #{counter} retry and #{after} records"
      else
        "#{VHOST_NAME} KO with #{counter} retry and #{after} records"
      end
    # rescue
      # "#{VHOST_NAME} KO"
    # end
  end
end
