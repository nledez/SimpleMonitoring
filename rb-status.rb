require 'sequel'

class RbStatus < Sinatra::Base
  DB = ::Sequel.connect(DB_URL)

  get '/status' do
    begin
      response['Access-Control-Allow-Origin'] = ORIGIN_ALLOWED if defined? ORIGIN_ALLOWED
      DB['delete from status where node = ' + NODE_ID + ';'].first
      before = DB['select id, data from status where node = ' + NODE_ID + ';'].all.count.to_s
      DB['insert into status(data, node) values(NOW(, ' + NODE_ID + '));'].first
      after = DB['select id, data from status, where node = ' + NODE_ID + ';'].all.count.to_s
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
