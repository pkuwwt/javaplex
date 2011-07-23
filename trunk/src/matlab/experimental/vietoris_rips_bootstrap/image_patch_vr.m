function [barcodes, stream_size] = image_patch_vr(T, k, S, max_filtration_value, display_plot)

    import edu.stanford.math.plex4.*;

    if (~exist('display_plot', 'var'))
        display_plot = true;
    end

    path = '../../../../data/natural_images';
    label = 'n50000Dct';
    datafile = sprintf('%s/%s.mat', path, label);

    dimension = 1;
    num_divisions = 1000;

    load(datafile, label);
    pointsRange = n50000Dct;
    size(pointsRange);

    cache_file_prefix = sprintf('%s/cached_density_ranks/%s', path, label);
    indices = get_core_subset_cached(pointsRange, k, T, cache_file_prefix);

    rp = randperm(T);
    indices = indices(rp(1:S), :);

    % create a Vietoris-Rips stream 
    stream = api.Plex4.createVietorisRipsStream(pointsRange(indices, :), dimension + 1, max_filtration_value, num_divisions);
    stream_size = stream.getSize();

    % get the default persistence algorithm
    persistence = api.Plex4.getDefaultSimplicialAlgorithm(dimension + 1);

    % compute intervals
    barcodes = persistence.computeIntervals(stream);

    options.file_format = 'eps';
    options.filename = sprintf('outputs/%s-%d-%d-%1.3f.%s', label, k, T, max_filtration_value, options.file_format);
    options.caption = sprintf('Dataset %s with Density Filtration: k = %d, T = %d, f_{max} = %2.3f', label, k, T, max_filtration_value);

    options.max_filtration_value = max_filtration_value;
    h = plot_barcodes(barcodes, options);

    if (~display_plot)
        close;
    end

end