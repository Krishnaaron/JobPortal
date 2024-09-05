package com.jobportal.model;

import java.util.List;

public class ChartVal
{
	 private String chartType;
	    private String title;
	    private String filterCondition;
	    private int filterValue;
	    private String yAxisTitle;
	    private String xAxisTitle;
	    private List<Integer> xCategory;

	    // Constructor
	    public ChartVal(String chartType, String title, String filterCondition, int filterValue, 
	                       String yAxisTitle, String xAxisTitle, List<Integer> xCategory) {
	        this.chartType = chartType;
	        this.title = title;
	        this.filterCondition = filterCondition;
	        this.filterValue = filterValue;
	        this.yAxisTitle = yAxisTitle;
	        this.xAxisTitle = xAxisTitle;
	        this.xCategory = xCategory;
	    }

	    // Default constructor
	    public ChartVal() {
	    }

	    // Getters and setters
	    public String getChartType() {
	        return chartType;
	    }

	    public void setChartType(String chartType) {
	        this.chartType = chartType;
	    }

	    public String getTitle() {
	        return title;
	    }

	    public void setTitle(String title) {
	        this.title = title;
	    }

	    public String getFilterCondition() {
	        return filterCondition;
	    }

	    public void setFilterCondition(String filterCondition) {
	        this.filterCondition = filterCondition;
	    }

	    public int getFilterValue() {
	        return filterValue;
	    }

	    public void setFilterValue(int filterValue) {
	        this.filterValue = filterValue;
	    }

	    public String getyAxisTitle() {
	        return yAxisTitle;
	    }

	    public void setyAxisTitle(String yAxisTitle) {
	        this.yAxisTitle = yAxisTitle;
	    }

	    public String getxAxisTitle() {
	        return xAxisTitle;
	    }

	    public void setxAxisTitle(String xAxisTitle) {
	        this.xAxisTitle = xAxisTitle;
	    }

	    public List<Integer> getxCategory() {
	        return xCategory;
	    }

	    public void setxCategory(List<Integer> xCategory) {
	        this.xCategory = xCategory;
	    }
}
