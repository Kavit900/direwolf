
class TestMySQL
  def doRun
    puts "hello world"
    #client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "n0password")
    #results = client.query("SELECT * FROM users WHERE group='githubbers'")
    #puts results
  end
end

client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "n0password")
results = client.query("SELECT * FROM users WHERE group='githubbers'")
puts results