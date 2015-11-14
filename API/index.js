var APP_ID = '0WIFgvDjclrIRUZJTD5MjW02iNfv74GkUD78ipC6'
var MASTER_KEY = 'yvPQu3kVMckEBtNi9hBU7FD4R4otxKTU4xrxxsQk'
var API_KEY = 'c6XAhWrtaKZV1ca1Ic93poKgPSeoQZ7IXUz6iTdY'

var Parse = require('node-parse-api').Parse
var Express = require('express')
var BodyParser = require('body-parser')


var parse = new Parse(APP_ID, MASTER_KEY)

var app = Express()
app.use(BodyParser.json())

app.get('/', function(req, res){
	res.send("Hello World")
	
})

app.post('/post', function(req, res){
	var post_data = req.body
	
	//need to clean post_data
	parse.insert('Post', post_data, function(err, response){
		res.send(response)
	})
})

app.get('/post', function(req, res){
	parse.find('Post','', function(err, response){
		res.send(response)
	})
})

app.listen(80) // listen on port 80

console.log('executed')