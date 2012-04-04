require 'sequel'

class RbStatus < Sinatra::Base
  DB = ::Sequel.connect(DB_URL)

  get '/status' do
    begin
      DB['delete from status;'].first
      before = DB['select id, data from status;'].all.count.to_s
      DB['insert into status(data) values(NOW());'].first
      after = DB['select id, data from status;'].all.count.to_s
      if after > before
        "OK"
      else
        "KO"
      end
    rescue
      "KO"
    end
  end
end
