var request = require('request');

var shelters = [];

var iterateThroughShelters = function(jsonObject, index) {

	if (index < jsonObject.results.length) {

		request("https://maps.googleapis.com/maps/api/place/details/json?placeid=" + jsonObject.results[index].place_id + "&key=AIzaSyA35nV_qWTM5w1j4b-evjWUbNO2Eh9rmzU", function(err1, res1, body1){

				var placesJSON1 = JSON.parse(body1);

					shelters.push({
						name: jsonObject.results[index].name,
						latitude: jsonObject.results[index].geometry.location.lat,
						longitude: jsonObject.results[index].geometry.location.lng
					});

				iterateThroughShelters(jsonObject, index + 1);

		});

	}
	else {

		console.log(shelters);

	}

};

request("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.0911887, -88.2402235&radius=8000&keyword=shelter&key=AIzaSyA35nV_qWTM5w1j4b-evjWUbNO2Eh9rmzU", function(err, res, body) {

	var placesJSON = JSON.parse(body);

	iterateThroughShelters(placesJSON, 0);

});