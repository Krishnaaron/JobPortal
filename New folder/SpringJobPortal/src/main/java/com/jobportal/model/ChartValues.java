package com.jobportal.model;

import java.util.List;

public class ChartValues
{
	private String			chartType;

	private String			title;

	private String			xAxisTitle;

	private String			yAxisTitle;

	private List<Integer>	xCategory;

	public String getChartType()
	{
		return chartType;
	}

	public void setChartType(String chartType)
	{
		this.chartType = chartType;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getxAxisTitle()
	{
		return xAxisTitle;
	}

	public void setxAxisTitle(String xAxisTitle)
	{
		this.xAxisTitle = xAxisTitle;
	}

	public String getyAxisTitle()
	{
		return yAxisTitle;
	}

	public void setyAxisTitle(String yAxisTitle)
	{
		this.yAxisTitle = yAxisTitle;
	}

	public List<Integer> getxCategory()
	{
		return xCategory;
	}

	public void setxCategory(List<Integer> xCategory)
	{
		this.xCategory = xCategory;
	}

}
