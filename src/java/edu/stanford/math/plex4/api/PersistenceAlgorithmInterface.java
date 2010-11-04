package edu.stanford.math.plex4.api;

import java.util.ArrayList;
import java.util.List;

import edu.stanford.math.plex4.autogen.homology.BooleanAbsoluteHomology;
import edu.stanford.math.plex4.autogen.homology.BooleanClassicalHomology;
import edu.stanford.math.plex4.autogen.homology.BooleanRelativeHomology;
import edu.stanford.math.plex4.autogen.homology.IntAbsoluteHomology;
import edu.stanford.math.plex4.autogen.homology.IntClassicalHomology;
import edu.stanford.math.plex4.autogen.homology.IntRelativeHomology;
import edu.stanford.math.plex4.autogen.homology.ObjectAbsoluteHomology;
import edu.stanford.math.plex4.autogen.homology.ObjectClassicalHomology;
import edu.stanford.math.plex4.autogen.homology.ObjectRelativeHomology;
import edu.stanford.math.plex4.homology.chain_basis.Cell;
import edu.stanford.math.plex4.homology.chain_basis.CellComparator;
import edu.stanford.math.plex4.homology.chain_basis.Simplex;
import edu.stanford.math.plex4.homology.chain_basis.SimplexComparator;
import edu.stanford.math.plex4.homology.interfaces.AbstractPersistenceAlgorithm;
import edu.stanford.math.plex4.interop.Plex3PersistenceAlgorithm;
import edu.stanford.math.primitivelib.algebraic.impl.ModularIntField;
import edu.stanford.math.primitivelib.algebraic.impl.ModularIntegerField;
import edu.stanford.math.primitivelib.autogen.algebraic.IntAbstractField;
import edu.stanford.math.primitivelib.autogen.algebraic.ObjectAbstractField;

public class PersistenceAlgorithmInterface {
	private static IntAbstractField intField = ModularIntField.getInstance(11);
	private static ObjectAbstractField<Integer> fractionField = ModularIntegerField.getInstance(13);
	
	public static AbstractPersistenceAlgorithm<Simplex> getPlex3SimplicialAbsoluteHomology(int maxDimension) {
		return new Plex3PersistenceAlgorithm(maxDimension);
	}
	
	public static AbstractPersistenceAlgorithm<Simplex> getBooleanSimplicialAbsoluteHomology(int maxDimension) {
		return new BooleanAbsoluteHomology<Simplex>(SimplexComparator.getInstance(), 0, maxDimension);
	}
	
	public static AbstractPersistenceAlgorithm<Simplex> getIntSimplicialAbsoluteHomology(int maxDimension) {
		return new IntAbsoluteHomology<Simplex>(intField, SimplexComparator.getInstance(), 0, maxDimension);
	}
	
	public static AbstractPersistenceAlgorithm<Simplex> getRationalSimplicialAbsoluteHomology(int maxDimension) {
		return new ObjectAbsoluteHomology<Integer, Simplex>(fractionField, SimplexComparator.getInstance(), 0, maxDimension);
	}
	
	public static AbstractPersistenceAlgorithm<Simplex> getBooleanSimplicialClassicalHomology(int maxDimension) {
		return new BooleanClassicalHomology<Simplex>(SimplexComparator.getInstance(), 0, maxDimension);
	}
	
	public static AbstractPersistenceAlgorithm<Simplex> getIntSimplicialClassicalHomology(int maxDimension) {
		return new IntClassicalHomology<Simplex>(intField, SimplexComparator.getInstance(), 0, maxDimension);
	}
	
	public static AbstractPersistenceAlgorithm<Simplex> getRationalSimplicialClassicalHomology(int maxDimension) {
		return new ObjectClassicalHomology<Integer, Simplex>(fractionField, SimplexComparator.getInstance(), 0, maxDimension);
	}
	
	public static List<AbstractPersistenceAlgorithm<Simplex>> getAllSimplicialAbsoluteHomologyAlgorithms(int maxDimension) {
		List<AbstractPersistenceAlgorithm<Simplex>> list = getAllPlex4SimplicialAbsoluteHomologyAlgorithms(maxDimension);
		list.add(getPlex3SimplicialAbsoluteHomology(maxDimension));
		return list;
	}
	
