casper.test.begin('Test', function(test) {
	var ok = 5,
		ok2 = ['0'];

	casper.start("https://www.google.fr/")
	.then(function() {
		var page = require('webpage').create();
		page.open("https://www.google.co.uk/", function()  {
			ok2.push(
				this.evaluate(function() {
					return [].map.call(
						document.querySelectorAll('form'), function(a) { return a.textContent; }
					);
				})
			);
			console.log("ok$: " + ok);
			console.log("ok2$: " + ok);
		});
		console.log("ok*: " + ok);
		console.log("ok2*: " + ok2);
	})
	.thenOpen("https://www.google.co.uk/", function() {
		var ok3 = this.evaluate(function() {
			return [].map.call(
				document.querySelectorAll('form input[name="btnK"]'), function(a) { return a.getAttribute('value'); }
			);
		});
		console.log("ok3: " + ok3);
	})
	.then(function() {
		// ok2.push('2');
		console.log("ok: " + ok);
		console.log("ok2: " + ok2);
	})
	.run(function() {
		test.done();
	})
});