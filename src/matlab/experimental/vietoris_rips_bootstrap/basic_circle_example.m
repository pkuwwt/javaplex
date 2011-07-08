clc; clear; close all;

num_samples = 2;
sample_size = 20;

max_dimension = 1;
num_points = 10000;
max_distance = 1.3;

points = examples.PointCloudExamples.getEquispacedCirclePoints(num_points);

bootstrapper = homology.zigzag.bootstrap.VietorisRipsBootstrapper(points, max_distance, max_dimension, num_samples, sample_size);

barcodes = bootstrapper.performBootstrap()

%% 

transformer = homology.filtration.IdentityConverter.getInstance();
filtration_value_intervals = transformer.transform(barcodes);

plot_barcodes(filtration_value_intervals);

%%

indices_0 = bootstrapper.getSubset(0)
metric_space_0 = metric.impl.EuclideanMetricSpace(utility.ArrayUtility.getSubset(points, indices_0));
stream_0 = streams.impl.VietorisRipsStream(metric_space_0, max_distance, max_dimension + 1);
stream_0.finalizeStream();
filename_0 = sprintf('circle-vietoris-rips-%d.pov', 0);
create_pov_file(stream_0, metric_space_0, filename_0);
render_pov_file(filename_0);

indices_1 = bootstrapper.getSubset(1)
metric_space_1 = metric.impl.EuclideanMetricSpace(utility.ArrayUtility.getSubset(points, indices_1));
stream_1 = streams.impl.VietorisRipsStream(metric_space_1, max_distance, max_dimension + 1);
stream_1.finalizeStream();
filename_1 = sprintf('circle-vietoris-rips-%d.pov', 1);
create_pov_file(stream_1, metric_space_1, filename_1);
render_pov_file(filename_1);

indices_01 = utility.ArrayUtility.union(indices_0, indices_1);
metric_space_01 = metric.impl.EuclideanMetricSpace(utility.ArrayUtility.getSubset(points, indices_01));
stream_01 = streams.impl.VietorisRipsStream(metric_space_01, max_distance, max_dimension + 1);
stream_01.finalizeStream();
filename_01 = sprintf('circle-vietoris-rips-01.pov');
create_pov_file(stream_01, metric_space_01, filename_01);
render_pov_file(filename_01);