	public static List<AbstractPersistenceAlgorithm<Simplex>> getAllPlex4SimplicialAbsoluteHomologyAlgorithms(int maxDimension) {
		List<AbstractPersistenceAlgorithm<Simplex>> list = new ArrayList<AbstractPersistenceAlgorithm<Simplex>>();
		
		list.add(getBooleanSimplicialAbsoluteHomology(maxDimension));
		list.add(getIntSimplicialAbsoluteHomology(maxDimension));
		list.add(getRationalSimplicialAbsoluteHomology(maxDimension));
		list.add(getBooleanSimplicialClassicalHomology(maxDimension));
		list.add(getIntSimplicialClassicalHomology(maxDimension));
		list.add(getRationalSimplicialClassicalHomology(maxDimension));
		
		return list;
	}
	
	public static AbstractPersistenceAlgorithm<Simplex> getBooleanSimplicialRelativeHomology(int maxDimension) {
		return new BooleanRelativeHomology<Simplex>(SimplexComparator.getInstance(), 0, maxDimension);
	}
	
	public static AbstractPersistenceAlgorithm<Simplex> getIntSimplicialRelativeHomology(int maxDimension) {
		return new IntRelativeHomology<Simplex>(intField, SimplexComparator.getInstance(), 0, maxDimension);
	}
	
	public static AbstractPersistenceAlgorithm<Simplex> getRationalSimplicialRelativeHomology(int maxDimension) {
		return new ObjectRelativeHomology<Integer, Simplex>(fractionField, SimplexComparator.getInstance(), 0, maxDimension);
	}
	
	
	/*
	 * Cellular Homology
	 */
	
	public static AbstractPersistenceAlgorithm<Cell> getBooleanCellularAbsoluteHomology(int maxDimension) {
		return new BooleanAbsoluteHomology<Cell>(CellComparator.getInstance(), 0, maxDimension);
	}
	
	public static AbstractPersistenceAlgorithm<Cell> getIntCellularAbsoluteHomology(int maxDimension) {
		return new IntAbsoluteHomology<Cell>(intField, CellComparator.getInstance(), 0, maxDimension);
	}
	
	public static AbstractPersistenceAlgorithm<Cell> getRationalCellularAbsoluteHomology(int maxDimension) {
		return new ObjectAbsoluteHomology<Integer, Cell>(fractionField, CellComparator.getInstance(), 0, maxDimension);
	}
	
	public static AbstractPersistenceAlgorithm<Cell> getBooleanCellularClassicalHomology(int maxDimension) {
		return new BooleanClassicalHomology<Cell>(CellComparator.getInstance(), 0, maxDimension);
	}
	
	public static AbstractPersistenceAlgorithm<Cell> getIntCellularClassicalHomology(int maxDimension) {
		return new IntClassicalHomology<Cell>(intField, CellComparator.getInstance(), 0, maxDimension);
	}
	
	public static AbstractPersistenceAlgorithm<Cell> getRationalCellularClassicalHomology(int maxDimension) {
		return new ObjectClassicalHomology<Integer, Cell>(fractionField, CellComparator.getInstance(), 0, maxDimension);
	}
	
	public static List<AbstractPersistenceAlgorithm<Cell>> getAllPlex4CellularAbsoluteHomologyAlgorithms(int maxDimension) {
		List<AbstractPersistenceAlgorithm<Cell>> list = new ArrayList<AbstractPersistenceAlgorithm<Cell>>();
		
		list.add(getBooleanCellularAbsoluteHomology(maxDimension));
		list.add(getIntCellularAbsoluteHomology(maxDimension));
		list.add(getRationalCellularAbsoluteHomology(maxDimension));
		list.add(getBooleanCellularClassicalHomology(maxDimension));
		list.add(getIntCellularClassicalHomology(maxDimension));
		list.add(getRationalCellularClassicalHomology(maxDimension));
		
		return list;
	}
}
