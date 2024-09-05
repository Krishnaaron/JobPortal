<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Employer</title>
</head>
<body>
    <h1>Register Employer</h1>
    <form id="registerForm">
        <label for="country">Country:</label>
        <select id="country" name="country">
            <option value="">Select Country</option>
            <!-- Options will be populated by JavaScript -->
        </select>
        
        <label for="state">State:</label>
        <select id="state" name="state" disabled>
            <option value="">Select State</option>
            <!-- Options will be populated by JavaScript -->
        </select>
        
        <label for="district">District:</label>
        <select id="district" name="district" disabled>
            <option value="">Select District</option>
            <!-- Options will be populated by JavaScript -->
        </select>
    </form>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const countrySelect = document.getElementById('country');
            const stateSelect = document.getElementById('state');
            const districtSelect = document.getElementById('district');

            const geoNamesUsername = 'YOUR_GEONAMES_USERNAME'; // Replace with your GeoNames username

            // Fetch countries and populate the country select element
            fetch('https://restcountries.com/v3.1/all')
                .then(response => response.json())
                .then(data => {
                    const countries = data.map(item => item.name.common).sort();
                    countries.forEach(country => {
                        const option = document.createElement('option');
                        option.value = country;
                        option.textContent = country;
                        countrySelect.appendChild(option);
                    });
                })
                .catch(error => {
                    console.error('Error fetching countries:', error);
                    alert('Failed to load countries. Please check the console for more details.');
                });

            // Fetch states based on selected country
            countrySelect.addEventListener('change', function() {
                const selectedCountry = countrySelect.value;
                if (!selectedCountry) {
                    stateSelect.disabled = true;
                    districtSelect.disabled = true;
                    stateSelect.innerHTML = '<option value="">Select State</option>';
                    districtSelect.innerHTML = '<option value="">Select District</option>';
                    return;
                }

                // Fetch country GeonameId from GeoNames
                fetch(`http://api.geonames.org/searchJSON?q=${encodeURIComponent(selectedCountry)}&maxRows=1&username=${geoNamesUsername}`)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error(`Network response was not ok: ${response.statusText}`);
                        }
                        return response.json();
                    })
                    .then(data => {
                        if (data.geonames.length === 0) {
                            throw new Error('No data found for the selected country.');
                        }
                        const countryGeonameId = data.geonames[0].geonameId;
                        return fetch(`http://api.geonames.org/childrenJSON?geonameId=${countryGeonameId}&username=${geoNamesUsername}`);
                    })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error(`Network response was not ok: ${response.statusText}`);
                        }
                        return response.json();
                    })
                    .then(data => {
                        const states = data.geonames || [];
                        stateSelect.innerHTML = '<option value="">Select State</option>';
                        states.forEach(state => {
                            const option = document.createElement('option');
                            option.value = state.name;
                            option.textContent = state.name;
                            stateSelect.appendChild(option);
                        });
                        stateSelect.disabled = false;
                        districtSelect.disabled = true;
                        districtSelect.innerHTML = '<option value="">Select District</option>';
                    })
                    .catch(error => {
                        console.error('Error fetching states:', error);
                        stateSelect.innerHTML = '<option value="">Select State</option>';
                        stateSelect.disabled = true;
                        districtSelect.innerHTML = '<option value="">Select District</option>';
                        districtSelect.disabled = true;
                        alert('Failed to load states. Please check the console for more details.');
                    });
            });

            // Fetch districts based on selected state
            stateSelect.addEventListener('change', function() {
                const selectedState = stateSelect.value;
                if (!selectedState) {
                    districtSelect.disabled = true;
                    districtSelect.innerHTML = '<option value="">Select District</option>';
                    return;
                }

                // Fetch state GeonameId from GeoNames
                fetch(`http://api.geonames.org/searchJSON?q=${encodeURIComponent(selectedState)}&maxRows=1&username=${geoNamesUsername}`)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error(`Network response was not ok: ${response.statusText}`);
                        }
                        return response.json();
                    })
                    .then(data => {
                        if (data.geonames.length === 0) {
                            throw new Error('No data found for the selected state.');
                        }
                        const stateGeonameId = data.geonames[0].geonameId;
                        return fetch(`http://api.geonames.org/childrenJSON?geonameId=${stateGeonameId}&username=${geoNamesUsername}`);
                    })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error(`Network response was not ok: ${response.statusText}`);
                        }
                        return response.json();
                    })
                    .then(data => {
                        const districts = data.geonames || [];
                        districtSelect.innerHTML = '<option value="">Select District</option>';
                        districts.forEach(district => {
                            const option = document.createElement('option');
                            option.value = district.name;
                            option.textContent = district.name;
                            districtSelect.appendChild(option);
                        });
                        districtSelect.disabled = false;
                    })
                    .catch(error => {
                        console.error('Error fetching districts:', error);
                        districtSelect.innerHTML = '<option value="">Select District</option>';
                        districtSelect.disabled = true;
                        alert('Failed to load districts. Please check the console for more details.');
                    });
            });
        });
    </script>
</body>
</html>
