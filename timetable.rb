
class TimeTable
  attr_reader :events, :attrs
  def initialize(file_path)
    @events = []
    File.open(file_path, 'r') do |f|
      @attrs = f.readline.chomp.split("\t")
      f.each_line do |l|
        @events << @attrs.zip(l.chomp.split("\t")).to_h
      end
    end
  end
  def get_by_id(id)
    return @events[id]
  end
end
