require 'pry'
require 'net/ftp'
g_debug_mode = false
sample_prefix =[
  "994951",
  "994960",
  "994970",
  "994971",
  "994972",
  "994973",
  "994974",
  "994975",
  "994976",
  "994977",
  "994978"
]
def dump_sample_file_list(ftp)
  open('file_list_2014.txt','w') do |f|
    ftp.list.each do | sample_file|
      f.puts(sample_file)
    end
  end
end
def load_sample_file_list(im_file = 'file_list_2014.txt')
  open(im_file, 'r').collect do |im_line|
    im_line.split.last if im_line.length > 0
  end
end

Net::FTP.open('ftp.ncdc.noaa.gov', 'anonymous', '') do |ftp|
  ftp.passive = true
  ftp.chdir('/pub/data/noaa/2014')
  if g_debug_mode
    file_lst = load_sample_file_list
  else
    file_lst = ftp.list.map(&:split).map(&:last)
  end
  file_lst = load_sample_file_list
  file_lst.each do |file_name|
    if sample_prefix.detect{|usaf| file_name.split("-").first == usaf}
      p file_name
      ftp.getbinaryfile(file_name)
    end
  end

end
