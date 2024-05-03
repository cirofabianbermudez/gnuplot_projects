# curso_gnuplot

## Introducción

Gnuplot es una utilidad gráfica portátil basada en línea de comandos para Linux, OS/2, MS Windows, OSX, VMS y muchas otras plataformas. El código fuente está protegido por derechos de autor, pero se distribuye libremente (es decir, no hay que pagar por él). Fue creado originalmente para permitir a científicos y estudiantes visualizar funciones matemáticas y datos de forma interactiva, pero ha crecido para soportar muchos usos no interactivos, como el scripting web. También se utiliza como motor de trazado en aplicaciones de terceros como Octave. Gnuplot ha estado soportado y en desarrollo activo desde 1986.

Para ver ejemplos podemos acceder al siguiente enlace [demos](https://gnuplot.sourceforge.net/demo/).

## Modos de uso

Gnuplot se puede utilizar directamente desde terminal insertando comandos secuencialmente, no obstante este modo se recomienda solo para hacer pequeñas pruebas, la manera más recomendada es utilizar scripts.

Gnuplot lee datos de archivos de texto. Se espera que los datos sean numéricos y se almacenen en el archivo en **columnas separadas por espacios en blanco**. Las líneas que comienzan con una almohadilla (#) se consideran líneas de comentario y se ignoran. 



| Abbreviation | Full               |
| ------------ | ------------------ |
| `i`          | `index`            |
| `ev`         | `every`            |
| `u`          | `using`            |
| `s`          | `smooth`           |
| `s acs`      | `smoth acsplines`  |
| `s f`        | `smooth frequency` |
| `t`          | `title`            |
| `w`          | `with`             |
| `w l`        | `with lines`       |
| `w lp`       | `with linespoints` |
| `w p`        | `with points`      |
| `w vec`      | `with vectors`     |
| `w d`        | `with dots`        |





| Abbreviation | Full           |
| ------------ | -------------- |
| `set t`      | `set terminal` |
| `set o`      | `set output`   |
| `set logsc`  | `set logscale` |



```plain
plot "marathon" using 1:2 with boxes
```

```plain
plot "runtime" using 1:2 title "Data" with lines,(x/2500)**3 title "Model"
set xlabel "Cluster size"
set ylabel "Run time [sec]"
set logscale
replot
```



```plain
unset border
unset xtics
unset ytics
set size square
plot "cluster" using 1:2 with dots
```



```plain
plot sin(x)
```



```plain
plot sin(x), x, x-(x**3)/6
```



```plain
plot [][-2:2] sin(x), x, x-(x**3)/6
```



```plain
plot "prices"
```



```plain
plot "prices" using 1:2
```



```plain
plot "prices" using 1:2, "prices" using 1:3
```



Cuando falta un nombre de archivo, se interpola el más reciente.

```plain
plot "prices" using 1:2 with lines, "prices" using 1:3 with linespoints
plot "prices" u 1:2 w l, "prices" u 1:3 w lp
plot "prices" u 1:2 w l, "" u 1:3 w lp
```



```plain
plot "prices" using 1:2 title "PQR" with lines, "prices" using 1:3 title "XYZ" with linespoints
```



**Scatter plots**

```plain
plot "prices" using 2:3 with points
```



Si se omite la directiva `using` gnuplot traza la segunda columna frente a la primera (esto equivale a `using 1:2`). Si se da una directiva `using` pero sólo se lista una única columna, gnuplot utiliza esta columna para los valores y y proporciona los valores x como enteros comenzando en cero. Esto es también lo que ocurre cuando no se da ninguna directiva `using` y el fichero de datos contiene sólo una sola columna.


```plain
save "graph.gp"
load "graph.gp"
```



Para tener un control total sobre el proceso de exportación, es necesario familiarizarse con el terminal de gnuplot. Un terminal es la abstracción de gnuplot para un punto final con capacidad gráfica. Los terminales pueden ser interactivos (orientados a la pantalla) o basados en ficheros. Todos los gráficos de salida deben ser dirigidos a un terminal.



```plain
plot exp(-x**2)
set terminal pngcairo
set output "graph.png"
replot
set terminal wxt
set output
```

Los únicos comandos que grafican son `plot`, `splot` que se utiliza para gráficos tridimensionales.`replot` y `refresh `(ambos repiten el comando `plot` o `splot` más reciente)



|         |                                                              |
| ------- | ------------------------------------------------------------ |
| `show`  | Muestra el valor actual de una opción                        |
| `set`   | Cambia el valor de una opción                                |
| `unset` | Desactiva un opción especifica y la regresa a su valor por defecto |
| `reset` | Regresa todas las opciones a su valor por defecto, las únicas opciones que no modifica son `terminal` y `output` |



```plain
show version long
show all
```



```plain
help
help plot
```



```plain
plot sin(x)
plot cos(x) with linespoints
plot sin(x), cos(x) w lp
```



La opción establecer muestras controla el número de puntos en los que se evalúa una función para generar un gráfico. El valor por defecto es de 100 puntos. Es posible que desee incluir esa línea en su archivo personal de inicialización de gnuplot, anulando el (ridículamente pequeño) valor por defecto de gnuplot

```plain
set samples 1000
```



```plain
set xlabel "Distance (in meters)"
set ylabel "World record (in seconds)"
plot [:12000][:2000] "records" using 1:2 title "Men" with points, "" using 1:3 title "Womwn" with points, 0.14*x, 0.16*x
```



```plain
help expressions functions
```



````plain
print rand(-1)
print rand(0)
print rand(x)  # x>0
print rand({x,y})  # x,y>0
````



Es fácil definir nuevas variables asignando una expresión a un nombre. 

```plain
print pi
e = 2.71828182845905
sqrt2 = sqrt(2.0)
euler = 0.57721566490153
print e
```



Las funciones pueden tener hasta 12 variables y pueden contener otras funciones y operadores.

```plain
f(x) = -x * log(x)
gauss( x, m, s ) = exp( -0.5*( (x-m)/s )**2 )/sqrt(2*pi*s**2)
binom( n, k ) = n!/(k!*(n-k)!)
min( a, b ) = ( a < b ) ? a : b
step( x ) = ( x < 0 ) ? 0 : 1
```



```plain
set dummy t
plot sin(t)
```



```plain
g(x) = exp(-0.5*(x/s)**2)/s
plot s=1 g(x), s=2 g(x), s=3 g(x)
```



```plain
g(x, s) = exp(-0.5*(x/s)**2)/s
plot g(x,1), g(x,2), g(x,3)
```



```plain
show variables
show functions
```



 NaN, que significa no un número (not a number)  e indica un valor matemáticamente indefinido.

```plain
f(x) = abs(x) < 1 ? 1 : NaN
f(x) = x>=2? sin(x) : cos(x)
```





Se puede aplicar una función arbitraria a cada punto de datos como parte de la directiva `using` en el comando de `plot`. Si un argumento de `using` está encerrado entre paréntesis, no se trata como un número de columna, sino como una expresión a evaluar. Dentro de los paréntesis, puede acceder a los valores de columna para el registro actual precediendo el número de columna con un signo de dólar ($) (como en la programación shell o awk)

```plain
plot "data" using 1:( sqrt($2) ) with lines
plot "data" using 1:( ($2+$3)/2 ) with lines
plot "data" using ( log($1) ):( log($2) ) with lines
```



```plain
plot "records" u 2:1 t "Men" w lp, "" u 3:1 t "Women" w lp
set logsc x
plot [9:][5:11] "records" u 2:($1/$2) t "Men" w lp, "" u 3:($1/$3) t "Women" w lp
```







```plain
plot "data" using 1:2 with lines, "" using 1:( $3/100.0 ) with lines
plot "data" using 1:( $2+sqrt($3) ) with lines, "" using 1:( $2-sqrt($3) ) with lines
```



```plain
plot "data" using 1:( $2 > 0 ? log($2) : 0 ) with lines
```



```plain
plot "data" using 1:( $2 < 10 ? $2 : NaN ) with points
```



```plain
set logscale
set logscale x
set logscale y
unset logscale
unset logscale x
unset logscale y
```



```plain
plot "splines" u 1:2 w p pt 6, "" u 1:2 smooth csplines, "" u 1:2 smooth mcsplines,"" u 1:2 smooth bezier.
```



```plain
plot "splines" u 1:2 w p pt 6, "" u 1:2:(10e6) s acs, "" u 1:2:(10) s acs, "" u 1:2:(1./10) s acs, "" u 1:2:(10e-6) s acs
```



```plain
plot "measurements" u 1:(-0.1) w p pt 7, "" u 1:(1/12.) s kdens bandwidth .1, "" u 1:(1/12.) s kdens bandwidth 0.2, "" u 1:(1/12.) s cumul
```





```plain

unset key

set multiplot layout 2,2 margins 0.06,0.95,0.085,0.95 spacing 0.075,0.1

# --------------------
set xtics 2,2 
set mxtics 2

set label 1 "Orders per Day" at 8,3
plot [1:14] "orders" u (strcol(2)[9:10]+0):(1) s f w lp pt 7

set xtics 1
unset mxtics

# --------------------
set label 1 "Histogram:\nItems per Order" at 3.5,50
plot [0:7] "orders" u 4:(1) s f w boxes

# --------------------
set label 1 "Value vs Weight" at 4,7
plot "orders" u 5:6 w p pt 6

# --------------------
set xtics ( "Date" 1, "Items" 2, "Weight" 3, "Value" 4, "Ship" 5 )
unset ytics

set style parallel lw 1
set linetype 1000 lc "0xff000000"

ship(c) = 0+strcol(c)[1:1]   # return ship method as integer

unset label 1
plot [1:5] "orders" u (strcol(2)[9:10]+0):4:5:6:(ship(7)) w parallel lt 10,\
          "" u (strcol(2)[9:10]+0):4:5:6:(ship(7)):(ship(7)==0?1:1000) \
          w parallel lc var

unset multi
```



También puede ordenar a gnuplot que ignore las primeras n líneas de un archivo utilizando la directiva `skip` en el comando plot:

```plain
plot "data" skip 2 using 1:2
```



```plain
plot "traffic1" index 1 using 1:2 w linespoints
plot "traffic1" index 0:2 using 1:2 w linespoints
plot "traffic1" index 0:2:2 using 1:2 w linespoints
plot "traffic1" index "host=staging" using 1:2 w linespoints
```



```plain
set datafile separator
set datafile separator ","
set datafile separator comma
set datafile separator tab
# default
set datafile separator whitespace
set datafile separator
```



```plain
set datafile missing "NaN"
```





| Styles             |      |
| ------------------ | ---- |
| `with points`      |      |
| `with lines`       |      |
| `with linespoints` |      |
| `with dots`        |      |



| Points      |                          |
| ----------- | ------------------------ |
| `pointsize` | Puede utilizarse con set |
| `pointtype` |                          |



| Lines |      |
| ----------- | ---- |
| `linewidth` |      |



| Linespoints        |                          |
| ------------------ | ------------------------ |
| `pointsize`        | Puede utilizarse con set |
| `pointtype`        |                          |
| `linewidth`        |                          |
| `pointinterval`    |                          |
| `pointintervalbox` | Puede utilizarse con set |





| Dots        |      |
| ----------- | ---- |
| `linewidth` |      |





| Command | Description |
| ----------- | ---- |
| `help` | Open the help documentation. |
| `exit` | Close gnuplot |
| `reset` | The **reset**  command causes all graph-related options that can be set with the set command to return to their default values. |
| `set terminal` | Display what kind of output to generate |



## Terminals

| Terminal   | Description                                      |
| ---------- | ------------------------------------------------ |
| `qt`       | Qt cross-platform interactive terminal           |
| `wxt`      | wxWidgets cross-platform interactive terminal    |
| `svg`      | W3C Scalable Vector Graphics                     |
| `jpeg`     | JPEG images using libgd and TrueType fonts       |
| `pdfcairo` | pdf terminal based on cairo                      |
| `png`      | PNG images using libgd and TrueType fonts        |
| `pngcairo` | png terminal based on cairo                      |
| `epslatex` | LaTeX picture environment using graphicx package |



## pdfcairo

The **pdfcairo** terminal device generates output in pdf. The actual drawing  is done via cairo, a 2D graphics library, and pango, a library for laying out  and rendering text.

```gnuplot
set terminal pdfcairo
```



| Defaults                | Variants           |
| ----------------------- | ------------------ |
| `enhanced`              | `noenhanced`       |
| `color`                 | `mono`             |
| `font "Sans,12"`        |                    |
| `fontscale 0.5`         |                    |
| `linewidth 0.5`         |                    |
| `butt`                  | `rounded`,`square` |
| `dashlength 0.5`         |                    |
| `background <rgbcolor>` |                    |
| `size 5in, 3in`         |                    |



## pngcairo

The **pngcairo** terminal device generates output in png. The actual drawing  is done via cairo, a 2D graphics library, and pango, a library for laying out  and rendering text. 

```gnuplot
set terminal pngcairo
```



| Defaults                | Variants           |
| ----------------------- | ------------------ |
| `enhanced`              | `noenhanced`       |
| `notransparent`         | `transparent`      |
| `nointerlace`           | `interlace`        |
| `color`   | `mono`    |
| `rounded`               | `butt`, `square` |
| `linewidth 0.5`         |                    |
| `dashlength 0.5`         |                    |
| `font "Sans,12"`        |                    |
| `fontscale 1`        |                    |
| `linewidth 1`        |                    |
| `size 640, 480`   |                    |
| `nocrop`   | `crop` |
| `background <rgbcolor>` |                    |
| `pointscale 1` | |



## epslatex

The **epslatex** driver generates output for further processing by LaTeX. 

The epslatex terminal prints a plot as **terminal postscript  eps** but transfers the texts to LaTeX instead of including in the PostScript code. Thus, many options are the same as in the **postscript terminal**. 

```powershell
set terminal epslatex
```



| Defaults                | Variants      |
| ----------------------- | ------------- |
| `input`                 | `standalone`  |
| `notransparent`         | `transparent` |
| `nointerlace`           | `interlace`   |
| `notruecolor`           | `truecolor`   |
| `rounded`               | `butt`        |
| `linewidth 1.0`         |               |
| `dashlength 1.0`        |               |
| `pointscale`            |               |
| `font "Sans,12"`        |               |
| `fontscale 1`           |               |
| `linewidth 0.5`         |               |
| `size 5in, 3.5in`       |               |
| `nocrop`                | `crop`        |
| `background <rgbcolor>` |               |



## LaTeX fonts

https://ctan.org/pkg/cm-unicode
cmunrm.otf
cmuntt.otf

