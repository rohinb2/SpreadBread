var request = require('request');

var sortPlacesByClosingTime = function(places) {

	var date = new Date();

	places.sort(function(a, b) {

		if (a.close - parseInt(date.getTime()) > 0 && b.close - parseInt(date.getTime()) > 0 && a.close - parseInt(date.getTime()) < b.close - parseInt(date.getTime())) {

			return -1;

		}
		else if (a.close - parseInt(date.getTime()) > 0 && b.close - parseInt(date.getTime()) > 0 && b.close - parseInt(date.getTime()) < a.close - parseInt(date.getTime())) {

			return 1;

		}
		else {

			return 0;

		}

	});

	return places;

};

var timeFunc = function(t){

	var date = new Date();

	var time = t;
	var hours = Number(time.match(/^(\d+)/)[1]);
	var minutes = Number(time.match(/:(\d+)/)[1]);
	var AMPM = time.match(/\s(.*)$/)[1];
	if(AMPM == "PM" && hours<12) hours = hours+12;
	if(AMPM == "AM" && hours==12) hours = hours-12;
	var sHours = hours.toString();
	var sMinutes = minutes.toString();
	if(hours<10) sHours = "0" + sHours;
	if(minutes<10) sMinutes = "0" + sMinutes;
	var n = Date.parse(date.toString().split("2017 ")[0] + "2017 " + sHours + ":" + sMinutes + ":00 " + "GMT" + date.toString().split("GMT")[1]);
	return (parseInt(n.toString()));

};

var dayToDay = [ 6, 0, 1, 2, 3, 4, 5 ];

var placesAndTimes = [];

var iterateThroughPlaces = function(jsonObject, index, date) {

	if (index < jsonObject.results.length) {

		request("https://maps.googleapis.com/maps/api/place/details/json?placeid=" + jsonObject.results[index].place_id + "&key=AIzaSyA35nV_qWTM5w1j4b-evjWUbNO2Eh9rmzU", function(err1, res1, body1){

				var placesJSON1 = JSON.parse(body1);

				if (!(placesJSON1.result.opening_hours.weekday_text[dayToDay[date.getDay()]].split(": ")[1].indexOf(",") != -1 ||
						placesJSON1.result.opening_hours.weekday_text[dayToDay[date.getDay()]].split(": ")[1].indexOf("Closed") != -1 ||
							placesJSON1.result.opening_hours.weekday_text[dayToDay[date.getDay()]].split(": ")[1].indexOf("Open") != -1)) {

					placesAndTimes.push({
						name: jsonObject.results[index].name,
						latitude: jsonObject.results[index].geometry.location.lat,
						longitude: jsonObject.results[index].geometry.location.lng,
						close: timeFunc(placesJSON1.result.opening_hours.weekday_text[dayToDay[date.getDay()]].split(": ")[1].split(" – ")[1])
					});

				}

				iterateThroughPlaces(jsonObject, index + 1, date);

		});

	}
	else {

		console.log(sortPlacesByClosingTime(placesAndTimes));

	}

};

request("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.0911887, -88.2402235&radius=8000&type=restaurant&key=AIzaSyA35nV_qWTM5w1j4b-evjWUbNO2Eh9rmzU", function(err, res, body) {

	var date = new Date();
	//console.log(date.getTime())
	var placesJSON = JSON.parse(body);

	iterateThroughPlaces(placesJSON, 0, date);

});