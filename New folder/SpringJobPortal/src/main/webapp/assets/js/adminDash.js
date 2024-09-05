document.addEventListener('DOMContentLoaded', function () {
    const data = window.chartData;

    function initializeChart(type, data) {
        Highcharts.chart('m1', {
            chart: {
                type: type
            },
            navigation: {
                buttonOptions: {
                    theme: {
                        style: {
                            fontSize: '10px',
                            color: '#888'
                        },
                        states: {
                            hover: {
                                style: {
                                    color: '#000'
                                }
                            }
                        }
                    },
                    useHTML: true
                }
            },
            exporting: {
                buttons: {
                    contextButton: {
                        enabled: false
                    },
                    tableButton: {
                        text: '<i class="fa fa-table" aria-hidden="true"></i>',
                        onclick: function() {
                            if (this.dataTableDiv && this.dataTableDiv.style.display !== 'none') {
                                this.dataTableDiv.style.display = 'none';
                            } else {
                                this.viewData();
                                this.dataTableDiv.style.display = '';
                            }
                        }
                    },
                    filterButton: {
                        text: '<i class="fa fa-filter"></i>',
                        onclick: function () {
                            const filterPanel = document.getElementById('filterPanel');
                            if (filterPanel) {
                                filterPanel.style.display = filterPanel.style.display === 'none' ? 'block' : 'none';
                            } else {
                                console.error('Filter panel element not found.');
                            }
                        }
                    },
                    exportButton: {
                        text: '<i class="fa fa-download"></i>',
                        menuItems: [
                            'downloadPNG',
                            'downloadJPEG',
                            'downloadPDF',
                            'downloadSVG'
                        ]
                    },
                    printButton: {
                        text: '<i class="fa fa-print"></i>',
                        onclick: function () {
                            this.print();
                        }
                    }
                }
            },
            title: {
                text: 'Job Portal Data'
            },
            credits: {
                enabled: false
            },
            xAxis: type === 'pie' ? undefined : { categories: ['Employers', 'Job Seekers', 'Jobs', 'Applications'] },
            yAxis: type === 'pie' ? undefined : { title: { text: 'Count' } },
            series: [{
                name: 'Counts',
                data: type === 'pie' ? [
                    ['Employers', data.numberOfEmployers],
                    ['Job Seekers', data.numberOfJobSeekers],
                    ['Jobs', data.numberOfJobs],
                    ['Applications', data.numberOfApplications]
                ] : [
                    { name: 'Employers', y: data.numberOfEmployers },
                    { name: 'Job Seekers', y: data.numberOfJobSeekers },
                    { name: 'Jobs', y: data.numberOfJobs },
                    { name: 'Applications', y: data.numberOfApplications }
                ],
                colorByPoint: type === 'pie'
            }],
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '{point.name}: {point.y}'
                    }
                },
                bar: {
                    dataLabels: {
                        enabled: true
                    }
                },
                line: {
                    dataLabels: {
                        enabled: true
                    }
                }
            }
        });
    }

    // Event listener for the filter button
    document.getElementById('applyFilter').addEventListener('click', function() {
        const filterCondition = document.getElementById('filterCondition').value;
        const filterValue = document.getElementById('filterValue').value;
        const chartType = document.getElementById('chartType').value;

        console.log('Filter Condition:', filterCondition);
        console.log('Filter Value:', filterValue);

        // Initialize chart with selected type and data
        initializeChart(chartType, data);
    });

    // Initial chart load
    initializeChart('pie', data);  // Default to pie chart
});
