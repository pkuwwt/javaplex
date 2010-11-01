package edu.stanford.math.plex4.homology.streams.derived;

import java.util.Comparator;

import edu.stanford.math.plex4.homology.streams.interfaces.AbstractFilteredStream;
import edu.stanford.math.primitivelib.autogen.pair.ObjectObjectPair;
import edu.stanford.math.primitivelib.utility.ReversedComparator;

public class HomStream<T, U> extends TensorStream<T, U>{
	
	public HomStream(AbstractFilteredStream<T> stream1, AbstractFilteredStream<U> stream2, Comparator<T> TComparator, Comparator<U> UComparator) {
		super(new DualStream<T>(stream1, TComparator), stream2, new ReversedComparator<T>(TComparator), UComparator);
	}
	
	@Override
	public int getDimension(ObjectObjectPair<T, U> element) {
		return (this.stream2.getDimension(element.getSecond()) - this.stream1.getDimension(element.getFirst()));
	}
}