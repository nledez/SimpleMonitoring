require 'sequel'

class RbStatus < Sinatra::Base
  DB = ::Sequel.connect(DB_URL)

  get '/status' do
    begin
      response['Access-Control-Allow-Origin'] = ORIGIN_ALLOWED if defined? ORIGIN_ALLOWED
      status = DB[:status]
      status.filter(:node => NODE_ID).delete
      before = status.filter(:node => NODE_ID).all.count.to_s
      status.insert(:data => Time.now, :node => NODE_ID)
      sleep(1)
      after = status.filter(:node => NODE_ID).all.count.to_s
      if after > before
        "#{VHOST_NAME} OK"
      else
        "#{VHOST_NAME} KO"
      end
    rescue
      "#{VHOST_NAME} KO"
    end
  end
end
