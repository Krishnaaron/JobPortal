package com.jobportal.controller;
import java.util.Arrays;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import com.jobportal.model.ChartVal;

public class ChartGenerator
{
	 public String generateChartData(ChartVal chartVal) {
        JSONObject chartData = new JSONObject();
        
        // Set chart type
        JSONObject chart = new JSONObject();
        chart.put("type", chartVal.getChartType());
        chartData.put("chart", chart);
        
        // Set chart title
        JSONObject title = new JSONObject();
        title.put("text", chartVal.getTitle());
        chartData.put("title", title);
        
        // Prepare categories
        JSONArray categoriesArray = new JSONArray();
        List<Integer> categories = Arrays.asList(100, 200, 300, 400, 500, 600, 700, 800, 900, 1000);
        
        String condition = chartVal.getFilterCondition();
        int filterValue = chartVal.getFilterValue();
        
        for (Integer category : categories) {
            if (condition == null || shouldIncludeCategory(condition, category, filterValue)) {
                categoriesArray.put(category);
            }
        }
        
        // Set xAxis
        JSONObject xAxis = new JSONObject();
        xAxis.put("categories", categoriesArray);
        chartData.put("xAxis", xAxis);
        
        // Set yAxis title
        JSONObject yAxisTitle = new JSONObject();
        yAxisTitle.put("text", chartVal.getyAxisTitle());
        JSONObject yAxis = new JSONObject();
        yAxis.put("title", yAxisTitle);
        chartData.put("yAxis", yAxis);
        
        // Prepare series data
        JSONArray seriesArray = new JSONArray();
        JSONObject series = new JSONObject();
        series.put("name", chartVal.getxAxisTitle());
        
        JSONArray dataArray = new JSONArray();
        List<Integer> dataValues = chartVal.getxCategory();
        
        for (Integer value : dataValues) {
            if (condition == null || shouldIncludeCategory(condition, value, filterValue)) {
                dataArray.put(value);
            }
        }
        
        series.put("data", dataArray);
        seriesArray.put(series);
        chartData.put("series", seriesArray);
        
        return chartData.toString();
    }
    
    private boolean shouldIncludeCategory(String condition, int category, int filterValue) {
        switch (condition) {
            case "greater":
                return category > filterValue;
            case "less":
                return category < filterValue;
            case "equal":
                return category == filterValue;
            default:
                return false;
        }
    }
}
