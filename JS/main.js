//Run on page load
$(document).ready(function () {
	//Click listener for search button.
	$('body').on('click', '#runSearch', function () {
		runSearch ($('#searchBy').val(), $('#searchBar').val());
	});
	$('#searchBar').on('keyup', function (e) {
	    if (e.keyCode == 13) {
		    runSearch ($('#searchBy').val(), $('#searchBar').val());
	    }
    });
	//Parent part search. AJAX to the searchDB.php file, which executes the query to the database.
	function runSearch (field, term) {
		//Type is either 'parent' or 'child'.
		var json_data = {'type': 'parent', 'field': field, 'term': term};
		$.ajax({
			type: 'GET',
			url: 'PHP/searchDB.php',
			data: json_data,
			dataType: 'json',
			success: function (results) {
				parseResults (results);
			},
	        error: function (jqXhr, textStatus, errorThrown) {
				alert('Error retrieving items');
	        }
		});
	}
	//Parses the parent part search results
	function parseResults (results) {
		$('#resultsBox').empty();
		$.each(results, function(i, v) {
			//Creates a container and sets up a sub container for child parts to be put into at the end of this function.
			$('#resultsBox').append(
				'<div class="parentBlock"><span class="title">' + v['partName'] + '</span>' +
				'<br>Part Type: Parent Part' +
				'<br>Part Number: ' + v['partNumber'] +
				'<br>Description: ' + v['partDescription'] +
				'<br><br><div class="childrenBox" id="' + v['id'] +
				'"></div></div><br><br>'
			);
			getChildren (v['id']);
		});
	}
	//Child part search. Pulls all children of the given parent part id. 
	function getChildren (parentID) {
		//Type is either 'parent' or 'child'.
		var json_data = {'type': 'child', 'term': parentID};
		$.ajax({
			type: 'GET',
			url: 'PHP/searchDB.php',
			data: json_data,
			dataType: 'json',
			success: function (results) {
				parseChildResults (parentID, results);
			},
	        error: function (jqXhr, textStatus, errorThrown) {
				alert('Error retrieving items');
	        }
		});
	}
	function parseChildResults (parentID, results) {
		$.each(results, function(i, v) {
			//Pulls the id for the child container from the parent container. Then appends each child part result into that child container.
			$('#' + parentID).append(
				'<div class="childBlock"><span class="title">' + v['partName'] + '</span>' +
				'<br>Part Type: Child Part' +
				'<br>Part Number: ' + v['partNumber'] +
				'<br>Description: ' + v['partDescription'] +
				'</div><br>'
			);
		});
	}
});