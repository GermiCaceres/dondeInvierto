package com.caia.model;

import java.util.ArrayList;

public class DataBase {
	
	ArrayList<Dato> datos = new ArrayList<Dato>();
	
	public void addRow(Dato unDato){
		datos.add(unDato);
	}
	
	public void vaciar(){
		datos.clear();
	}
	
	public ArrayList<Dato> getDatos() {
		return datos;
	}

	public boolean esVacio() {
		return datos.isEmpty();
	}

	public ArrayList<Resultado> generarConsulta(FiltroConsulta unFiltro){
		
		ArrayList<Resultado> resultados = new ArrayList<Resultado>();
		
		for(Dato unDato : datos){
			
			Empresa empresa = unDato.getEmpresa();
			Cuenta cuenta = unDato.getCuenta();
			int anio = unDato.getAnio();
			int valor = unDato.getValor();
			
			if(empresa.getNombreEmpresa().equals(unFiltro.getEmpresa()) || unFiltro.getEmpresa().equals("Todos")){
				if(cuenta.getNombreCuenta().equals(unFiltro.getCuenta()) || unFiltro.getCuenta().equals("Todos")){
					if(Integer.toString(anio).equals(unFiltro.getAnio()) || unFiltro.getAnio().equals("Todos")){
						
						resultados.add(new Resultado(empresa,cuenta,anio,valor,null));
					
					}
				}
			}

		}
		
		return resultados;
		
	}
	
}
