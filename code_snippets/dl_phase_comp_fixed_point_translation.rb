ruby << EOF

  a = Array.new(15)
  #a = '001011000010101'.reverse.split(//)
  #a = '111111000010100'.reverse.split(//)
  a = '110100101001110'.reverse.split(//)
  b = 0
  for i in (0..14)
    c =  a[14-i].to_i*( 1.0/2**i)
    b = b + c
    puts "for i: #{i} index: #{14-i} -> c: #{c}"
    puts "for i: #{i} index: #{14-i} -> b: #{b}"
  end

  #d =  a[14-i].to_i*( 1.0/2**14)

  puts "d: #{d.to_f}"
  puts "Resultat: #{b.to_f}"
EOF
