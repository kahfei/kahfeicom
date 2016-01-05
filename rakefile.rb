
require 'rake'
require 'yaml'
require 'fileutils'
require 'rbconfig'

# directories and dates
POSTS = "_posts"
DRAFTS = "_drafts"
DATE = Time.now.strftime("%Y-%m-%d")
TIME = Time.now.strftime("%H:%M:%S")
POST_TIME = DATE + ' ' + TIME


desc 'create a new draft post'
task :draft do
    title = ENV['title']
    #slug = "#{DATE}-#{title.downcase.gsub(/[^\w]+/, '-')}"
    slug = "#{title.downcase.gsub(/[^\w]+/, '-')}"

    file = File.join(
        File.dirname(__FILE__),
        DRAFTS,
        slug + '.markdown'
    )

    File.open(file, "w") do |f|
        f << <<-EOS.gsub(/^    /, '')
    ---
    layout: post
    title: #{title}
    categories:
    ---

        EOS
    end

    system ("#{ENV['EDITOR']} #{file}")
end

task :publish do
  files = Dir["#{DRAFTS}/*.*"]
  files.each_with_index do |file, index|
    puts "#{index + 1}: #{file}".sub("#{DRAFTS}/", "")
  end
  print "> "
  number = $stdin.gets
  if number =~ /\D/
    filename = files[number.to_i - 1].sub("#{DRAFTS}/", "")
    FileUtils.mv("#{DRAFTS}/#{filename}", "#{POSTS}/#{DATE}-#{filename}")
    fn = File.join(
        File.dirname(__FILE__),
        POSTS,
        "#{DATE}-#{filename}"
    )

    File.open(fn, "a") do |f|
      f << "add something"
    end
    puts "#{filename} was moved to '#{POSTS}'."
  else
    puts "Please choose a draft by the assigned number."
  end
end