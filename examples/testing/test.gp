reset
set terminal epslatex standalone size 3.5in, 2.4in font ",9"
set output "test.pdf"
set xtics 0.5 nomirror
set tics format "%.1f"
set xrange [-1:1]
set yrange [1:3]
set key notitle invert under reverse Left left spacing 2 samplen 0.7
set arrow 1 filled from graph 0.4, 0.7 to graph 0.6, 0.7
set label 1 at graph 0.5, 0.75 "$k$" center
Title_E = "EllipticE$(k) = \\int_0^{\\pi/2} {\\sqrt{1-k^2 \\sin^2 \\theta}} d\\theta$"
Title_K = "EllipticK$(k)=\\int_0^{\\pi/2} {\\sqrt{1-k^2 \\sin^2 \\theta} }^{-1} d\\theta$"
plot EllipticE(x) lw 3 title Title_E, EllipticK(x) lw 3 title Title_K
