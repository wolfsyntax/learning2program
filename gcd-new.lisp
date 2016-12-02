(
  defun gcd-new(x y)
  (if(= (rem x y) 0)
    y
    (gcd-new x (rem x y))
  )
)
