package com.caia.model;

import java.util.ArrayList;

public class Database {
	
	private static Database instance = null;
	private ArrayList<Row> rows = new ArrayList<Row>();
	//private ArrayList<Indicador> indicadores = new ArrayList<Indicador>();

	protected Database(){}
	
	public static Database getInstance(){
		if(instance == null){
			instance = new Database();
		}
		
		return instance;
	}
	
	public void addRow(Row unaRow){
		rows.add(unaRow);
	}
	
	public void vaciar(){
		rows.clear();
	}
	
	public ArrayList<Row> getRows() {
		return rows;
	}

	public boolean esVacio() {
		return rows.isEmpty();
	}

	public ArrayList<Row> generarConsulta(FiltroConsultaCuenta unFiltro){
		
		ArrayList<Row> resultados = new ArrayList<Row>();
		
		for(Row unaRow : rows){
			
			Empresa empresa = unaRow.getEmpresa();
			Cuenta cuenta = unaRow.getCuenta();
			int anio = unaRow.getAnio();
			int valor = unaRow.getValor();
			
			if(empresa.getNombreEmpresa().equals(unFiltro.getEmpresa()) || unFiltro.getEmpresa().equals("Todos")){
				if(cuenta.getNombreCuenta().equals(unFiltro.getCuenta()) || unFiltro.getCuenta().equals("Todos")){
					if(Integer.toString(anio).equals(unFiltro.getAnio()) || unFiltro.getAnio().equals("Todos")){
						
						resultados.add(new Row(empresa,cuenta,anio,valor));
					
					}
				}
			}

		}
		
		return resultados;
		
	}
	
}
