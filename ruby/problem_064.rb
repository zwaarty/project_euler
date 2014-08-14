
def continued_fraction n
  true_val = n ** 0.5
  t = true_val.floor
  ans = [t, []]
  den = n  - t ** 2
  num = n
end