% Exercise 5.4.6

% Thanks to Ulrich Bauer for this solution.

clc; clear; close all;

max_dimension = 3;
num_points = 10000;
num_landmark_points = 200;
nu = 1;
num_divisions = 100;

% create the set of points
point_cloud = getDoubleTorusPoints(num_points, 0.001);
plot3(point_cloud(:,1), point_cloud(:,2), point_cloud(:,3), '.')
axis equal

% create a sequential maxmin landmark selector
landmark_selector = api.Plex4.createMaxMinSelector(point_cloud, num_landmark_points);
max_filtration_value = 0.1;

% create a lazy witness stream
stream = streams.impl.LazyWitnessStream(landmark_selector.getUnderlyingMetricSpace(), landmark_selector, max_dimension, max_filtration_value, nu, num_divisions);
stream.finalizeStream()

% print out the size of the stream
num_simplices = stream.getSize()

% get persistence algorithm over Z/2Z
persistence = api.Plex4.getModularSimplicialAlgorithm(max_dimension, 2);

% compute the intervals
intervals = persistence.computeIntervals(stream);

% create the barcode plots
options.filename = 'doubleTorus';
options.max_filtration_value = max_filtration_value;
options.max_dimension = max_dimension - 1;
plot_barcodes(intervals, options);

% Note: Between filtration values 0.04 and 0.08, the correct Betti barcodes
% Betti_0 = 1, Betti_1 = 4, and Betti_2 = 1 are generally obtained.