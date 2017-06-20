package com.jardis.model;

public class Dato {
	private Empresa empresa;
	private Cuenta cuenta;
	private int anio;
	private int valor;
	
	// Constructor
	public Dato(Empresa _empresa, Cuenta _cuenta, int _anio, int _valor){
		empresa = _empresa;
		cuenta = _cuenta;
		anio = _anio;
		valor = _valor;
	}
		
	// Getters
	public Empresa getEmpresa(){
		return empresa;
	}
		
	public Cuenta getCuenta(){
		return cuenta;
	}	
		
	public int getAnio(){
		return anio;
	}
		
	public int getValor(){
		return valor;
	}
	
}
