#include <iostream>
#include <fstream>
#include <string>
#include <cmath>
#include <thread>
#include <chrono>

int main(){

  // Open a pipe to gnuplot
  FILE* gnuplotPipe = popen("gnuplot -persistent", "w");
  if (!gnuplotPipe) {
    std::cerr << "[Error]: Could not open pipe to gnuplot" << "\n";
    return 1;
  }

  // Set gnuplot terminal
  fprintf(gnuplotPipe, "reset\n");
  fprintf(gnuplotPipe, "unit = 3\n");
  fprintf(gnuplotPipe, "set terminal pngcairo size unit*640, unit*384 font 'CMU Serif, 10' fontscale 1*unit*0.95\n");

  // Set up the plot
  fprintf(gnuplotPipe, "set title 'Data from C++'\n");
  fprintf(gnuplotPipe, "set xlabel 'X-axis'\n");
  fprintf(gnuplotPipe, "set ylabel 'Y-axis'\n");
  fprintf(gnuplotPipe, "unset key\n");
  fprintf(gnuplotPipe, "set xrange [0.0:10.0]\n");
  fprintf(gnuplotPipe, "set yrange [-1.5:1.5]\n");

  fprintf(gnuplotPipe, "set tics format '%%.1f'\n");
  fprintf(gnuplotPipe, "set grid\n");


  // Animation parameters
  double amplitude = 1.0;
  double frequency = 1.0;
  double phase = 0.0;

  double endValue = 0.1;
  std::string outName = "output/output";
  std::string iterStr;
  int i = 0;

  // Continuosly generate data and send to gnuplot
  while (true) {
    // Tell gnuplot to expect inline data
    iterStr = outName + std::to_string(i++) + ".png";
    fprintf(gnuplotPipe, "set output '%s'\n", iterStr.c_str());
    fprintf(gnuplotPipe, "plot '-' using 1:2 with lines title 'Sine Wave'\n");
    double step = 0.01;
    for (double x = 0.0; x <= endValue; x += step) {
      // Calculate y value with shifting phase for animation effect
      double y = amplitude * std::sin(frequency * x + phase);
      fprintf(gnuplotPipe, "%lf %lf\n", x, y);
    }

    // Signal the end of inline data
    fprintf(gnuplotPipe, "e\n");
    fflush(gnuplotPipe);
    std::this_thread::sleep_for(std::chrono::milliseconds(1));
    endValue += 0.1;
    if (endValue > 10.0) break;

  }

  /*
  // Continuosly generate data and send to gnuplot
  while (true) {
    // Tell gnuplot to expect inline data
    fprintf(gnuplotPipe, "plot '-' using 1:2 with lines title 'Generated Data'\n");

    double step = 0.01;
    for (double x = 0.0; x <= 10.0; x += step) {
      double y = sin(amp*x);
      fprintf(gnuplotPipe, "%lf %lf\n", x, y);
    }

    // Signal the end of inline data
    fprintf(gnuplotPipe, "e\n");
    fflush(gnuplotPipe);

    // Pause briefly before updating
    std::this_thread::sleep_for(std::chrono::milliseconds(100));
    amp += 1.0;
    if (amp > 10.0) break;

  }
  */

  // Close the pipe when finished
  pclose(gnuplotPipe);

  return 0;
}
