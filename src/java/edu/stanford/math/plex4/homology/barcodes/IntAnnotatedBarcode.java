package edu.stanford.math.plex4.homology.barcodes;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import edu.stanford.math.plex4.utility.ComparisonUtility;
import edu.stanford.math.plex4.utility.ExceptionUtility;
import edu.stanford.math.primitivelib.autogen.pair.ObjectObjectPair;

/**
 * This class implements the functionality of a barcode, which is an
 * ordered collection of persistence intervals along with a dimension 
 * specifier. Additionally, each interval is annotated with a generating
 * object (usually a generating cycle).
 * 
 * @author Andrew Tausz
 *
 */
public class IntAnnotatedBarcode<T> implements Iterable<ObjectObjectPair<IntHalfOpenInterval, T>> {
	private final int dimension;
	private final List<ObjectObjectPair<IntHalfOpenInterval, T>> intervals = new ArrayList<ObjectObjectPair<IntHalfOpenInterval, T>>();
	/**
	 * This constructor initializes the barcode to be empty, with the
	 * specified dimension.
	 * 
	 * @param dimension the dimension to initialize to
	 */
	public IntAnnotatedBarcode(int dimension) {
		this.dimension = dimension;
	}
	
	/**
	 * Gets the dimension of the barcode.
	 * 
	 * @return the dimension of the barcode
	 */
	public int getDimension() {
		return this.dimension;
	}
	
	/**
	 * Gets the number of intervals in the barcode.
	 * 
	 * @return the number of intervals in the barcode
	 */
	public int getSize() {
		return this.intervals.size();
	}
	
	/**
	 * Gets the interval at the given index.
	 * 
	 * @param index the index
	 * @return the interval at the given index
	 */
	public IntHalfOpenInterval getInterval(int index) {
		return this.intervals.get(index).getFirst();
	}
	
	/**
	 * Gets the generating cycle at the given index.
	 * 
	 * @param index the index
	 * @return the generating cycle at the given index
	 */
	public T getGeneratingCycle(int index) {
		return this.intervals.get(index).getSecond();
	}
	
	/**
	 * This returns the list of intervals.
	 * 
	 * @return the list of intervals
	 */
	public List<ObjectObjectPair<IntHalfOpenInterval, T>> getIntervals() {
		return this.intervals;
	}
	
	/**
	 * This returns an augmented collection containing only the infinite intervals and their
	 * generators.
	 * 
	 * @return an augmented barcode containing the infinite intervals
	 */
	public IntAnnotatedBarcode<T> getInfiniteIntervals() {
		IntAnnotatedBarcode<T> infiniteBarcode = new IntAnnotatedBarcode<T>(this.dimension);
		for (ObjectObjectPair<IntHalfOpenInterval, T> pair: this.intervals) {
			if (pair.getFirst().isInfinite()) {
				infiniteBarcode.addInterval(pair.getFirst(), pair.getSecond());
			}
		}
		return infiniteBarcode;
	}
	
	/**
	 * This function adds the specified interval to the barcode. The interval
	 * is added to the end of the already existing list of intervals.
	 * 
	 * @param interval the PersistentInterval to add
	 */
	public void addInterval(IntHalfOpenInterval interval, T representative) {
		ExceptionUtility.verifyNonNull(interval);
		this.intervals.add(new ObjectObjectPair<IntHalfOpenInterval, T>(interval, representative));
	}
	
	/**
	 * This function returns the number of "active" intervals at
	 * a particular point.
	 * 
	 * @param point the point to query
	 * @return the number of intervals containing the supplied point
	 */
	public int getSliceCardinality(int point) {
		int cardinality = 0;
		
		for (ObjectObjectPair<IntHalfOpenInterval, T> pair: this.intervals) {
			if (pair.getFirst().containsPoint(point)) {
				cardinality++;
			}
		}
		
		return cardinality;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		
		builder.append("Dimension: " + this.dimension + "\n");
		for (ObjectObjectPair<IntHalfOpenInterval, T> pair: this.intervals) {
			builder.append(pair.getFirst().toString());
			builder.append(": ");
			builder.append(pair.getSecond().toString());
			builder.append("\n");
		}
		
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + dimension;
		result = prime * result + ((intervals == null) ? 0 : intervals.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		IntAnnotatedBarcode<?> other = (IntAnnotatedBarcode<?>) obj;
		if (dimension != other.dimension)
			return false;
		if (intervals == null) {
			if (other.intervals != null)
				return false;
		} else if (!ComparisonUtility.setEquals(intervals, other.intervals))
			return false;
		return true;
	}

	public Iterator<ObjectObjectPair<IntHalfOpenInterval, T>> iterator() {
		return this.intervals.iterator();
	}
}
