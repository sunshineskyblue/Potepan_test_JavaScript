require "csv"
puts "1(新規でメモを作成/既存のメモを上書き) 2(既存のメモに加筆する)"
memo_type = gets.chomp.to_s

class Memo
  def initialize(name, content)
  @@name = name
  @@content = content
  end

  def self.file_open
    CSV.open("./#{@@name}.csv", 'w') do |csv|
    csv << ["#{@@content}"]
    end
  end

  def self.file_add
    CSV.open("./#{@@name}.csv", 'a') do |csv|
    csv << ["#{@@content}"]
    end
  end

  # def self.file_load
  #   File.open("./#{@@name}.csv", 'r') do |row|
  #   puts row.read
  #   end
  # end

end

if memo_type === "1"
  puts "拡張子を除いたファイル名を入力してください"
  memo_name = gets.chomp.to_s

  puts "\"メモしたい内容を入力してください\""
  puts "\"完了したらCtrl + Dを押します\""
  memo_content = $stdin.read
  Memo.new(memo_name, memo_content)
  Memo.file_open()

elsif memo_type === "2"

  puts "拡張子を除いたファイル名を入力してください"
  memo_name = gets.chomp.to_s

  # Memo.new(memo_name)
  # Memo.file_load()

  File.open("./#{memo_name}.csv", 'r') do |row|
  puts row.read
  end

  puts "\"追加したい内容を入力してください\""
  puts "\"完了したらCtrl + Dを押します\""
  memo_content = $stdin.read
  Memo.new(memo_name, memo_content)
  Memo.file_add()

end




















