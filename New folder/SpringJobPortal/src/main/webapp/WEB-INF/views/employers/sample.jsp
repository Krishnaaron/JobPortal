<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Address Autocomplete Dropdown Form</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        .autocomplete-dropdown {
            position: absolute;
            z-index: 1000;
            background: white;
            border: 1px solid #ccc;
            width: 100%;
        }
        .autocomplete-item {
            padding: 10px;
            cursor: pointer;
        }
        .autocomplete-item:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <form id="addressForm">
            <div class="form-group">
                <label for="autocomplete">Address:</label>
                <input id="autocomplete" class="form-control" placeholder="Enter your address" type="text" />
                <div id="autocomplete-dropdown" class="autocomplete-dropdown"></div>
            </div>
            <div class="form-group">
                <label for="street_number">Street Number:</label>
                <input id="street_number" class="form-control" disabled="true" />
            </div>
            <div class="form-group">
                <label for="route">Street Name:</label>
                <input id="route" class="form-control" disabled="true" />
            </div>
            <div class="form-group">
                <label for="locality">City:</label>
                <input id="locality" class="form-control" disabled="true" />
            </div>
            <div class="form-group">
                <label for="administrative_area_level_1">State:</label>
                <input id="administrative_area_level_1" class="form-control" disabled="true" />
            </div>
            <div class="form-group">
                <label for="postal_code">Zip Code:</label>
                <input id="postal_code" class="form-control" disabled="true" />
            </div>
            <div class="form-group">
                <label for="country">Country:</label>
                <input id="country" class="form-control" disabled="true" />
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <script>
        function initAutocomplete() {
            var autocompleteService = new google.maps.places.AutocompleteService();
            var input = document.getElementById('autocomplete');
            var dropdown = document.getElementById('autocomplete-dropdown');

            input.addEventListener('input', function() {
                var value = input.value;

                if (value.length > 0) {
                    autocompleteService.getPlacePredictions({ input: value }, function(predictions, status) {
                        if (status === google.maps.places.PlacesServiceStatus.OK) {
                            dropdown.innerHTML = '';
                            predictions.forEach(function(prediction) {
                                var div = document.createElement('div');
                                div.textContent = prediction.description;
                                div.classList.add('autocomplete-item');
                                div.addEventListener('click', function() {
                                    input.value = prediction.description;
                                    dropdown.innerHTML = '';
                                    fillInAddress(prediction.place_id);
                                });
                                dropdown.appendChild(div);
                            });
                        } else {
                            console.error('Autocomplete service error: ' + status);
                        }
                    });
                } else {
                    dropdown.innerHTML = '';
                }
            });
        }

        function fillInAddress(placeId) {
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode({ 'placeId': placeId }, function(results, status) {
                if (status === google.maps.GeocoderStatus.OK) {
                    var place = results[0];

                    var componentForm = {
                        street_number: 'short_name',
                        route: 'long_name',
                        locality: 'long_name',
                        administrative_area_level_1: 'short_name',
                        country: 'long_name',
                        postal_code: 'short_name'
                    };

                    for (var component in componentForm) {
                        document.getElementById(component).value = '';
                        document.getElementById(component).disabled = false;
                    }

                    for (var i = 0; i < place.address_components.length; i++) {
                        var addressType = place.address_components[i].types[0];
                        if (componentForm[addressType]) {
                            var val = place.address_components[i][componentForm[addressType]];
                            document.getElementById(addressType).value = val;
                        }
                    }
                } else {
                    console.error('Geocode service error: ' + status);
                }
            });
        }

        document.addEventListener("DOMContentLoaded", function() {
            initAutocomplete();
        });
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places&callback=initAutocomplete"></script>
</body>
</html>