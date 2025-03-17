#include <iostream>
#include <fstream>
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

  // Set up the plot
  fprintf(gnuplotPipe, "set title 'Data from C++'\n");
  fprintf(gnuplotPipe, "set xlabel 'X-axis'\n");
  fprintf(gnuplotPipe, "set ylabel 'Y-axis'\n");

  // Animation parameters
  double phase = 0.0;
  double amplitude = 1.0;
  double frequency = 1.0;

  // Number of animation frames
  int numFrames = 100;

  // Continuosly generate data and send to gnuplot
  for (int frame = 0; frame < numFrames; frame++) {
    // Tell gnuplot to expect inline data
    fprintf(gnuplotPipe, "plot '-' using 1:2 with lines title 'Sine Wave'\n");
    double step = 0.1;
    for (double x = 0.0; x <= 10.0; x += step) {
      // Calculate y value with shifting phase for animation effect
      double y = amplitude * std::sin(frequency * x + phase);
      fprintf(gnuplotPipe, "%lf %lf\n", x, y);
    }

    // Signal the end of inline data
    fprintf(gnuplotPipe, "e\n");
    fflush(gnuplotPipe);
    std::this_thread::sleep_for(std::chrono::milliseconds(20));
    phase += 0.5;

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
