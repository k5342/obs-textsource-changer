require 'json'

def log_insert(type, data)
  record = {
    time: Time.now,
    type: type.to_s,
    data: data,
  }
  File.open("./change.log", "a+") do |f|
    f.puts record.to_json
  end
end

def set(id)
  e = $tt.get_by_id(id)
  e.each_pair do |k, v|
    unless File.exist?('./data')
      Dir.mkdir('./data')
    end
    File.open("./data/#{k}.txt", 'w') do |f|
      f.write(v)
    end
  end
  log_insert(:change, e)
end

def set_delete
  unless File.exist?('./data')
    Dir.mkdir('./data')
  end
  $tt.attrs.each do |k|
    File.open("./data/#{k}.txt", "w").close
  end
  log_insert(:delete, {})
end
