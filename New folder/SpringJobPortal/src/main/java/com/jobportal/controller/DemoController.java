package com.jobportal.controller;
import java.util.Arrays;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.jobportal.model.ChartValues;

@Controller
public class DemoController
{
   
	ChartValues chartValues = new ChartValues();
   
	@PostMapping("/dispalyChart")
	public void displayChart() {
		
		chartValues.setChartType("area");
		chartValues.setTitle("'US and USSR nuclear stockpiles");
		chartValues.setxAxisTitle("years");
		chartValues.setyAxisTitle("'Nuclear weapon states");
		chartValues.setxCategory(Arrays.asList(150, 250, 350, 450, 550, 650, 750, 850, 950, 1050));
		
		JSONObject chartData = new JSONObject();
		JSONObject chart = new JSONObject();
		chart.put("type", chartValues.getChartType());
		chartData.put("chart", chart);
		  JSONObject title = new JSONObject();
		  title.put("text", chartValues.getTitle());
		  chartData.put("title", title);
		  
		  
	}
	
}
