/**
 * 
 */
package edu.stanford.math.plex4.graph;

import edu.stanford.math.primitivelib.autogen.pair.IntIntPair;
import gnu.trove.TIntHashSet;
import gnu.trove.TIntObjectHashMap;

import java.util.Iterator;

/**
 * This class implements the functionality of an undirected graph.
 * It uses an adjacency list data structure. That is, for each 
 * vertex u, it stores the set of vertices {v_1, .., v_k} such that
 * u is connected to v_i and v_i < u.
 * 
 * For example consider the following graph:
 * <code>
 * 0 -- 1
 * |	|
 * 2 -- 3 -- 4
 * </code>
 * 
 * The following storage scheme is used:
 * 1: {0}
 * 2: {0}
 * 3: {1, 2}
 * 4: {3}
 * 
 * 
 * @author Andrew Tausz
 *
 */
public class UndirectedListGraph implements AbstractUndirectedGraph {
	/**
	 * This is the adjacency set structure 
	 */
	private final TIntObjectHashMap<TIntHashSet> adjacencySets;
	
	/**
	 * Stores the number of vertices in the graph - must be prespecified
	 */
	private final int numVertices;
	
	/**
	 * Constructor which initializes the graph to consist of disconnected
	 * vertices. The number of vertices is initialized to numVertices.
	 * 
	 * @param numVertices the number of vertices to initialize the graph with
	 */
	public UndirectedListGraph(int numVertices) {
		this.numVertices = numVertices;
		this.adjacencySets = new TIntObjectHashMap<TIntHashSet>();
	}
	
	/**
	 * This constructor initializes the graph with the contents of another graph.
	 * 
	 * @param graph the graph to initialize with
	 */
	public UndirectedListGraph(AbstractUndirectedGraph graph) {
		this.numVertices = graph.getNumVertices();
		this.adjacencySets = new TIntObjectHashMap<TIntHashSet>();
		
		for (IntIntPair edge: graph) {
			this.addEdge(edge.getFirst(), edge.getSecond());
		}
	}
	
	/**
	 * Constructor which initializes the graph to contain the edges given in the
	 * specified adjacency matrix.
	 * 
	 * @param adjacencyMatrix the adjacency matrix to initialize with
	 */
	public UndirectedListGraph(int[][] adjacencyMatrix) {
		int n = adjacencyMatrix.length;
		this.numVertices = n;
		this.adjacencySets = new TIntObjectHashMap<TIntHashSet>();
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < i; j++) {
				if (adjacencyMatrix[i][j] != 0) {
					this.addEdge(i, j);
				}
			}
		}
	}
	
	/* (non-Javadoc)
	 * @see edu.stanford.math.plex_plus.graph.AbstractGraph#addEdge(int, int)
	 */
	public void addEdge(int i, int j) {
		int x = (i < j ? i : j);
		int y = (i < j ? j : i);
		if (!this.adjacencySets.containsKey(y)) {
			this.adjacencySets.put(y, new TIntHashSet());
		}
		this.adjacencySets.get(y).add(x);
	}

	/* (non-Javadoc)
	 * @see edu.stanford.math.plex_plus.graph.AbstractGraph#containsEdge(int, int)
	 */
	public boolean containsEdge(int i, int j) {
		int x = (i < j ? i : j);
		int y = (i < j ? j : i);
		if (!this.adjacencySets.containsKey(y)) {
			return false;
		}
		return this.adjacencySets.get(y).contains(x);
	}

	/* (non-Javadoc)
	 * @see edu.stanford.math.plex_plus.graph.AbstractGraph#getNumEdges()
	 */
	public int getNumEdges() {
		// TODO: complete
		throw new UnsupportedOperationException();
	}

	/* (non-Javadoc)
	 * @see edu.stanford.math.plex_plus.graph.AbstractGraph#getNumVertices()
	 */
	public int getNumVertices() {
		return this.numVertices;
	}

	/* (non-Javadoc)
	 * @see edu.stanford.math.plex_plus.graph.AbstractGraph#removeEdge(int, int)
	 */
	public void removeEdge(int i, int j) {
		int x = (i < j ? i : j);
		int y = (i < j ? j : i);
		if (!this.adjacencySets.containsKey(y)) {
			return;
		}
		this.adjacencySets.get(y).remove(x);
		if (this.adjacencySets.get(y).isEmpty()) {
			this.adjacencySets.remove(y);
		}
	}
	
	/**
	 * This function returns the set of neighbors of vertex i in the graph
	 * which have indices less than i.
	 * 
	 * @param i the vertex to query
	 * @return the set of j such that j < i and i ~ j
	 */
	public TIntHashSet getLowerNeighbors(int i) {
		if (this.adjacencySets.contains(i)) {
			return this.adjacencySets.get(i);
		} else {
			return new TIntHashSet();
		}
	}

	public Iterator<IntIntPair> iterator() {
		return new UndirectedListEdgeIterator(this.adjacencySets);
	}
}
