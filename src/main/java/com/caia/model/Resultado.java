package com.caia.model;

public class Resultado extends Dato {
	
	private Indicador indicador;
	
	public Resultado(Empresa _empresa, Cuenta _cuenta, int _anio, int _valor, Indicador _indicador){
		super(_empresa, _cuenta, _anio, _valor);
		indicador = _indicador;
	}

	public Indicador getIndicador() {
		return indicador;
	}

	public void setIndicador(Indicador indicador) {
		this.indicador = indicador;
	}
	
}
