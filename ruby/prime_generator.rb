require 'prime'
require 'msgpack'
require 'lzma'

seq = Prime.each(100_000_000).to_a

File.open('prime.dump', 'w') do |f|
  f.write LZMA.compress(seq.to_msgpack)
end

# hoge = MessagePack.unpack(LZMA.decompress(File.read('prime.dump')))

