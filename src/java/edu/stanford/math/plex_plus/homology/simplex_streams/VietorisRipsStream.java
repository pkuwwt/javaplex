/**
 * 
 */
package edu.stanford.math.plex_plus.homology.simplex_streams;

import edu.stanford.math.plex_plus.graph.UndirectedWeightedListGraph;
import edu.stanford.math.plex_plus.math.metric.interfaces.FiniteMetricSpace;
import edu.stanford.math.plex_plus.utility.ExceptionUtility;
import gnu.trove.iterator.TIntIterator;
import gnu.trove.set.TIntSet;


/**
 * This class implements the Vietoris-Rips filtered simplicial complex.
 * A simplex [v_0, ..., v_k] is in VR(r) if and only if the pairwise distances
 * d(v_i, v_j) are less than r for all 0 <= i, j <= k. Thus a Vietoris-Rips
 * complex is fully defined by its 1-skeleton, in that it is the maximal 
 * simplicial complex given such a 1-skeleton. For this reason, we simply
 * derive from the MaximalStream abstract class, and implement the pairwise
 * thresholding in order to generate the 1-skeleton.
 * 
 * @author Andrew Tausz
 *
 * @param <T> the base type of the underlying metric space
 */
public class VietorisRipsStream<T> extends MaximalStream {
	
	/**
	 * This is the metric space upon which the stream is built from.
	 */
	protected final FiniteMetricSpace<T> metricSpace;
	
	/**
	 * Constructor which initializes the complex with a metric space.
	 * 
	 * @param metricSpace the metric space to use in the construction of the complex
	 * @param maxDistance the maximum allowable distance
	 * @param maxDimension the maximum dimension of the complex
	 */
	public VietorisRipsStream(FiniteMetricSpace<T> metricSpace, double maxDistance, int maxDimension) {
		super(maxDimension, maxDistance);
		ExceptionUtility.verifyNonNull(metricSpace);
		this.metricSpace = metricSpace;
	}

	@Override
	protected UndirectedWeightedListGraph constructEdges() {
		int n = this.metricSpace.size();
		TIntSet neighborhood = null;
		
		UndirectedWeightedListGraph graph = new UndirectedWeightedListGraph(n);
		
		for (int i = 0; i < n; i++) {
			// obtain the neighborhood of the i-th point
			neighborhood = this.metricSpace.getNeighborhood(metricSpace.getPoint(i), this.maxDistance);
			
			// get the pairwise distances of the points and store them
			TIntIterator iterator = neighborhood.iterator();
			while (iterator.hasNext()) {
				int j = iterator.next();
				
				if (i == j) {
					continue;
				}
				
				double distance = this.metricSpace.distance(i, j);
				graph.addEdge(i, j, distance);
			}
		}
		
		return graph;
	}
	
}
