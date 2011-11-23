package edu.stanford.math.plex4.graph.random;

import edu.stanford.math.plex4.graph.AbstractUndirectedGraph;
import edu.stanford.math.plex4.graph.UndirectedListGraph;

/**
 * This class abstracts the construction of graphs.
 * 
 * @author Andrew Tausz
 *
 */
public abstract class GraphInstanceGenerator {
	public enum ImplementationType {
		adjacencyList, matrix, compact
	}

	protected ImplementationType implementationType;
	protected AbstractUndirectedGraph graphImplementation;

	public GraphInstanceGenerator() {
		this.implementationType = ImplementationType.adjacencyList;
	}

	public GraphInstanceGenerator(ImplementationType implementationType) {
		this.implementationType = implementationType;
	}

	public void setImplementationType(ImplementationType implementationType) {
		this.implementationType = implementationType;
	}

	protected AbstractUndirectedGraph initializeGraph(int numNodes) {
		if (this.implementationType == ImplementationType.adjacencyList) {
			return new UndirectedListGraph(numNodes);
		} else {
			return null;
		}
	}

	public abstract AbstractUndirectedGraph generate();
}
