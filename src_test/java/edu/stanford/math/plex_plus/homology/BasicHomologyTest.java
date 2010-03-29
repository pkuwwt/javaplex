package edu.stanford.math.plex_plus.homology;

import edu.stanford.math.plex_plus.homology.ArraySimplex;
import edu.stanford.math.plex_plus.homology.FullSimplicialComplex;
import edu.stanford.math.plex_plus.homology.SimplicialComplex;


/**
 * Very basic tests of homology related data structures.
 * 
 * @author Andrew Tausz
 *
 */
public class BasicHomologyTest {	
	public static void main(String[] args) {
		basicTest();
	}
	
	public static void basicTest() {
		// create a new simplicial complex
		SimplicialComplex complex = new FullSimplicialComplex();
		
		// add simplices
		complex.addSimplex(new ArraySimplex(new int[]{0, 1}));
		complex.addSimplex(new ArraySimplex(new int[]{1, 2}));
		complex.addSimplex(new ArraySimplex(new int[]{2, 0}));
		complex.addSimplex(new ArraySimplex(new int[]{2, 3, 4, 5}));
		
		// print the entire complex
		System.out.println(complex.toString());
		
		// print the 2-boundary matrix in sparse form 
		System.out.println(complex.getBoundaryMatrix(1).toString());	
	}
}
