package com.caia.dondeinvierto;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.caia.model.Cuenta;
import com.caia.model.Database;
import com.caia.model.Row;
import com.caia.model.Empresa;
import com.caia.model.FiltroConsultaCuenta;
import com.caia.model.Indicador;
import com.caia.model.Resultado;

@Controller
public class MyController {
	
	private Database database = Database.getInstance();
	private ArrayList<String> empresas = new ArrayList<String>();
	private ArrayList<String> cuentas = new ArrayList<String>();
	private ArrayList<Integer> anios = new ArrayList<Integer>();
	
	/* Acceso a Inicio */
	@RequestMapping("inicio")
	public String irAInicio(ModelMap model){
		model.addAttribute("database", database);
		return "inicio"; 
	}
	
	/* Acceso a Proyectos */
	@RequestMapping("proyectos")
	public String irAProyectos(ModelMap model){
		model.addAttribute("database",database);
		return "proyectos";
	}
	
	/* Acceso a Indicadores */
	@RequestMapping("indicadores")
	public ModelAndView irAIndicadores(ModelMap model){
		ModelAndView newModel = new ModelAndView("indicadores", "command", new Indicador());
		return newModel;
	}
	
	/* Acceso a Consultas */
	@RequestMapping("consultas")
	public ModelAndView irAConsultas(ModelMap model){
		ModelAndView newModel = new ModelAndView("consultas","command",new FiltroConsultaCuenta());
		newModel.addObject("database", database);
		newModel.addObject("empresas",empresas);
		newModel.addObject("cuentas",cuentas);
		newModel.addObject("anios",anios);
		ArrayList<Row> resultados = new ArrayList<Row>();
		newModel.addObject("resultados", resultados);
		return newModel;
	}
	
	/* Generar consulta */
	@RequestMapping(value="generarConsulta", method=RequestMethod.POST)
	public String generarConsulta(@ModelAttribute("SpringWeb") FiltroConsultaCuenta unFiltro, ModelMap model){
		ArrayList<Row> resultados = database.generarConsulta(unFiltro);
		model.addAttribute("resultados", resultados);
		model.addAttribute("command", new FiltroConsultaCuenta());
		return "consultas";
	}
	
	/* Crear indicador */
	@RequestMapping(value="generarIndicador", method=RequestMethod.POST)
	public String generarIndicador(Indicador indicador, ModelMap model){
		model.addAttribute("nombre", indicador.getNombre());
		model.addAttribute("formula", indicador.getFormula());
		return "generarIndicador";
	}
	
	/* Cargar CSV */ 
	@RequestMapping(value="generarProyecto", method = RequestMethod.POST)
	public String generarProyecto(@RequestParam("file") MultipartFile file, ModelMap model) {
		
		if(!file.isEmpty()){
			
			System.out.println(file.getContentType());
			
			if(file.getOriginalFilename().contains(".csv")){
			
				try{
					
					database.vaciar();
					
					model.addAttribute("file",file);
					byte[] bytes = file.getBytes();
					String completeData = new String(bytes);
					String[] rowsFile = completeData.split("#");
					String fileStream = rowsFile[0];
					
					String[] rowsCSV = fileStream.split("\n");
					
					String[] values;
					Empresa empresa;
					Cuenta cuenta;
					int anio;
					int valor;
					for(int i=0; i < rowsCSV.length; i++){
						values = rowsCSV[i].split(",");
						empresa = new Empresa(values[0]);
						
						if (!empresas.contains(empresa.getNombreEmpresa())){
							empresas.add(empresa.getNombreEmpresa());
						}
						
						cuenta = new Cuenta(values[1]);
						
						if(!cuentas.contains(cuenta.getNombreCuenta())){
							cuentas.add(cuenta.getNombreCuenta());
						}
						
						anio = Integer.parseInt(values[2]);
						
						if(!anios.contains(anio)){
							anios.add(anio);
						}
						
						valor = Integer.parseInt(values[3]);
						
						database.addRow(new Row(empresa, cuenta, anio, valor));
					
					}
					
					model.addAttribute("msg",1);
					model.addAttribute("database",database);
					return "proyectos";
					
				} catch(IOException s) {
					
					model.addAttribute("msg",2);
					return "proyectos";
				}
				
			} else {
				
				model.addAttribute("msg",3);
				return "proyectos";
			
			}
		
		} else {
			
			model.addAttribute("msg",4);
			return "proyectos";
			
		}
		
	}
	
}